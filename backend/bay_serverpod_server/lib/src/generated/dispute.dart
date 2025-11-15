/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Dispute extends _i1.SerializableEntity {
  Dispute._({
    this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.createdByUserId,
    this.resolutionNote,
  });

  factory Dispute({
    int? id,
    required String title,
    required String description,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int createdByUserId,
    String? resolutionNote,
  }) = _DisputeImpl;

  factory Dispute.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Dispute(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      status:
          serializationManager.deserialize<String>(jsonSerialization['status']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
      updatedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['updatedAt']),
      createdByUserId: serializationManager
          .deserialize<int>(jsonSerialization['createdByUserId']),
      resolutionNote: serializationManager
          .deserialize<String?>(jsonSerialization['resolutionNote']),
    );
  }

  int? id;

  String title;

  String description;

  String status;

  DateTime createdAt;

  DateTime updatedAt;

  int createdByUserId;

  String? resolutionNote;

  Dispute copyWith({
    int? id,
    String? title,
    String? description,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? createdByUserId,
    String? resolutionNote,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'status': status,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'createdByUserId': createdByUserId,
      if (resolutionNote != null) 'resolutionNote': resolutionNote,
    };
  }

  @override
  Map<String, dynamic> allToJson() => toJson();
}

class _DisputeImpl extends Dispute {
  _DisputeImpl({
    int? id,
    required String title,
    required String description,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int createdByUserId,
    String? resolutionNote,
  }) : super._(
          id: id,
          title: title,
          description: description,
          status: status,
          createdAt: createdAt,
          updatedAt: updatedAt,
          createdByUserId: createdByUserId,
          resolutionNote: resolutionNote,
        );

  @override
  Dispute copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? createdByUserId,
    Object? resolutionNote = _Undefined,
  }) {
    return Dispute(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      resolutionNote: resolutionNote is String? ? resolutionNote : this.resolutionNote,
    );
  }
}

class _Undefined {}
