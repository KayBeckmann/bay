import '../generated/auth_payloads.dart';
import '../generated/dispute.dart';
import '../generated/user_profile.dart';

class DisputeService {
  DisputeService._();

  static final DisputeService instance = DisputeService._();

  final Map<int, Dispute> _disputes = {};
  int _counter = 1;

  Dispute createDispute(UserProfile profile, CreateDisputeRequest request) {
    final dispute = Dispute(
      id: _counter++,
      title: request.title,
      description: request.description,
      status: 'open',
      createdAt: DateTime.now().toUtc(),
      updatedAt: DateTime.now().toUtc(),
      createdByUserId: profile.id,
      resolutionNote: null,
    );
    _disputes[dispute.id!] = dispute;
    return dispute;
  }

  List<Dispute> listForUser(int userId) {
    return _disputes.values
        .where((d) => d.createdByUserId == userId)
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  List<Dispute> listOpen() {
    return _disputes.values
        .where((d) => d.status != 'resolved')
        .toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
  }

  Dispute resolve(
    ResolveDisputeRequest request, {
    required UserProfile moderator,
  }) {
    final dispute = _disputes[request.disputeId];
    if (dispute == null) {
      throw Exception('Dispute not found');
    }
    final resolved = dispute.copyWith(
      status: 'resolved',
      updatedAt: DateTime.now().toUtc(),
      resolutionNote: request.resolutionNote ??
          'Entscheidung durch ${moderator.displayName ?? moderator.email}',
    );
    _disputes[resolved.id!] = resolved;
    return resolved;
  }
}
