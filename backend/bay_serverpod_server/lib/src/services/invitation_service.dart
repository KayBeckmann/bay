import 'dart:math';

import '../generated/auth_payloads.dart';
import 'email_service.dart';

class InvitationService {
  InvitationService._();

  static final InvitationService instance = InvitationService._();

  final Map<String, InvitationResponse> _activeInvites = {};
  final Random _random = Random.secure();

  InvitationResponse createInvite(String email, {String? message}) {
    final code = _generateCode();
    final invite = InvitationResponse(
      code: code,
      email: email,
      message: message,
      expiresAt: DateTime.now().add(const Duration(days: 7)),
    );
    _activeInvites[code] = invite;
    EmailService.instance
        .sendInvitation(to: email, code: code, message: message);
    return invite;
  }

  bool consume(String code) {
    final invite = _activeInvites[code];
    if (invite == null) return false;
    if (invite.expiresAt.isBefore(DateTime.now())) {
      _activeInvites.remove(code);
      return false;
    }
    _activeInvites.remove(code);
    return true;
  }

  InvitationResponse? getInvite(String code) => _activeInvites[code];

  List<InvitationResponse> pending() => _activeInvites.values.toList();

  String _generateCode() {
    const alphabet = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    return List.generate(
      10,
      (_) => alphabet[_random.nextInt(alphabet.length)],
    ).join();
  }
}
