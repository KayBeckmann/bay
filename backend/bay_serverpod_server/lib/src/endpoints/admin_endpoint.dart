import 'package:serverpod/serverpod.dart';

import '../generated/auth_payloads.dart';
import '../generated/platform_settings.dart';
import '../generated/user_profile.dart';
import '../services/auth_service.dart';

class AdminEndpoint extends Endpoint {
  final _auth = AuthService.instance;

  Future<List<UserProfile>> listUsers(Session session, String token) async {
    return _auth.listUsers(token);
  }

  Future<UserProfile> setUserRole(
    Session session,
    UpdateUserRoleRequest request,
  ) async {
    return _auth.setRole(request);
  }

  Future<PlatformSettings> getSettings(Session session, String token) async {
    return _auth.getSettings(token);
  }

  Future<PlatformSettings> updateSettings(
    Session session,
    UpdatePlatformSettingsRequest request,
  ) async {
    return _auth.updateSettings(request);
  }
}
