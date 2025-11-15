import 'package:serverpod/serverpod.dart';

import '../generated/auth_payloads.dart';
import '../generated/dispute.dart';
import '../services/auth_service.dart';

class ModeratorEndpoint extends Endpoint {
  final _auth = AuthService.instance;

  Future<List<Dispute>> listDisputes(Session session, String token) async {
    return _auth.listDisputes(token);
  }

  Future<Dispute> resolveDispute(
    Session session,
    ResolveDisputeRequest request,
  ) async {
    return _auth.resolveDispute(request);
  }
}
