# Backend Monorepo

Der Ordner enthält das Serverpod-Backend der Handelsplattform.

## Struktur
- `bay_serverpod_server`: Serverpod-Server inkl. Endpoints, Konfigurationen und Docker Setup. Aktuell existiert ein `health`-Endpoint mit PostgreSQL-Check.
- `bay_serverpod_client`: Generate-ter Client, der von Flutter/Dart-Apps genutzt werden kann.
- `serverpod.yaml`: Deployment-Metadaten für die lokale Monorepo-Struktur.

## Lokales Setup (Kurzfassung)
1. `config/passwords.yaml.example` nach `config/passwords.yaml` kopieren und Platzhalter ersetzen.
2. `.env` (siehe `env-example`) mit `DATABASE_URL`, `POSTGRES_PASSWORD` etc. befüllen.
3. `docker compose up --build --detach` innerhalb von `bay_serverpod_server`, um Postgres & Redis zu starten.
4. `dart bin/main.dart --apply-migrations` starten. Der Health-Check ist anschließend unter `http://localhost:8080/health/status` erreichbar.
