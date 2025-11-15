# Benutzerverwaltung & Authentifizierung

## Überblick
- **Backend**: Serverpod-Endpunkte (`auth`, `profile`, `admin`, `moderator`, `dispute`, `invitation`) kapseln Registrierung, Login, Profilverwaltung, Rollensteuerung und Streitfall-Workflows. Alle Daten werden aktuell in-memory verwaltet, sodass spätere Migrationen auf PostgreSQL nur die Repositories betreffen.
- **Frontend**: Die Flutter-App besitzt eine dedizierte Account-Seite mit Login/Register-Formular, Profilpflege, Dispute-Composer, Admin-Einstellungen und Moderator-Tools. Der interne `AuthState` nutzt per Default eine `MockAuthApi`, kann jedoch leicht gegen die Serverpod-API ausgetauscht werden.
- **Passwörter & Sessions**: Hashing erfolgt über SHA-512 (Server) mit zufälligen Salts. Sitzungen werden als kurzlebige Tokens (12h) verwaltet; Refresh, Logout und Rollenprüfungen laufen zentral über `AuthService`.
- **Einladungssystem**: Deaktiviert man Registrierungen (`REGISTRATION_ENABLED=false`), akzeptiert die Registrierung nur noch gültige Einladungscodes. Admins können Codes generieren; zusätzlich existiert ein Invite-Request-Formular im Frontend.
- **Moderator:innen**: Können offene Streitfälle einsehen und mit einer optionalen Notiz abschließen. Nutzer sehen alle eigenen Fälle inkl. Status.
- **SMTP-Konfiguration**: Wird über `PlatformSettingsService` aus Umgebungsvariablen gelesen und zentral bereitgestellt (`EmailService`). In der Mock-Umgebung werden Mails geloggt.

## Endpunkte (Serverpod)
| Endpoint | Methoden | Beschreibung |
| --- | --- | --- |
| `health` | `status` | Health/Liveness Check |
| `auth` | `register`, `login`, `logout`, `refresh` | Auth-Flows mit Session-Token |
| `profile` | `me`, `updateProfile` | Nutzerinformationen abrufen und ändern |
| `admin` | `listUsers`, `setUserRole`, `getSettings`, `updateSettings` | Rollenverwaltung & Plattform-Flags |
| `moderator` | `listDisputes`, `resolveDispute` | Streitfälle bearbeiten |
| `dispute` | `createDispute`, `myDisputes` | Streitfälle erstellen/auflisten |
| `invitation` | `requestInvite`, `pending` | Einladungscodes generieren und nachverfolgen |

## Frontend Flows (Account-Seite)
1. **Login/Registrierung**: Zwei Cards, die Email+Passwort entgegennehmen. Registrierung enthält optionalen Einladungscode.
2. **Profilpflege**: Anzeigename ändern, Refresh & Logout Buttons, Metainformationen (Rolle, Aktivität).
3. **Disputes**: Formular zum Anlegen eines Streitfalls, Liste aller Fälle; Moderatoren sehen Auflösen-Buttons.
4. **Adminbereich**: Switches für `registrationEnabled` & `guestAccessEnabled`, Tabelle für Benutzerrollenänderung.
5. **Einladungen**: Einfaches Formular zum Anstoßen neuer Einladungscodes (Mono-Flow für MVP).

## Weitere Schritte
- Persistente Ablage (Postgres + Migrationen) für User, Sessions, Streitfälle.
- Austausch der `MockAuthApi` im Flutter-Client durch den echten Serverpod-Client (`bay_serverpod_client`).
- Integration von Apple/Google Sign-In (entsprechend der TODO-Liste Phase 2).
