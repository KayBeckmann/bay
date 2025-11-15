# Bay Trading Platform

## Description
Cross-platform Handelsplattform in Flutter mit einem Serverpod-Dart-Backend. Ziel ist es, einen sicheren Marktplatz mit Escrow- und Multi-Sig-Unterstützung für digitale und physische Güter zu schaffen.

## Getting Started

### Prerequisites
- Flutter SDK (3.22 oder höher empfohlen)
- Dart SDK (wird mit Flutter installiert)
- PostgreSQL (für das geplante Serverpod-Backend)
- Docker Desktop (optional, für Container-Setup)

### Installation
```bash
git clone <repository-url>
cd bay

# Frontend vorbereiten
cd bay_app
flutter pub get
flutter run
```

## Usage
- Flutter-Client liefert neben Marketplace-Teasern eine Account-Seite mit Login & Registrierung, Profilpflege, Admin/Moderator-Tools und Dispute-Composer (siehe `docs/auth_architecture.md`).
- Das Serverpod-Backend stellt passende Endpunkte bereit (auth/profile/admin/moderator/dispute/invitation) und ist über `docker/docker-compose.yml` schnell lauffähig. Aktuell laufen User & Sessions in-memory, PostgreSQL-Anbindung folgt.

## Contributing
1. Fork nutzen und Branch anlegen (`feature/<name>`)
2. Änderungen vornehmen und testen (`flutter analyze`, geplante Backend-Tests)
3. Merge Request erstellen

## License
Siehe `LICENSE`.
