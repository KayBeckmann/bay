import 'package:serverpod/serverpod.dart';

import '../generated/auth_payloads.dart';
import '../generated/user_profile.dart';
import '../services/auth_service.dart';

class ProfileEndpoint extends Endpoint {
  final _auth = AuthService.instance;

  Future<UserProfile> me(Session session, String token) {
    return _auth.currentUser(token);
  }

  Future<UserProfile> updateProfile(
    Session session,
    UpdateProfileRequest request,
  ) {
    return _auth.updateProfile(request);
  }
}
