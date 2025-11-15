/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'health_status.dart' as _i3;
import 'auth_payloads.dart' as _i4;
import 'user_profile.dart' as _i5;
import 'platform_settings.dart' as _i6;
import 'dispute.dart' as _i7;
export 'health_status.dart';
export 'auth_payloads.dart';
export 'user_profile.dart';
export 'platform_settings.dart';
export 'dispute.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    ..._i2.Protocol.targetTableDefinitions
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i3.HealthStatus) {
      return _i3.HealthStatus.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.HealthStatus?>()) {
      return (data != null ? _i3.HealthStatus.fromJson(data, this) : null) as T;
    }
    if (t == _i4.RegisterRequest) {
      return _i4.RegisterRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.RegisterRequest?>()) {
      return (data != null ? _i4.RegisterRequest.fromJson(data, this) : null)
          as T;
    }
    if (t == _i4.LoginRequest) {
      return _i4.LoginRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.LoginRequest?>()) {
      return (data != null ? _i4.LoginRequest.fromJson(data, this) : null)
          as T;
    }
    if (t == _i4.AuthResponse) {
      return _i4.AuthResponse.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.AuthResponse?>()) {
      return (data != null ? _i4.AuthResponse.fromJson(data, this) : null)
          as T;
    }
    if (t == _i4.UpdateProfileRequest) {
      return _i4.UpdateProfileRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.UpdateProfileRequest?>()) {
      return (data != null
          ? _i4.UpdateProfileRequest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i4.UpdateUserRoleRequest) {
      return _i4.UpdateUserRoleRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.UpdateUserRoleRequest?>()) {
      return (data != null
          ? _i4.UpdateUserRoleRequest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i4.UpdatePlatformSettingsRequest) {
      return _i4.UpdatePlatformSettingsRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.UpdatePlatformSettingsRequest?>()) {
      return (data != null
          ? _i4.UpdatePlatformSettingsRequest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i4.CreateDisputeRequest) {
      return _i4.CreateDisputeRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.CreateDisputeRequest?>()) {
      return (data != null
          ? _i4.CreateDisputeRequest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i4.ResolveDisputeRequest) {
      return _i4.ResolveDisputeRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.ResolveDisputeRequest?>()) {
      return (data != null
          ? _i4.ResolveDisputeRequest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i4.InvitationResponse) {
      return _i4.InvitationResponse.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.InvitationResponse?>()) {
      return (data != null
          ? _i4.InvitationResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i4.InviteRequest) {
      return _i4.InviteRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.InviteRequest?>()) {
      return (data != null ? _i4.InviteRequest.fromJson(data, this) : null)
          as T;
    }
    if (t == _i5.UserProfile) {
      return _i5.UserProfile.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i5.UserProfile?>()) {
      return (data != null ? _i5.UserProfile.fromJson(data, this) : null) as T;
    }
    if (t == _i6.PlatformSettings) {
      return _i6.PlatformSettings.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i6.PlatformSettings?>()) {
      return (data != null ? _i6.PlatformSettings.fromJson(data, this) : null)
          as T;
    }
    if (t == _i7.Dispute) {
      return _i7.Dispute.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i7.Dispute?>()) {
      return (data != null ? _i7.Dispute.fromJson(data, this) : null) as T;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.HealthStatus) {
      return 'HealthStatus';
    }
    if (data is _i4.RegisterRequest) {
      return 'RegisterRequest';
    }
    if (data is _i4.LoginRequest) {
      return 'LoginRequest';
    }
    if (data is _i4.AuthResponse) {
      return 'AuthResponse';
    }
    if (data is _i4.UpdateProfileRequest) {
      return 'UpdateProfileRequest';
    }
    if (data is _i4.UpdateUserRoleRequest) {
      return 'UpdateUserRoleRequest';
    }
    if (data is _i4.UpdatePlatformSettingsRequest) {
      return 'UpdatePlatformSettingsRequest';
    }
    if (data is _i4.CreateDisputeRequest) {
      return 'CreateDisputeRequest';
    }
    if (data is _i4.ResolveDisputeRequest) {
      return 'ResolveDisputeRequest';
    }
    if (data is _i4.InvitationResponse) {
      return 'InvitationResponse';
    }
    if (data is _i4.InviteRequest) {
      return 'InviteRequest';
    }
    if (data is _i5.UserProfile) {
      return 'UserProfile';
    }
    if (data is _i6.PlatformSettings) {
      return 'PlatformSettings';
    }
    if (data is _i7.Dispute) {
      return 'Dispute';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'HealthStatus') {
      return deserialize<_i3.HealthStatus>(data['data']);
    }
    if (data['className'] == 'RegisterRequest') {
      return deserialize<_i4.RegisterRequest>(data['data']);
    }
    if (data['className'] == 'LoginRequest') {
      return deserialize<_i4.LoginRequest>(data['data']);
    }
    if (data['className'] == 'AuthResponse') {
      return deserialize<_i4.AuthResponse>(data['data']);
    }
    if (data['className'] == 'UpdateProfileRequest') {
      return deserialize<_i4.UpdateProfileRequest>(data['data']);
    }
    if (data['className'] == 'UpdateUserRoleRequest') {
      return deserialize<_i4.UpdateUserRoleRequest>(data['data']);
    }
    if (data['className'] == 'UpdatePlatformSettingsRequest') {
      return deserialize<_i4.UpdatePlatformSettingsRequest>(data['data']);
    }
    if (data['className'] == 'CreateDisputeRequest') {
      return deserialize<_i4.CreateDisputeRequest>(data['data']);
    }
    if (data['className'] == 'ResolveDisputeRequest') {
      return deserialize<_i4.ResolveDisputeRequest>(data['data']);
    }
    if (data['className'] == 'InvitationResponse') {
      return deserialize<_i4.InvitationResponse>(data['data']);
    }
    if (data['className'] == 'InviteRequest') {
      return deserialize<_i4.InviteRequest>(data['data']);
    }
    if (data['className'] == 'UserProfile') {
      return deserialize<_i5.UserProfile>(data['data']);
    }
    if (data['className'] == 'PlatformSettings') {
      return deserialize<_i6.PlatformSettings>(data['data']);
    }
    if (data['className'] == 'Dispute') {
      return deserialize<_i7.Dispute>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'bay_serverpod';
}
