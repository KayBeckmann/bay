/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'platform_settings.dart' as _i2;
import 'user_profile.dart' as _i3;

abstract class RegisterRequest extends _i1.SerializableEntity {
  RegisterRequest._({
    required this.email,
    required this.password,
    this.displayName,
    this.inviteCode,
  });

  factory RegisterRequest({
    required String email,
    required String password,
    String? displayName,
    String? inviteCode,
  }) = _RegisterRequestImpl;

  factory RegisterRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return RegisterRequest(
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      password: serializationManager
          .deserialize<String>(jsonSerialization['password']),
      displayName: serializationManager
          .deserialize<String?>(jsonSerialization['displayName']),
      inviteCode: serializationManager
          .deserialize<String?>(jsonSerialization['inviteCode']),
    );
  }

  String email;

  String password;

  String? displayName;

  String? inviteCode;

  RegisterRequest copyWith({
    String? email,
    String? password,
    String? displayName,
    String? inviteCode,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      if (displayName != null) 'displayName': displayName,
      if (inviteCode != null) 'inviteCode': inviteCode,
    };
  }

  @override
  Map<String, dynamic> allToJson() => toJson();
}

class _RegisterRequestImpl extends RegisterRequest {
  _RegisterRequestImpl({
    required String email,
    required String password,
    String? displayName,
    String? inviteCode,
  }) : super._(
          email: email,
          password: password,
          displayName: displayName,
          inviteCode: inviteCode,
        );

  @override
  RegisterRequest copyWith({
    String? email,
    String? password,
    Object? displayName = _Undefined,
    Object? inviteCode = _Undefined,
  }) {
    return RegisterRequest(
      email: email ?? this.email,
      password: password ?? this.password,
      displayName: displayName is String? ? displayName : this.displayName,
      inviteCode: inviteCode is String? ? inviteCode : this.inviteCode,
    );
  }
}

abstract class LoginRequest extends _i1.SerializableEntity {
  LoginRequest._({
    required this.email,
    required this.password,
  });

  factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequestImpl;

  factory LoginRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return LoginRequest(
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      password: serializationManager
          .deserialize<String>(jsonSerialization['password']),
    );
  }

  String email;

  String password;

  LoginRequest copyWith({
    String? email,
    String? password,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  Map<String, dynamic> allToJson() => toJson();
}

class _LoginRequestImpl extends LoginRequest {
  _LoginRequestImpl({
    required String email,
    required String password,
  }) : super._(
          email: email,
          password: password,
        );

  @override
  LoginRequest copyWith({
    String? email,
    String? password,
  }) {
    return LoginRequest(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

abstract class AuthResponse extends _i1.SerializableEntity {
  AuthResponse._({
    required this.token,
    required this.expiresAt,
    required this.user,
  });

  factory AuthResponse({
    required String token,
    required DateTime expiresAt,
    required _i3.UserProfile user,
  }) = _AuthResponseImpl;

  factory AuthResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return AuthResponse(
      token:
          serializationManager.deserialize<String>(jsonSerialization['token']),
      expiresAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['expiresAt']),
      user: serializationManager
          .deserialize<_i3.UserProfile>(jsonSerialization['user']),
    );
  }

  String token;

  DateTime expiresAt;

  _i3.UserProfile user;

  AuthResponse copyWith({
    String? token,
    DateTime? expiresAt,
    _i3.UserProfile? user,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expiresAt': expiresAt.toJson(),
      'user': user.toJson(),
    };
  }

  @override
  Map<String, dynamic> allToJson() => toJson();
}

class _AuthResponseImpl extends AuthResponse {
  _AuthResponseImpl({
    required String token,
    required DateTime expiresAt,
    required _i3.UserProfile user,
  }) : super._(
          token: token,
          expiresAt: expiresAt,
          user: user,
        );

  @override
  AuthResponse copyWith({
    String? token,
    DateTime? expiresAt,
    _i3.UserProfile? user,
  }) {
    return AuthResponse(
      token: token ?? this.token,
      expiresAt: expiresAt ?? this.expiresAt,
      user: user ?? this.user.copyWith(),
    );
  }
}

abstract class UpdateProfileRequest extends _i1.SerializableEntity {
  UpdateProfileRequest._({
    required this.token,
    this.displayName,
  });

  factory UpdateProfileRequest({
    required String token,
    String? displayName,
  }) = _UpdateProfileRequestImpl;

  factory UpdateProfileRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return UpdateProfileRequest(
      token:
          serializationManager.deserialize<String>(jsonSerialization['token']),
      displayName: serializationManager
          .deserialize<String?>(jsonSerialization['displayName']),
    );
  }

  String token;

  String? displayName;

  UpdateProfileRequest copyWith({
    String? token,
    String? displayName,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      if (displayName != null) 'displayName': displayName,
    };
  }

  @override
  Map<String, dynamic> allToJson() => toJson();
}

class _UpdateProfileRequestImpl extends UpdateProfileRequest {
  _UpdateProfileRequestImpl({
    required String token,
    String? displayName,
  }) : super._(
          token: token,
          displayName: displayName,
        );

  @override
  UpdateProfileRequest copyWith({
    String? token,
    Object? displayName = _Undefined,
  }) {
    return UpdateProfileRequest(
      token: token ?? this.token,
      displayName: displayName is String? ? displayName : this.displayName,
    );
  }
}

abstract class UpdateUserRoleRequest extends _i1.SerializableEntity {
  UpdateUserRoleRequest._({
    required this.adminToken,
    required this.userId,
    required this.role,
  });

  factory UpdateUserRoleRequest({
    required String adminToken,
    required int userId,
    required String role,
  }) = _UpdateUserRoleRequestImpl;

  factory UpdateUserRoleRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return UpdateUserRoleRequest(
      adminToken: serializationManager
          .deserialize<String>(jsonSerialization['adminToken']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      role:
          serializationManager.deserialize<String>(jsonSerialization['role']),
    );
  }

  String adminToken;

  int userId;

  String role;

  UpdateUserRoleRequest copyWith({
    String? adminToken,
    int? userId,
    String? role,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'adminToken': adminToken,
      'userId': userId,
      'role': role,
    };
  }

  @override
  Map<String, dynamic> allToJson() => toJson();
}

class _UpdateUserRoleRequestImpl extends UpdateUserRoleRequest {
  _UpdateUserRoleRequestImpl({
    required String adminToken,
    required int userId,
    required String role,
  }) : super._(
          adminToken: adminToken,
          userId: userId,
          role: role,
        );

  @override
  UpdateUserRoleRequest copyWith({
    String? adminToken,
    int? userId,
    String? role,
  }) {
    return UpdateUserRoleRequest(
      adminToken: adminToken ?? this.adminToken,
      userId: userId ?? this.userId,
      role: role ?? this.role,
    );
  }
}

abstract class UpdatePlatformSettingsRequest
    extends _i1.SerializableEntity {
  UpdatePlatformSettingsRequest._({
    required this.adminToken,
    required this.settings,
  });

  factory UpdatePlatformSettingsRequest({
    required String adminToken,
    required _i2.PlatformSettings settings,
  }) = _UpdatePlatformSettingsRequestImpl;

  factory UpdatePlatformSettingsRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return UpdatePlatformSettingsRequest(
      adminToken: serializationManager
          .deserialize<String>(jsonSerialization['adminToken']),
      settings: serializationManager.deserialize<_i2.PlatformSettings>(
          jsonSerialization['settings']),
    );
  }

  String adminToken;

  _i2.PlatformSettings settings;

  UpdatePlatformSettingsRequest copyWith({
    String? adminToken,
    _i2.PlatformSettings? settings,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'adminToken': adminToken,
      'settings': settings.toJson(),
    };
  }

  @override
  Map<String, dynamic> allToJson() => toJson();
}

class _UpdatePlatformSettingsRequestImpl
    extends UpdatePlatformSettingsRequest {
  _UpdatePlatformSettingsRequestImpl({
    required String adminToken,
    required _i2.PlatformSettings settings,
  }) : super._(
          adminToken: adminToken,
          settings: settings,
        );

  @override
  UpdatePlatformSettingsRequest copyWith({
    String? adminToken,
    _i2.PlatformSettings? settings,
  }) {
    return UpdatePlatformSettingsRequest(
      adminToken: adminToken ?? this.adminToken,
      settings: settings ?? this.settings.copyWith(),
    );
  }
}

abstract class CreateDisputeRequest extends _i1.SerializableEntity {
  CreateDisputeRequest._({
    required this.token,
    required this.title,
    required this.description,
  });

  factory CreateDisputeRequest({
    required String token,
    required String title,
    required String description,
  }) = _CreateDisputeRequestImpl;

  factory CreateDisputeRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return CreateDisputeRequest(
      token:
          serializationManager.deserialize<String>(jsonSerialization['token']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
    );
  }

  String token;

  String title;

  String description;

  CreateDisputeRequest copyWith({
    String? token,
    String? title,
    String? description,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'title': title,
      'description': description,
    };
  }

  @override
  Map<String, dynamic> allToJson() => toJson();
}

class _CreateDisputeRequestImpl extends CreateDisputeRequest {
  _CreateDisputeRequestImpl({
    required String token,
    required String title,
    required String description,
  }) : super._(
          token: token,
          title: title,
          description: description,
        );

  @override
  CreateDisputeRequest copyWith({
    String? token,
    String? title,
    String? description,
  }) {
    return CreateDisputeRequest(
      token: token ?? this.token,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}

abstract class ResolveDisputeRequest extends _i1.SerializableEntity {
  ResolveDisputeRequest._({
    required this.moderatorToken,
    required this.disputeId,
    this.resolutionNote,
  });

  factory ResolveDisputeRequest({
    required String moderatorToken,
    required int disputeId,
    String? resolutionNote,
  }) = _ResolveDisputeRequestImpl;

  factory ResolveDisputeRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ResolveDisputeRequest(
      moderatorToken: serializationManager
          .deserialize<String>(jsonSerialization['moderatorToken']),
      disputeId: serializationManager
          .deserialize<int>(jsonSerialization['disputeId']),
      resolutionNote: serializationManager
          .deserialize<String?>(jsonSerialization['resolutionNote']),
    );
  }

  String moderatorToken;

  int disputeId;

  String? resolutionNote;

  ResolveDisputeRequest copyWith({
    String? moderatorToken,
    int? disputeId,
    String? resolutionNote,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'moderatorToken': moderatorToken,
      'disputeId': disputeId,
      if (resolutionNote != null) 'resolutionNote': resolutionNote,
    };
  }

  @override
  Map<String, dynamic> allToJson() => toJson();
}

class _ResolveDisputeRequestImpl extends ResolveDisputeRequest {
  _ResolveDisputeRequestImpl({
    required String moderatorToken,
    required int disputeId,
    String? resolutionNote,
  }) : super._(
          moderatorToken: moderatorToken,
          disputeId: disputeId,
          resolutionNote: resolutionNote,
        );

  @override
  ResolveDisputeRequest copyWith({
    String? moderatorToken,
    int? disputeId,
    Object? resolutionNote = _Undefined,
  }) {
    return ResolveDisputeRequest(
      moderatorToken: moderatorToken ?? this.moderatorToken,
      disputeId: disputeId ?? this.disputeId,
      resolutionNote: resolutionNote is String?
          ? resolutionNote
          : this.resolutionNote,
    );
  }
}

abstract class InvitationResponse extends _i1.SerializableEntity {
  InvitationResponse._({
    required this.code,
    required this.email,
    this.message,
    required this.expiresAt,
  });

  factory InvitationResponse({
    required String code,
    required String email,
    String? message,
    required DateTime expiresAt,
  }) = _InvitationResponseImpl;

  factory InvitationResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return InvitationResponse(
      code:
          serializationManager.deserialize<String>(jsonSerialization['code']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      message: serializationManager
          .deserialize<String?>(jsonSerialization['message']),
      expiresAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['expiresAt']),
    );
  }

  String code;

  String email;

  String? message;

  DateTime expiresAt;

  InvitationResponse copyWith({
    String? code,
    String? email,
    String? message,
    DateTime? expiresAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'email': email,
      if (message != null) 'message': message,
      'expiresAt': expiresAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> allToJson() => toJson();
}

class _InvitationResponseImpl extends InvitationResponse {
  _InvitationResponseImpl({
    required String code,
    required String email,
    String? message,
    required DateTime expiresAt,
  }) : super._(
          code: code,
          email: email,
          message: message,
          expiresAt: expiresAt,
        );

  @override
  InvitationResponse copyWith({
    String? code,
    String? email,
    Object? message = _Undefined,
    DateTime? expiresAt,
  }) {
    return InvitationResponse(
      code: code ?? this.code,
      email: email ?? this.email,
      message: message is String? ? message : this.message,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}

abstract class InviteRequest extends _i1.SerializableEntity {
  InviteRequest._({
    required this.email,
    this.message,
  });

  factory InviteRequest({
    required String email,
    String? message,
  }) = _InviteRequestImpl;

  factory InviteRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return InviteRequest(
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      message: serializationManager
          .deserialize<String?>(jsonSerialization['message']),
    );
  }

  String email;

  String? message;

  InviteRequest copyWith({
    String? email,
    String? message,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      if (message != null) 'message': message,
    };
  }

  @override
  Map<String, dynamic> allToJson() => toJson();
}

class _InviteRequestImpl extends InviteRequest {
  _InviteRequestImpl({
    required String email,
    String? message,
  }) : super._(
          email: email,
          message: message,
        );

  @override
  InviteRequest copyWith({
    String? email,
    Object? message = _Undefined,
  }) {
    return InviteRequest(
      email: email ?? this.email,
      message: message is String? ? message : this.message,
    );
  }
}

class _Undefined {}
