import 'dart:math';

import 'models.dart';

abstract class AuthApi {
  Future<AuthResponse> register(RegisterPayload payload);
  Future<AuthResponse> login(LoginPayload payload);
  Future<void> logout(String token);
  Future<AuthResponse> refresh(String token);
  Future<UserProfile> updateProfile(UpdateProfilePayload payload);
  Future<List<UserProfile>> listUsers(String token);
  Future<UserProfile> setUserRole({
    required String adminToken,
    required int userId,
    required String role,
  });
  Future<PlatformSettings> getSettings(String token);
  Future<PlatformSettings> updateSettings({
    required String adminToken,
    required PlatformSettings settings,
  });
  Future<Dispute> createDispute({
    required String token,
    required String title,
    required String description,
  });
  Future<List<Dispute>> myDisputes(String token);
  Future<List<Dispute>> listDisputes(String moderatorToken);
  Future<Dispute> resolveDispute({
    required String moderatorToken,
    required int disputeId,
    String? resolutionNote,
  });
  Future<Invitation> requestInvite({
    required String email,
    String? message,
  });
}

class MockAuthApi implements AuthApi {
  final Map<int, _MockUser> _users = {};
  final Map<String, _MockSession> _sessions = {};
  final Map<int, Dispute> _disputes = {};
  final Map<String, Invitation> _invites = {};
  int _userCounter = 1;
  int _disputeCounter = 1;

  PlatformSettings _settings = PlatformSettings(
    guestAccessEnabled: true,
    registrationEnabled: true,
  );

  final Random _random = Random();

  @override
  Future<AuthResponse> register(RegisterPayload payload) async {
    final email = payload.email.trim().toLowerCase();
    if (!email.contains('@')) {
      throw Exception('Bitte gültige E-Mail eingeben.');
    }
    if (!_settings.registrationEnabled) {
      final invite = payload.inviteCode;
      if (invite == null || !_invites.containsKey(invite)) {
        throw Exception('Registrierung ist deaktiviert. Einladung notwendig.');
      }
      _invites.remove(invite);
    }
    if (_users.values.any((u) => u.email == email)) {
      throw Exception('E-Mail wird bereits verwendet.');
    }
    final salt = _generateToken();
    final hash = _hashPassword(payload.password, salt);
    final user = _MockUser(
      id: _userCounter++,
      email: email,
      salt: salt,
      hash: hash,
      role: _users.isEmpty ? 'admin' : 'user',
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      displayName: payload.displayName,
    );
    _users[user.id] = user;
    return _issueSession(user);
  }

  @override
  Future<AuthResponse> login(LoginPayload payload) async {
    final email = payload.email.trim().toLowerCase();
    final user = _users.values.firstWhere(
      (u) => u.email == email,
      orElse: () => throw Exception('Benutzer nicht gefunden.'),
    );
    if (!_verifyPassword(payload.password, user.salt, user.hash)) {
      throw Exception('Falsches Passwort.');
    }
    return _issueSession(user);
  }

  @override
  Future<void> logout(String token) async {
    _sessions.remove(token);
  }

  @override
  Future<AuthResponse> refresh(String token) async {
    final session = _sessions[token];
    if (session == null) throw Exception('Session ungültig.');
    final user = _users[session.userId];
    if (user == null) throw Exception('Benutzer existiert nicht.');
    _sessions.remove(token);
    return _issueSession(user);
  }

  @override
  Future<UserProfile> updateProfile(UpdateProfilePayload payload) async {
    final user = _requireUser(payload.token);
    final updated = user.copyWith(displayName: payload.displayName)
      ..updatedAt = DateTime.now();
    _users[user.id] = updated;
    return updated.toProfile();
  }

  @override
  Future<List<UserProfile>> listUsers(String token) async {
    final user = _requireUser(token);
    _ensureRole(user, 'admin');
    return _users.values.map((e) => e.toProfile()).toList();
  }

  @override
  Future<UserProfile> setUserRole({
    required String adminToken,
    required int userId,
    required String role,
  }) async {
    final admin = _requireUser(adminToken);
    _ensureRole(admin, 'admin');
    final user = _users[userId];
    if (user == null) throw Exception('Benutzer nicht gefunden.');
    final updated = user.copyWith(role: role)..updatedAt = DateTime.now();
    _users[user.id] = updated;
    return updated.toProfile();
  }

  @override
  Future<PlatformSettings> getSettings(String token) async {
    final user = _requireUser(token);
    _ensureRole(user, 'admin');
    return _settings;
  }

  @override
  Future<PlatformSettings> updateSettings({
    required String adminToken,
    required PlatformSettings settings,
  }) async {
    final user = _requireUser(adminToken);
    _ensureRole(user, 'admin');
    _settings = settings;
    return _settings;
  }

  @override
  Future<Dispute> createDispute({
    required String token,
    required String title,
    required String description,
  }) async {
    final user = _requireUser(token);
    final dispute = Dispute(
      id: _disputeCounter++,
      title: title,
      description: description,
      status: 'open',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _disputes[dispute.id] = dispute;
    return dispute;
  }

  @override
  Future<List<Dispute>> myDisputes(String token) async {
    _requireUser(token);
    return _disputes.values.toList();
  }

  @override
  Future<List<Dispute>> listDisputes(String moderatorToken) async {
    final user = _requireUser(moderatorToken);
    _ensureRole(user, 'moderator');
    return _disputes.values.toList();
  }

  @override
  Future<Dispute> resolveDispute({
    required String moderatorToken,
    required int disputeId,
    String? resolutionNote,
  }) async {
    final user = _requireUser(moderatorToken);
    _ensureRole(user, 'moderator');
    final dispute = _disputes[disputeId];
    if (dispute == null) throw Exception('Dispute nicht gefunden.');
    final resolved = Dispute(
      id: dispute.id,
      title: dispute.title,
      description: dispute.description,
      status: 'resolved',
      createdAt: dispute.createdAt,
      updatedAt: DateTime.now(),
      resolutionNote: resolutionNote,
    );
    _disputes[disputeId] = resolved;
    return resolved;
  }

  @override
  Future<Invitation> requestInvite({
    required String email,
    String? message,
  }) async {
    final invite = Invitation(
      code: _generateToken().substring(0, 10).toUpperCase(),
      email: email,
      expiresAt: DateTime.now().add(const Duration(days: 7)),
      message: message,
    );
    _invites[invite.code] = invite;
    return invite;
  }

  _MockUser _requireUser(String token) {
    final session = _sessions[token];
    if (session == null) throw Exception('Bitte erneut anmelden.');
    final user = _users[session.userId];
    if (user == null) throw Exception('Benutzer existiert nicht.');
    return user;
  }

  void _ensureRole(_MockUser user, String role) {
    const scores = {'user': 1, 'moderator': 2, 'admin': 3};
    final current = scores[user.role] ?? 0;
    final target = scores[role] ?? 0;
    if (current < target) {
      throw Exception('Keine Berechtigung für diese Aktion.');
    }
  }

  AuthResponse _issueSession(_MockUser user) {
    final token = _generateToken();
    _sessions[token] = _MockSession(
      token: token,
      userId: user.id,
      expiresAt: DateTime.now().add(const Duration(hours: 8)),
    );
    return AuthResponse(
      token: token,
      expiresAt: _sessions[token]!.expiresAt,
      user: user.toProfile(),
    );
  }

  String _hashPassword(String password, String salt) =>
      _generateHash('$salt::$password');

  bool _verifyPassword(String password, String salt, String hash) =>
      _hashPassword(password, salt) == hash;

  String _generateToken() => List.generate(
        32,
        (_) => _alphabet[_random.nextInt(_alphabet.length)],
      ).join();

  String _generateHash(String input) =>
      input.codeUnits.fold<int>(0, (acc, value) => acc + value).toRadixString(16);
}

class _MockUser {
  _MockUser({
    required this.id,
    required this.email,
    required this.salt,
    required this.hash,
    required this.role,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.displayName,
  });

  final int id;
  final String email;
  final String salt;
  final String hash;
  final String role;
  final bool isActive;
  final DateTime createdAt;
  DateTime updatedAt;
  String? displayName;

  _MockUser copyWith({
    String? role,
    String? displayName,
  }) {
    return _MockUser(
      id: id,
      email: email,
      salt: salt,
      hash: hash,
      role: role ?? this.role,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
      displayName: displayName ?? this.displayName,
    );
  }

  UserProfile toProfile() => UserProfile(
        id: id,
        email: email,
        role: role,
        isActive: isActive,
        createdAt: createdAt,
        updatedAt: updatedAt,
        displayName: displayName,
      );
}

class _MockSession {
  _MockSession({
    required this.token,
    required this.userId,
    required this.expiresAt,
  });

  final String token;
  final int userId;
  final DateTime expiresAt;
}

const _alphabet =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
