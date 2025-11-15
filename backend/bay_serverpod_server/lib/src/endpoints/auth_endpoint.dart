import 'package:serverpod/serverpod.dart';

import '../generated/auth_payloads.dart';
import '../services/auth_service.dart';

class AuthEndpoint extends Endpoint {
  final _auth = AuthService.instance;

  Future<AuthResponse> register(Session session, RegisterRequest request) {
    return _auth.register(session, request);
  }

  Future<AuthResponse> login(Session session, LoginRequest request) {
    return _auth.login(session, request);
  }

  Future<void> logout(Session session, String token) {
    return _auth.logout(token);
  }

  Future<AuthResponse> refresh(Session session, String token) {
    return _auth.refresh(token, session);
  }
}
