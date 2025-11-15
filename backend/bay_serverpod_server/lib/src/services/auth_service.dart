import 'dart:convert';
import 'dart:math';

import 'package:serverpod/serverpod.dart';

import '../generated/auth_payloads.dart';
import '../generated/dispute.dart';
import '../generated/platform_settings.dart';
import '../generated/user_profile.dart';
import 'dispute_service.dart';
import 'invitation_service.dart';
import 'password_service.dart';
import 'platform_settings_service.dart';

class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  final PasswordService _passwords = PasswordService.instance;
  final PlatformSettingsService _settings =
      PlatformSettingsService.instance;
  final DisputeService _disputes = DisputeService.instance;

  final Map<int, _StoredUser> _usersById = {};
  final Map<String, _StoredUser> _usersByEmail = {};
  final Map<String, _SessionRecord> _sessionsByToken = {};

  final Random _random = Random.secure();

  int _userCounter = 1;

  Future<AuthResponse> register(
    Session session,
    RegisterRequest request,
  ) async {
    final normalizedEmail = request.email.trim().toLowerCase();
    if (!normalizedEmail.contains('@')) {
      throw Exception('Ungültige E-Mail-Adresse.');
    }
    final settings = _settings.state;
    if (!settings.registrationEnabled) {
      if (request.inviteCode == null ||
          !InvitationService.instance.consume(request.inviteCode!)) {
        throw Exception(
          'Registrierung ist deaktiviert. Eine gültige Einladung ist notwendig.',
        );
      }
    }
    if (_usersByEmail.containsKey(normalizedEmail)) {
      throw Exception('E-Mail ist bereits registriert.');
    }
    final salt = _passwords.generateSalt();
    final hashed = _passwords.hashPassword(request.password, salt);

    final newUser = _StoredUser(
      id: _userCounter++,
      email: normalizedEmail,
      passwordHash: hashed,
      salt: salt,
      displayName: request.displayName?.trim(),
      role: _usersById.isEmpty ? 'admin' : 'user',
      isActive: true,
      createdAt: DateTime.now().toUtc(),
      updatedAt: DateTime.now().toUtc(),
    );
    _usersById[newUser.id] = newUser;
    _usersByEmail[normalizedEmail] = newUser;

    return _issueAuthResponse(newUser, session);
  }

  Future<AuthResponse> login(Session session, LoginRequest request) async {
    final normalizedEmail = request.email.trim().toLowerCase();
    final user = _usersByEmail[normalizedEmail];
    if (user == null) {
      throw Exception('Benutzer nicht gefunden.');
    }
    if (!user.isActive) {
      throw Exception('Benutzer ist deaktiviert.');
    }
    final valid = _passwords.verify(
      request.password,
      user.salt,
      user.passwordHash,
    );
    if (!valid) {
      throw Exception('Falsches Passwort.');
    }
    return _issueAuthResponse(user, session);
  }

  Future<void> logout(String token) async {
    _sessionsByToken.remove(token);
  }

  Future<AuthResponse> refresh(String token, Session session) async {
    final sessionRecord = _sessionsByToken[token];
    if (sessionRecord == null) {
      throw Exception('Session existiert nicht.');
    }
    final user = _usersById[sessionRecord.userId];
    if (user == null) {
      throw Exception('Benutzer existiert nicht.');
    }
    _sessionsByToken.remove(token);
    return _issueAuthResponse(user, session);
  }

  Future<UserProfile> currentUser(String token) async {
    final record = _sessionsByToken[token];
    if (record == null) throw Exception('Token ungültig.');
    final user = _usersById[record.userId];
    if (user == null) throw Exception('Benutzer nicht gefunden.');
    return user.profile;
  }

  Future<UserProfile> updateProfile(UpdateProfileRequest request) async {
    final user = await _userFromToken(request.token);
    final updated = user.copyWith(
      displayName: request.displayName ?? user.displayName,
    )..updatedAt = DateTime.now().toUtc();
    _usersById[user.id] = updated;
    _usersByEmail[updated.email] = updated;
    return updated.profile;
  }

  List<UserProfile> listUsers(String token) {
    final current = _userFromTokenSync(token);
    _ensureRole(current, 'admin');
    return _usersById.values.map((u) => u.profile).toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
  }

  UserProfile setRole(UpdateUserRoleRequest request) {
    final current = _userFromTokenSync(request.adminToken);
    _ensureRole(current, 'admin');
    final user = _usersById[request.userId];
    if (user == null) throw Exception('Benutzer existiert nicht.');
    final updated = user.copyWith(role: request.role)
      ..updatedAt = DateTime.now().toUtc();
    _usersById[user.id] = updated;
    _usersByEmail[updated.email] = updated;
    return updated.profile;
  }

  PlatformSettings getSettings(String token) {
    final current = _userFromTokenSync(token);
    _ensureRole(current, 'admin');
    return _settings.state;
  }

  PlatformSettings updateSettings(UpdatePlatformSettingsRequest request) {
    final current = _userFromTokenSync(request.adminToken);
    _ensureRole(current, 'admin');
    return _settings.update(request.settings);
  }

  List<Dispute> listDisputes(String token) {
    final current = _userFromTokenSync(token);
    _ensureRole(current, 'moderator');
    return _disputes.listOpen();
  }

  Dispute resolveDispute(ResolveDisputeRequest request) {
    final moderator = _userFromTokenSync(request.moderatorToken);
    _ensureRole(moderator, 'moderator');
    return _disputes.resolve(
      request,
      moderator: moderator.profile,
    );
  }

  Dispute createDispute(CreateDisputeRequest request) {
    final user = _userFromTokenSync(request.token);
    return _disputes.createDispute(user.profile, request);
  }

  List<Dispute> myDisputes(String token) {
    final user = _userFromTokenSync(token);
    return _disputes.listForUser(user.id);
  }

  _StoredUser _userFromTokenSync(String token) {
    final sessionRecord = _sessionsByToken[token];
    if (sessionRecord == null) {
      throw Exception('Token ungültig.');
    }
    final user = _usersById[sessionRecord.userId];
    if (user == null) throw Exception('Benutzer existiert nicht.');
    return user;
  }

  Future<_StoredUser> _userFromToken(String token) async {
    return _userFromTokenSync(token);
  }

  void _ensureRole(_StoredUser user, String requiredRole) {
    const priority = {'user': 1, 'moderator': 2, 'admin': 3};
    final currentScore = priority[user.role] ?? 0;
    final requiredScore = priority[requiredRole] ?? 0;
    if (currentScore < requiredScore) {
      throw Exception('Keine Berechtigung für diese Aktion.');
    }
  }

  AuthResponse _issueAuthResponse(_StoredUser user, Session session) {
    final token = _generateToken();
    final record = _SessionRecord(
      token: token,
      userId: user.id,
      createdAt: DateTime.now().toUtc(),
      expiresAt: DateTime.now().toUtc().add(const Duration(hours: 12)),
      ipAddress: session.httpRequest
          ?.connectionInfo?.remoteAddress.address,
      userAgent: session.httpRequest?.headers.value('user-agent'),
    );
    _sessionsByToken[token] = record;
    return AuthResponse(
      token: token,
      expiresAt: record.expiresAt,
      user: user.profile,
    );
  }

  String _generateToken() {
    final bytes = List<int>.generate(32, (_) => _random.nextInt(256));
    return base64Url.encode(bytes);
  }
}

class _StoredUser {
  _StoredUser({
    required this.id,
    required this.email,
    required this.passwordHash,
    required this.salt,
    required this.role,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.displayName,
  });

  final int id;
  final String email;
  final String passwordHash;
  final String salt;
  final String role;
  final bool isActive;
  final DateTime createdAt;
  DateTime updatedAt;
  String? displayName;

  UserProfile get profile => UserProfile(
        id: id,
        email: email,
        displayName: displayName,
        role: role,
        isActive: isActive,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  _StoredUser copyWith({
    String? role,
    String? displayName,
  }) {
    return _StoredUser(
      id: id,
      email: email,
      passwordHash: passwordHash,
      salt: salt,
      role: role ?? this.role,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
      displayName: displayName ?? this.displayName,
    );
  }
}

class _SessionRecord {
  _SessionRecord({
    required this.token,
    required this.userId,
    required this.createdAt,
    required this.expiresAt,
    this.ipAddress,
    this.userAgent,
  });

  final String token;
  final int userId;
  final DateTime createdAt;
  final DateTime expiresAt;
  final String? ipAddress;
  final String? userAgent;
}
