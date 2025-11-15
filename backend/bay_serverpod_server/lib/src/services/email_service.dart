import 'dart:developer';

import '../generated/platform_settings.dart';
import 'platform_settings_service.dart';

/// Simplified SMTP wrapper – currently logs emails to keep the flow observable
/// in development without touching external infrastructure.
class EmailService {
  EmailService._();

  static final EmailService instance = EmailService._();

  PlatformSettings get _settings => PlatformSettingsService.instance.state;

  Future<void> sendInvitation({
    required String to,
    required String code,
    String? message,
  }) async {
    final smtp = _settings;
    log(
      '[smtp] Sending invitation to $to '
      '(from: ${smtp.smtpFromEmail ?? 'demo@localhost'}) code=$code '
      'message=${message ?? ''}',
      name: 'EmailService',
    );
  }
}
