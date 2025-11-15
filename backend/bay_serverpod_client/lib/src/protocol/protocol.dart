/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'health_status.dart' as _i2;
import 'auth_payloads.dart' as _i3;
import 'user_profile.dart' as _i4;
import 'platform_settings.dart' as _i5;
import 'dispute.dart' as _i6;
export 'health_status.dart';
export 'auth_payloads.dart';
export 'user_profile.dart';
export 'platform_settings.dart';
export 'dispute.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.HealthStatus) {
      return _i2.HealthStatus.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.HealthStatus?>()) {
      return (data != null ? _i2.HealthStatus.fromJson(data, this) : null) as T;
    }
    if (t == _i3.RegisterRequest) {
      return _i3.RegisterRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.RegisterRequest?>()) {
      return (data != null ? _i3.RegisterRequest.fromJson(data, this) : null)
          as T;
    }
    if (t == _i3.LoginRequest) {
      return _i3.LoginRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.LoginRequest?>()) {
      return (data != null ? _i3.LoginRequest.fromJson(data, this) : null) as T;
    }
    if (t == _i3.AuthResponse) {
      return _i3.AuthResponse.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.AuthResponse?>()) {
      return (data != null ? _i3.AuthResponse.fromJson(data, this) : null) as T;
    }
    if (t == _i3.UpdateProfileRequest) {
      return _i3.UpdateProfileRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.UpdateProfileRequest?>()) {
      return (data != null
          ? _i3.UpdateProfileRequest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i3.UpdateUserRoleRequest) {
      return _i3.UpdateUserRoleRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.UpdateUserRoleRequest?>()) {
      return (data != null
          ? _i3.UpdateUserRoleRequest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i3.UpdatePlatformSettingsRequest) {
      return _i3.UpdatePlatformSettingsRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.UpdatePlatformSettingsRequest?>()) {
      return (data != null
          ? _i3.UpdatePlatformSettingsRequest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i3.CreateDisputeRequest) {
      return _i3.CreateDisputeRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.CreateDisputeRequest?>()) {
      return (data != null
          ? _i3.CreateDisputeRequest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i3.ResolveDisputeRequest) {
      return _i3.ResolveDisputeRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.ResolveDisputeRequest?>()) {
      return (data != null
          ? _i3.ResolveDisputeRequest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i3.InvitationResponse) {
      return _i3.InvitationResponse.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.InvitationResponse?>()) {
      return (data != null
          ? _i3.InvitationResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i3.InviteRequest) {
      return _i3.InviteRequest.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.InviteRequest?>()) {
      return (data != null ? _i3.InviteRequest.fromJson(data, this) : null)
          as T;
    }
    if (t == _i4.UserProfile) {
      return _i4.UserProfile.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.UserProfile?>()) {
      return (data != null ? _i4.UserProfile.fromJson(data, this) : null) as T;
    }
    if (t == _i5.PlatformSettings) {
      return _i5.PlatformSettings.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i5.PlatformSettings?>()) {
      return (data != null ? _i5.PlatformSettings.fromJson(data, this) : null)
          as T;
    }
    if (t == _i6.Dispute) {
      return _i6.Dispute.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i6.Dispute?>()) {
      return (data != null ? _i6.Dispute.fromJson(data, this) : null) as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.HealthStatus) {
      return 'HealthStatus';
    }
    if (data is _i3.RegisterRequest) {
      return 'RegisterRequest';
    }
    if (data is _i3.LoginRequest) {
      return 'LoginRequest';
    }
    if (data is _i3.AuthResponse) {
      return 'AuthResponse';
    }
    if (data is _i3.UpdateProfileRequest) {
      return 'UpdateProfileRequest';
    }
    if (data is _i3.UpdateUserRoleRequest) {
      return 'UpdateUserRoleRequest';
    }
    if (data is _i3.UpdatePlatformSettingsRequest) {
      return 'UpdatePlatformSettingsRequest';
    }
    if (data is _i3.CreateDisputeRequest) {
      return 'CreateDisputeRequest';
    }
    if (data is _i3.ResolveDisputeRequest) {
      return 'ResolveDisputeRequest';
    }
    if (data is _i3.InvitationResponse) {
      return 'InvitationResponse';
    }
    if (data is _i3.InviteRequest) {
      return 'InviteRequest';
    }
    if (data is _i4.UserProfile) {
      return 'UserProfile';
    }
    if (data is _i5.PlatformSettings) {
      return 'PlatformSettings';
    }
    if (data is _i6.Dispute) {
      return 'Dispute';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'HealthStatus') {
      return deserialize<_i2.HealthStatus>(data['data']);
    }
    if (data['className'] == 'RegisterRequest') {
      return deserialize<_i3.RegisterRequest>(data['data']);
    }
    if (data['className'] == 'LoginRequest') {
      return deserialize<_i3.LoginRequest>(data['data']);
    }
    if (data['className'] == 'AuthResponse') {
      return deserialize<_i3.AuthResponse>(data['data']);
    }
    if (data['className'] == 'UpdateProfileRequest') {
      return deserialize<_i3.UpdateProfileRequest>(data['data']);
    }
    if (data['className'] == 'UpdateUserRoleRequest') {
      return deserialize<_i3.UpdateUserRoleRequest>(data['data']);
    }
    if (data['className'] == 'UpdatePlatformSettingsRequest') {
      return deserialize<_i3.UpdatePlatformSettingsRequest>(data['data']);
    }
    if (data['className'] == 'CreateDisputeRequest') {
      return deserialize<_i3.CreateDisputeRequest>(data['data']);
    }
    if (data['className'] == 'ResolveDisputeRequest') {
      return deserialize<_i3.ResolveDisputeRequest>(data['data']);
    }
    if (data['className'] == 'InvitationResponse') {
      return deserialize<_i3.InvitationResponse>(data['data']);
    }
    if (data['className'] == 'InviteRequest') {
      return deserialize<_i3.InviteRequest>(data['data']);
    }
    if (data['className'] == 'UserProfile') {
      return deserialize<_i4.UserProfile>(data['data']);
    }
    if (data['className'] == 'PlatformSettings') {
      return deserialize<_i5.PlatformSettings>(data['data']);
    }
    if (data['className'] == 'Dispute') {
      return deserialize<_i6.Dispute>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
