import 'package:serverpod/serverpod.dart';

import '../generated/auth_payloads.dart';
import '../generated/dispute.dart';
import '../services/auth_service.dart';

class DisputeEndpoint extends Endpoint {
  final _auth = AuthService.instance;

  Future<Dispute> createDispute(
    Session session,
    CreateDisputeRequest request,
  ) async {
    return _auth.createDispute(request);
  }

  Future<List<Dispute>> myDisputes(Session session, String token) async {
    return _auth.myDisputes(token);
  }
}
