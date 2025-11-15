import 'dart:convert';

class UserProfile {
  UserProfile({
    required this.id,
    required this.email,
    required this.role,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.displayName,
  });

  final int id;
  final String email;
  final String role;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? displayName;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json['id'] as int,
        email: json['email'] as String,
        role: json['role'] as String,
        isActive: json['isActive'] as bool,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        displayName: json['displayName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'role': role,
        'isActive': isActive,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        if (displayName != null) 'displayName': displayName,
      };
}

class AuthResponse {
  AuthResponse({
    required this.token,
    required this.expiresAt,
    required this.user,
  });

  final String token;
  final DateTime expiresAt;
  final UserProfile user;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        token: json['token'] as String,
        expiresAt: DateTime.parse(json['expiresAt'] as String),
        user: UserProfile.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'expiresAt': expiresAt.toIso8601String(),
        'user': user.toJson(),
      };
}

class PlatformSettings {
  PlatformSettings({
    required this.guestAccessEnabled,
    required this.registrationEnabled,
    this.smtpHost,
    this.smtpPort,
    this.smtpUser,
    this.smtpFromEmail,
  });

  final bool guestAccessEnabled;
  final bool registrationEnabled;
  final String? smtpHost;
  final int? smtpPort;
  final String? smtpUser;
  final String? smtpFromEmail;

  factory PlatformSettings.fromJson(Map<String, dynamic> json) =>
      PlatformSettings(
        guestAccessEnabled: json['guestAccessEnabled'] as bool? ?? true,
        registrationEnabled: json['registrationEnabled'] as bool? ?? true,
        smtpHost: json['smtpHost'] as String?,
        smtpPort: json['smtpPort'] as int?,
        smtpUser: json['smtpUser'] as String?,
        smtpFromEmail: json['smtpFromEmail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'guestAccessEnabled': guestAccessEnabled,
        'registrationEnabled': registrationEnabled,
        if (smtpHost != null) 'smtpHost': smtpHost,
        if (smtpPort != null) 'smtpPort': smtpPort,
        if (smtpUser != null) 'smtpUser': smtpUser,
        if (smtpFromEmail != null) 'smtpFromEmail': smtpFromEmail,
      };

  PlatformSettings copyWith({
    bool? guestAccessEnabled,
    bool? registrationEnabled,
    String? smtpHost,
    int? smtpPort,
    String? smtpUser,
    String? smtpFromEmail,
  }) {
    return PlatformSettings(
      guestAccessEnabled: guestAccessEnabled ?? this.guestAccessEnabled,
      registrationEnabled: registrationEnabled ?? this.registrationEnabled,
      smtpHost: smtpHost ?? this.smtpHost,
      smtpPort: smtpPort ?? this.smtpPort,
      smtpUser: smtpUser ?? this.smtpUser,
      smtpFromEmail: smtpFromEmail ?? this.smtpFromEmail,
    );
  }
}

class Dispute {
  Dispute({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.resolutionNote,
  });

  final int id;
  final String title;
  final String description;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? resolutionNote;

  bool get isResolved => status == 'resolved';

  factory Dispute.fromJson(Map<String, dynamic> json) => Dispute(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        status: json['status'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        resolutionNote: json['resolutionNote'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'status': status,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        if (resolutionNote != null) 'resolutionNote': resolutionNote,
      };
}

class Invitation {
  Invitation({
    required this.code,
    required this.email,
    required this.expiresAt,
    this.message,
  });

  final String code;
  final String email;
  final DateTime expiresAt;
  final String? message;

  factory Invitation.fromJson(Map<String, dynamic> json) => Invitation(
        code: json['code'] as String,
        email: json['email'] as String,
        expiresAt: DateTime.parse(json['expiresAt'] as String),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'email': email,
        'expiresAt': expiresAt.toIso8601String(),
        if (message != null) 'message': message,
      };
}

class RegisterPayload {
  RegisterPayload({
    required this.email,
    required this.password,
    this.displayName,
    this.inviteCode,
  });

  final String email;
  final String password;
  final String? displayName;
  final String? inviteCode;
}

class LoginPayload {
  LoginPayload({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class UpdateProfilePayload {
  UpdateProfilePayload({
    required this.token,
    this.displayName,
  });

  final String token;
  final String? displayName;
}

String prettyJson(Object source) =>
    const JsonEncoder.withIndent('  ').convert(source);
