/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class HealthStatus extends _i1.SerializableEntity {
  HealthStatus._({
    required this.status,
    required this.timestamp,
    required this.uptimeSeconds,
    required this.databaseHealthy,
  });

  factory HealthStatus({
    required String status,
    required DateTime timestamp,
    required int uptimeSeconds,
    required bool databaseHealthy,
  }) = _HealthStatusImpl;

  factory HealthStatus.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return HealthStatus(
      status:
          serializationManager.deserialize<String>(jsonSerialization['status']),
      timestamp: serializationManager
          .deserialize<DateTime>(jsonSerialization['timestamp']),
      uptimeSeconds: serializationManager
          .deserialize<int>(jsonSerialization['uptimeSeconds']),
      databaseHealthy: serializationManager
          .deserialize<bool>(jsonSerialization['databaseHealthy']),
    );
  }

  String status;

  DateTime timestamp;

  int uptimeSeconds;

  bool databaseHealthy;

  HealthStatus copyWith({
    String? status,
    DateTime? timestamp,
    int? uptimeSeconds,
    bool? databaseHealthy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'timestamp': timestamp.toJson(),
      'uptimeSeconds': uptimeSeconds,
      'databaseHealthy': databaseHealthy,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'status': status,
      'timestamp': timestamp.toJson(),
      'uptimeSeconds': uptimeSeconds,
      'databaseHealthy': databaseHealthy,
    };
  }
}

class _HealthStatusImpl extends HealthStatus {
  _HealthStatusImpl({
    required String status,
    required DateTime timestamp,
    required int uptimeSeconds,
    required bool databaseHealthy,
  }) : super._(
          status: status,
          timestamp: timestamp,
          uptimeSeconds: uptimeSeconds,
          databaseHealthy: databaseHealthy,
        );

  @override
  HealthStatus copyWith({
    String? status,
    DateTime? timestamp,
    int? uptimeSeconds,
    bool? databaseHealthy,
  }) {
    return HealthStatus(
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
      uptimeSeconds: uptimeSeconds ?? this.uptimeSeconds,
      databaseHealthy: databaseHealthy ?? this.databaseHealthy,
    );
  }
}
