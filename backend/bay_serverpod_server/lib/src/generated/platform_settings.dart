/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class PlatformSettings extends _i1.SerializableEntity {
  PlatformSettings._({
    required this.guestAccessEnabled,
    required this.registrationEnabled,
    this.smtpHost,
    this.smtpPort,
    this.smtpUser,
    this.smtpPassword,
    this.smtpFromEmail,
  });

  factory PlatformSettings({
    required bool guestAccessEnabled,
    required bool registrationEnabled,
    String? smtpHost,
    int? smtpPort,
    String? smtpUser,
    String? smtpPassword,
    String? smtpFromEmail,
  }) = _PlatformSettingsImpl;

  factory PlatformSettings.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PlatformSettings(
      guestAccessEnabled: serializationManager
          .deserialize<bool>(jsonSerialization['guestAccessEnabled']),
      registrationEnabled: serializationManager
          .deserialize<bool>(jsonSerialization['registrationEnabled']),
      smtpHost:
          serializationManager.deserialize<String?>(jsonSerialization['smtpHost']),
      smtpPort: serializationManager.deserialize<int?>(jsonSerialization['smtpPort']),
      smtpUser:
          serializationManager.deserialize<String?>(jsonSerialization['smtpUser']),
      smtpPassword: serializationManager
          .deserialize<String?>(jsonSerialization['smtpPassword']),
      smtpFromEmail: serializationManager
          .deserialize<String?>(jsonSerialization['smtpFromEmail']),
    );
  }

  bool guestAccessEnabled;

  bool registrationEnabled;

  String? smtpHost;

  int? smtpPort;

  String? smtpUser;

  String? smtpPassword;

  String? smtpFromEmail;

  PlatformSettings copyWith({
    bool? guestAccessEnabled,
    bool? registrationEnabled,
    String? smtpHost,
    int? smtpPort,
    String? smtpUser,
    String? smtpPassword,
    String? smtpFromEmail,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'guestAccessEnabled': guestAccessEnabled,
      'registrationEnabled': registrationEnabled,
      if (smtpHost != null) 'smtpHost': smtpHost,
      if (smtpPort != null) 'smtpPort': smtpPort,
      if (smtpUser != null) 'smtpUser': smtpUser,
      if (smtpPassword != null) 'smtpPassword': smtpPassword,
      if (smtpFromEmail != null) 'smtpFromEmail': smtpFromEmail,
    };
  }

  @override
  Map<String, dynamic> allToJson() => toJson();
}

class _PlatformSettingsImpl extends PlatformSettings {
  _PlatformSettingsImpl({
    required bool guestAccessEnabled,
    required bool registrationEnabled,
    String? smtpHost,
    int? smtpPort,
    String? smtpUser,
    String? smtpPassword,
    String? smtpFromEmail,
  }) : super._(
          guestAccessEnabled: guestAccessEnabled,
          registrationEnabled: registrationEnabled,
          smtpHost: smtpHost,
          smtpPort: smtpPort,
          smtpUser: smtpUser,
          smtpPassword: smtpPassword,
          smtpFromEmail: smtpFromEmail,
        );

  @override
  PlatformSettings copyWith({
    bool? guestAccessEnabled,
    bool? registrationEnabled,
    Object? smtpHost = _Undefined,
    Object? smtpPort = _Undefined,
    Object? smtpUser = _Undefined,
    Object? smtpPassword = _Undefined,
    Object? smtpFromEmail = _Undefined,
  }) {
    return PlatformSettings(
      guestAccessEnabled: guestAccessEnabled ?? this.guestAccessEnabled,
      registrationEnabled: registrationEnabled ?? this.registrationEnabled,
      smtpHost: smtpHost is String? ? smtpHost : this.smtpHost,
      smtpPort: smtpPort is int? ? smtpPort : this.smtpPort,
      smtpUser: smtpUser is String? ? smtpUser : this.smtpUser,
      smtpPassword:
          smtpPassword is String? ? smtpPassword : this.smtpPassword,
      smtpFromEmail:
          smtpFromEmail is String? ? smtpFromEmail : this.smtpFromEmail,
    );
  }
}

class _Undefined {}
