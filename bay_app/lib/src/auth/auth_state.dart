import 'package:flutter/material.dart';

import 'auth_api.dart';
import 'models.dart';

class AuthState extends ChangeNotifier {
  AuthState({AuthApi? api}) : _api = api ?? MockAuthApi();

  final AuthApi _api;

  AuthResponse? _session;
  bool _busy = false;
  String? _error;
  PlatformSettings? _settings;
  List<Dispute> _disputes = [];
  List<UserProfile> _users = [];

  bool get isBusy => _busy;
  String? get errorMessage => _error;
  UserProfile? get user => _session?.user;
  String? get token => _session?.token;
  PlatformSettings? get settings => _settings;
  List<Dispute> get disputes => _disputes;
  List<UserProfile> get users => _users;
  bool get isAuthenticated => _session != null;

  Future<bool> register(RegisterPayload payload) =>
      _guardOperation(() async {
        _session = await _api.register(payload);
        await _hydrate();
        return true;
      });

  Future<bool> login(LoginPayload payload) => _guardOperation(() async {
        _session = await _api.login(payload);
        await _hydrate();
        return true;
      });

  Future<void> logout() => _guardOperation(() async {
        final current = token;
        if (current != null) {
          await _api.logout(current);
        }
        _session = null;
        _disputes = [];
        _users = [];
        notifyListeners();
      });

  Future<void> refresh() => _guardOperation(() async {
        if (token == null) return;
        _session = await _api.refresh(token!);
        await _hydrate();
      });

  Future<void> updateProfile(String? displayName) => _guardOperation(() async {
        if (token == null) throw Exception('Nicht eingeloggt');
        final profile = await _api.updateProfile(
          UpdateProfilePayload(token: token!, displayName: displayName),
        );
        _session = AuthResponse(
          token: _session!.token,
          expiresAt: _session!.expiresAt,
          user: profile,
        );
        notifyListeners();
      });

  Future<void> createDispute({
    required String title,
    required String description,
  }) =>
      _guardOperation(() async {
        if (token == null) throw Exception('Nicht eingeloggt');
        await _api.createDispute(
          token: token!,
          title: title,
          description: description,
        );
        _disputes = await _api.myDisputes(token!);
        notifyListeners();
      });

  Future<void> resolveDispute(int disputeId, {String? note}) =>
      _guardOperation(() async {
        if (token == null) throw Exception('Nicht eingeloggt');
        await _api.resolveDispute(
          moderatorToken: token!,
          disputeId: disputeId,
          resolutionNote: note,
        );
        _disputes = await _api.listDisputes(token!);
        notifyListeners();
      });

  Future<void> updateSettings(PlatformSettings updated) =>
      _guardOperation(() async {
        if (token == null) throw Exception('Nicht eingeloggt');
        _settings = await _api.updateSettings(
          adminToken: token!,
          settings: updated,
        );
        notifyListeners();
      });

  Future<void> setUserRole({
    required int userId,
    required String role,
  }) =>
      _guardOperation(() async {
        if (token == null) throw Exception('Nicht eingeloggt');
        await _api.setUserRole(
          adminToken: token!,
          userId: userId,
          role: role,
        );
        _users = await _api.listUsers(token!);
        notifyListeners();
      });

  Future<void> requestInvite(String email, {String? message}) =>
      _guardOperation(() async {
        await _api.requestInvite(email: email, message: message);
      });

  Future<T> _guardOperation<T>(Future<T> Function() run) async {
    try {
      _busy = true;
      _error = null;
      notifyListeners();
      final result = await run();
      return result;
    } catch (error) {
      _error = error.toString();
      notifyListeners();
      rethrow;
    } finally {
      _busy = false;
      notifyListeners();
    }
  }

  Future<void> _hydrate() async {
    if (token == null) return;
    _disputes = await _api.myDisputes(token!);
    if (user?.role == 'moderator' || user?.role == 'admin') {
      _disputes = await _api.listDisputes(token!);
    }
    if (user?.role == 'admin') {
      _users = await _api.listUsers(token!);
      _settings = await _api.getSettings(token!);
    }
    notifyListeners();
  }
}

class AuthScope extends InheritedNotifier<AuthState> {
  const AuthScope({
    super.key,
    required AuthState notifier,
    required super.child,
  }) : super(notifier: notifier);

  static AuthState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AuthScope>()!.notifier!;

  @override
  bool updateShouldNotify(AuthScope old) => notifier != old.notifier;
}
