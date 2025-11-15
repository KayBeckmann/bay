/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class UserProfile extends _i1.SerializableEntity {
  UserProfile._({
    this.id,
    required this.email,
    this.displayName,
    required this.role,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserProfile({
    int? id,
    required String email,
    String? displayName,
    required String role,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserProfileImpl;

  factory UserProfile.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return UserProfile(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      displayName: serializationManager
          .deserialize<String?>(jsonSerialization['displayName']),
      role: serializationManager.deserialize<String>(jsonSerialization['role']),
      isActive: serializationManager
          .deserialize<bool>(jsonSerialization['isActive']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
      updatedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['updatedAt']),
    );
  }

  int? id;

  String email;

  String? displayName;

  String role;

  bool isActive;

  DateTime createdAt;

  DateTime updatedAt;

  UserProfile copyWith({
    int? id,
    String? email,
    String? displayName,
    String? role,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'email': email,
      if (displayName != null) 'displayName': displayName,
      'role': role,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> allToJson() => toJson();
}

class _UserProfileImpl extends UserProfile {
  _UserProfileImpl({
    int? id,
    required String email,
    String? displayName,
    required String role,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          email: email,
          displayName: displayName,
          role: role,
          isActive: isActive,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  UserProfile copyWith({
    Object? id = _Undefined,
    String? email,
    Object? displayName = _Undefined,
    String? role,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      displayName: displayName is String? ? displayName : this.displayName,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class _Undefined {}
