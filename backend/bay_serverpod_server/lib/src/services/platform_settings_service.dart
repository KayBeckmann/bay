import 'dart:io';

import '../generated/platform_settings.dart';

class PlatformSettingsService {
  PlatformSettingsService._()
      : _state = PlatformSettings(
          guestAccessEnabled:
              _envFlag('GUEST_ACCESS_ENABLED', defaultValue: true),
          registrationEnabled:
              _envFlag('REGISTRATION_ENABLED', defaultValue: true),
          smtpHost: Platform.environment['SMTP_HOST'],
          smtpPort: int.tryParse(Platform.environment['SMTP_PORT'] ?? ''),
          smtpUser: Platform.environment['SMTP_USER'],
          smtpPassword: Platform.environment['SMTP_PASSWORD'],
          smtpFromEmail: Platform.environment['SMTP_FROM_EMAIL'],
        );

  static bool _envFlag(String key, {required bool defaultValue}) {
    final raw = Platform.environment[key];
    if (raw == null) return defaultValue;
    return raw.toLowerCase() == 'true';
  }

  static final PlatformSettingsService instance =
      PlatformSettingsService._();

  PlatformSettings _state;

  PlatformSettings get state => _state;

  PlatformSettings update(PlatformSettings settings) {
    _state = settings;
    return _state;
  }
}
