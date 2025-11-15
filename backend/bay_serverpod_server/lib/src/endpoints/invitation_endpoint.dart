import 'package:serverpod/serverpod.dart';

import '../generated/auth_payloads.dart';
import '../services/invitation_service.dart';

class InvitationEndpoint extends Endpoint {
  final _invitations = InvitationService.instance;

  Future<InvitationResponse> requestInvite(
    Session session,
    InviteRequest request,
  ) async {
    return _invitations.createInvite(request.email, message: request.message);
  }

  Future<List<InvitationResponse>> pending(Session session) async {
    return _invitations.pending();
  }
}
