import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Basic liveness endpoint that performs lightweight checks for monitoring.
class HealthEndpoint extends Endpoint {
  final DateTime _startedAt = DateTime.now().toUtc();

  Future<HealthStatus> status(Session session) async {
    var dbHealthy = true;
    try {
      await session.db.unsafeQuery('SELECT 1;');
    } catch (error, stackTrace) {
      dbHealthy = false;
      session.log(
        'Database health check failed: $error',
        level: LogLevel.warning,
        stackTrace: stackTrace,
      );
    }

    return HealthStatus(
      status: dbHealthy ? 'ok' : 'degraded',
      timestamp: DateTime.now().toUtc(),
      uptimeSeconds: DateTime.now().difference(_startedAt).inSeconds,
      databaseHealthy: dbHealthy,
    );
  }
}
