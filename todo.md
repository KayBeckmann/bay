# To-Do Liste: Handelsplattform

## Phase 1: Projekt-Setup & Kernarchitektur
- [x] Detaillierten Projektumfang und User Stories definieren.
    - [x] User Stories in `docs/user_stories.md` dokumentieren.
- [x] Backend-Framework/-Sprache ausgewählt: Dart mit Serverpod.
- [x] Datenbank ausgewählt: PostgreSQL. ORM/ODM festlegen.
- [x] Initiales Flutter-Projekt für Multi-Plattform-Entwicklung aufsetzen.
- [x] Frontend-UI nach Google Material Design Guidelines konzipieren.
- [x] Initiales Backend-Projekt aufsetzen.
    - [x] Serverpod-Monorepo (protocol/server/clients) initialisieren.
    - [x] Basis-Endpunkt für Health-Check bereitstellen.
    - [x] PostgreSQL-Anbindung konfigurieren.
- [x] Dockerisierung für Frontend- und Backend-Dienste implementieren.
- [x] `.gitignore` für sensible Dateien (`.env`) anpassen.
- [x] `env-example`-Datei mit Platzhalter-Konfigurationen erstellen.
- [x] Detaillierte Recherche zu Dart-Bibliotheken für Bitcoin und Multi-Sig Wallets.

## Phase 2: Benutzerverwaltung & Authentifizierung
- [ ] Implementierung der Benutzerregistrierung (Frontend & Backend).
    - [ ] E-Mail und Passwort Registrierung.
    - [ ] Apple ID Registrierung.
    - [ ] Google Registrierung.
    - [ ] E-Mail Einladungssystem (falls Registrierung deaktiviert).
- [ ] Implementierung der Benutzeranmeldung (Frontend & Backend).
    - [ ] E-Mail und Passwort Anmeldung.
    - [ ] Apple ID Anmeldung.
    - [ ] Google Anmeldung.
- [ ] Benutzerprofilverwaltung implementieren.
- [ ] Sicheres Passwort-Hashing und Session-Management implementieren.
- [ ] Implementierung von Administrator-Funktionen:
    - [ ] Benutzerrollen verwalten (Moderator ernennen/entfernen).
    - [ ] Plattform-Einstellungen steuern (`GUEST_ACCESS_ENABLED`, `REGISTRATION_ENABLED`).
- [ ] Implementierung von Moderator-Funktionen:
    - [ ] Streitigkeiten schlichten.
- [ ] SMTP-Konfiguration für E-Mail-Versand einrichten.

## Phase 3: Produkt-/Dienstleistungsangebote
- [ ] Funktionalität zum Erstellen/Bearbeiten/Löschen von Produkt-/Dienstleistungsangeboten implementieren.
- [ ] Bild-/Medien-Upload für Angebote implementieren.
- [ ] Such- und Filterfunktionen für Angebote implementieren.

## Phase 4: Kaufabwicklung & Zahlungsintegration
- [ ] Warenkorb-/Kaufabwicklung implementieren.
- [ ] Integration von Banküberweisung.
- [ ] Integration von PayPal.
- [ ] Integration von Google Wallet.
- [ ] Integration von Bitcoin-Zahlung.

## Phase 5: Treuhänderfunktion & Multi-Sig Wallet
- [ ] Recherche von Multi-Sig Wallet-Lösungen für Bitcoin/andere Kryptowährungen.
- [ ] Implementierung der Multi-Sig Wallet für die Treuhänderfunktion.
- [ ] Definition und Implementierung der Treuhänderlogik (Freigabebedingungen).

## Phase 6: Bereitstellung & Infrastruktur
- [ ] Docker Compose für Multi-Service-Bereitstellung konfigurieren.
- [ ] Handhabung variabler URLs für Dienste implementieren.
- [ ] Recherche und Implementierung der Tor-Netzwerk-Hosting-Option.
- [ ] CI/CD-Pipeline einrichten (optional, aber empfehlenswert).

## Phase 7: Tests & Verfeinerung
- [ ] Umfassende Unit- und Integrationstests schreiben.
- [ ] Sicherheitsaudits durchführen.
- [ ] UI/UX-Verfeinerung und Polishing.
- [ ] Performance-Optimierung.

## Phase 8: Dokumentation & Veröffentlichung
- [ ] `README.md` mit detaillierten Setup- und Nutzungsanweisungen aktualisieren.
- [ ] API-Dokumentation erstellen.
- [ ] Vorbereitung für die erste Veröffentlichung.
