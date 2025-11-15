/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i3;

/// {@category Endpoint}
class EndpointHealth extends _i1.EndpointRef {
  EndpointHealth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'health';

  _i2.Future<_i3.HealthStatus> status() =>
      caller.callServerEndpoint<_i3.HealthStatus>(
        'health',
        'status',
        {},
      );
}

/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  _i2.Future<_i3.AuthResponse> register(_i3.RegisterRequest request) =>
      caller.callServerEndpoint<_i3.AuthResponse>(
        'auth',
        'register',
        {'request': request},
      );

  _i2.Future<_i3.AuthResponse> login(_i3.LoginRequest request) =>
      caller.callServerEndpoint<_i3.AuthResponse>(
        'auth',
        'login',
        {'request': request},
      );

  _i2.Future<void> logout(String token) =>
      caller.callServerEndpoint<void>(
        'auth',
        'logout',
        {'token': token},
      );

  _i2.Future<_i3.AuthResponse> refresh(String token) =>
      caller.callServerEndpoint<_i3.AuthResponse>(
        'auth',
        'refresh',
        {'token': token},
      );
}

/// {@category Endpoint}
class EndpointProfile extends _i1.EndpointRef {
  EndpointProfile(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'profile';

  _i2.Future<_i3.UserProfile> me(String token) =>
      caller.callServerEndpoint<_i3.UserProfile>(
        'profile',
        'me',
        {'token': token},
      );

  _i2.Future<_i3.UserProfile> updateProfile(
          _i3.UpdateProfileRequest request) =>
      caller.callServerEndpoint<_i3.UserProfile>(
        'profile',
        'updateProfile',
        {'request': request},
      );
}

/// {@category Endpoint}
class EndpointAdmin extends _i1.EndpointRef {
  EndpointAdmin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'admin';

  _i2.Future<List<_i3.UserProfile>> listUsers(String token) =>
      caller.callServerEndpoint<List<_i3.UserProfile>>(
        'admin',
        'listUsers',
        {'token': token},
      );

  _i2.Future<_i3.UserProfile> setUserRole(
          _i3.UpdateUserRoleRequest request) =>
      caller.callServerEndpoint<_i3.UserProfile>(
        'admin',
        'setUserRole',
        {'request': request},
      );

  _i2.Future<_i3.PlatformSettings> getSettings(String token) =>
      caller.callServerEndpoint<_i3.PlatformSettings>(
        'admin',
        'getSettings',
        {'token': token},
      );

  _i2.Future<_i3.PlatformSettings> updateSettings(
          _i3.UpdatePlatformSettingsRequest request) =>
      caller.callServerEndpoint<_i3.PlatformSettings>(
        'admin',
        'updateSettings',
        {'request': request},
      );
}

/// {@category Endpoint}
class EndpointModerator extends _i1.EndpointRef {
  EndpointModerator(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'moderator';

  _i2.Future<List<_i3.Dispute>> listDisputes(String token) =>
      caller.callServerEndpoint<List<_i3.Dispute>>(
        'moderator',
        'listDisputes',
        {'token': token},
      );

  _i2.Future<_i3.Dispute> resolveDispute(
          _i3.ResolveDisputeRequest request) =>
      caller.callServerEndpoint<_i3.Dispute>(
        'moderator',
        'resolveDispute',
        {'request': request},
      );
}

/// {@category Endpoint}
class EndpointDispute extends _i1.EndpointRef {
  EndpointDispute(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'dispute';

  _i2.Future<_i3.Dispute> createDispute(
          _i3.CreateDisputeRequest request) =>
      caller.callServerEndpoint<_i3.Dispute>(
        'dispute',
        'createDispute',
        {'request': request},
      );

  _i2.Future<List<_i3.Dispute>> myDisputes(String token) =>
      caller.callServerEndpoint<List<_i3.Dispute>>(
        'dispute',
        'myDisputes',
        {'token': token},
      );
}

/// {@category Endpoint}
class EndpointInvitation extends _i1.EndpointRef {
  EndpointInvitation(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'invitation';

  _i2.Future<_i3.InvitationResponse> requestInvite(
          _i3.InviteRequest request) =>
      caller.callServerEndpoint<_i3.InvitationResponse>(
        'invitation',
        'requestInvite',
        {'request': request},
      );

  _i2.Future<List<_i3.InvitationResponse>> pending() =>
      caller.callServerEndpoint<List<_i3.InvitationResponse>>(
        'invitation',
        'pending',
        {},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
  }) : super(
          host,
          _i3.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    health = EndpointHealth(this);
    auth = EndpointAuth(this);
    profile = EndpointProfile(this);
    admin = EndpointAdmin(this);
    moderator = EndpointModerator(this);
    dispute = EndpointDispute(this);
    invitation = EndpointInvitation(this);
  }

  late final EndpointHealth health;

  late final EndpointAuth auth;

  late final EndpointProfile profile;

  late final EndpointAdmin admin;

  late final EndpointModerator moderator;

  late final EndpointDispute dispute;

  late final EndpointInvitation invitation;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'health': health,
        'auth': auth,
        'profile': profile,
        'admin': admin,
        'moderator': moderator,
        'dispute': dispute,
        'invitation': invitation,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
