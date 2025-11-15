/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/health_endpoint.dart' as _i2;
import '../endpoints/auth_endpoint.dart' as _i3;
import '../endpoints/profile_endpoint.dart' as _i4;
import '../endpoints/admin_endpoint.dart' as _i5;
import '../endpoints/moderator_endpoint.dart' as _i6;
import '../endpoints/dispute_endpoint.dart' as _i7;
import '../endpoints/invitation_endpoint.dart' as _i8;
import '../generated/auth_payloads.dart' as _i9;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'health': _i2.HealthEndpoint()
        ..initialize(
          server,
          'health',
          null,
        ),
      'auth': _i3.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'profile': _i4.ProfileEndpoint()
        ..initialize(
          server,
          'profile',
          null,
        ),
      'admin': _i5.AdminEndpoint()
        ..initialize(
          server,
          'admin',
          null,
        ),
      'moderator': _i6.ModeratorEndpoint()
        ..initialize(
          server,
          'moderator',
          null,
        ),
      'dispute': _i7.DisputeEndpoint()
        ..initialize(
          server,
          'dispute',
          null,
        ),
      'invitation': _i8.InvitationEndpoint()
        ..initialize(
          server,
          'invitation',
          null,
        ),
    };
    connectors['health'] = _i1.EndpointConnector(
      name: 'health',
      endpoint: endpoints['health']!,
      methodConnectors: {
        'status': _i1.MethodConnector(
          name: 'status',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['health'] as _i2.HealthEndpoint).status(
            session,
          ),
        )
      },
    );
  }
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'register': _i1.MethodConnector(
          name: 'register',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i9.RegisterRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).register(
            session,
            params['request'],
          ),
        ),
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i9.LoginRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).login(
            session,
            params['request'],
          ),
        ),
        'logout': _i1.MethodConnector(
          name: 'logout',
          params: {
            'token': _i1.ParameterDescription(
              name: 'token',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).logout(
            session,
            params['token'],
          ),
        ),
        'refresh': _i1.MethodConnector(
          name: 'refresh',
          params: {
            'token': _i1.ParameterDescription(
              name: 'token',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).refresh(
            session,
            params['token'],
          ),
        ),
      },
    );
    connectors['profile'] = _i1.EndpointConnector(
      name: 'profile',
      endpoint: endpoints['profile']!,
      methodConnectors: {
        'me': _i1.MethodConnector(
          name: 'me',
          params: {
            'token': _i1.ParameterDescription(
              name: 'token',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i4.ProfileEndpoint).me(
            session,
            params['token'],
          ),
        ),
        'updateProfile': _i1.MethodConnector(
          name: 'updateProfile',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i9.UpdateProfileRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['profile'] as _i4.ProfileEndpoint).updateProfile(
            session,
            params['request'],
          ),
        ),
      },
    );
    connectors['admin'] = _i1.EndpointConnector(
      name: 'admin',
      endpoint: endpoints['admin']!,
      methodConnectors: {
        'listUsers': _i1.MethodConnector(
          name: 'listUsers',
          params: {
            'token': _i1.ParameterDescription(
              name: 'token',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i5.AdminEndpoint).listUsers(
            session,
            params['token'],
          ),
        ),
        'setUserRole': _i1.MethodConnector(
          name: 'setUserRole',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i9.UpdateUserRoleRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i5.AdminEndpoint).setUserRole(
            session,
            params['request'],
          ),
        ),
        'getSettings': _i1.MethodConnector(
          name: 'getSettings',
          params: {
            'token': _i1.ParameterDescription(
              name: 'token',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i5.AdminEndpoint).getSettings(
            session,
            params['token'],
          ),
        ),
        'updateSettings': _i1.MethodConnector(
          name: 'updateSettings',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i9.UpdatePlatformSettingsRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i5.AdminEndpoint).updateSettings(
            session,
            params['request'],
          ),
        ),
      },
    );
    connectors['moderator'] = _i1.EndpointConnector(
      name: 'moderator',
      endpoint: endpoints['moderator']!,
      methodConnectors: {
        'listDisputes': _i1.MethodConnector(
          name: 'listDisputes',
          params: {
            'token': _i1.ParameterDescription(
              name: 'token',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['moderator'] as _i6.ModeratorEndpoint).listDisputes(
            session,
            params['token'],
          ),
        ),
        'resolveDispute': _i1.MethodConnector(
          name: 'resolveDispute',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i9.ResolveDisputeRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['moderator'] as _i6.ModeratorEndpoint).resolveDispute(
            session,
            params['request'],
          ),
        ),
      },
    );
    connectors['dispute'] = _i1.EndpointConnector(
      name: 'dispute',
      endpoint: endpoints['dispute']!,
      methodConnectors: {
        'createDispute': _i1.MethodConnector(
          name: 'createDispute',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i9.CreateDisputeRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dispute'] as _i7.DisputeEndpoint).createDispute(
            session,
            params['request'],
          ),
        ),
        'myDisputes': _i1.MethodConnector(
          name: 'myDisputes',
          params: {
            'token': _i1.ParameterDescription(
              name: 'token',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dispute'] as _i7.DisputeEndpoint).myDisputes(
            session,
            params['token'],
          ),
        ),
      },
    );
    connectors['invitation'] = _i1.EndpointConnector(
      name: 'invitation',
      endpoint: endpoints['invitation']!,
      methodConnectors: {
        'requestInvite': _i1.MethodConnector(
          name: 'requestInvite',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i9.InviteRequest>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['invitation'] as _i8.InvitationEndpoint)
                  .requestInvite(
            session,
            params['request'],
          ),
        ),
        'pending': _i1.MethodConnector(
          name: 'pending',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['invitation'] as _i8.InvitationEndpoint).pending(
            session,
          ),
        ),
      },
    );
  }
}
