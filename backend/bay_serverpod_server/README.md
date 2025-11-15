# bay_serverpod_server

Serverpod backend for the Bay trading platform. It currently exposes a `health.status`
endpoint that performs an application and database check.

## Lokale Entwicklung

1. Kopiere `config/passwords.yaml.example` nach `config/passwords.yaml` und passe die
   Secrets für Datenbank, Redis und Service-Kommunikation an.
2. Starte Postgres & Redis (Standard-Ports werden via `docker-compose.yaml` auf 8090/8091 gemappt):

```bash
docker compose up --build --detach
```

3. (Optional) Passe `config/development.yaml` an deine Umgebung an.
4. Starte den Server und führe bei Bedarf Migrationen aus:

```bash
dart bin/main.dart --apply-migrations
```

Stoppen:

```bash
docker compose stop
```
