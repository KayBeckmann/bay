# Gemini Project Instructions

This file contains specific instructions and preferences for the Gemini CLI agent to ensure consistent and efficient project development.

## General Guidelines:
- [ ] Add project-specific coding style guidelines here.
- [ ] Add preferred testing commands here.
- [ ] Add deployment instructions here.
- [ ] Add any other specific instructions for Gemini here.
- [x] Nach jeder erfolgreichen Iteration und einem bestandenen Unit-Test soll ein Git-Commit erstellt und anschließend zu GitHub gepusht werden.
- [x] Während des Entwicklungsprozesses sollen Unit-Tests erstellt und vor jedem Git-Commit ausgeführt werden.

## Project Specifics:
### Project Type: Trading Platform (similar to eBay/Kleinanzeigen)

### Frontend:
- **Technology:** Flutter (for Android, Apple, Windows, Linux, Web-App)

### Backend:
- **Technology:** Dart with Serverpod

### Database:
- **Technology:** PostgreSQL

### Infrastructure & Deployment:
- **Containerization:** Docker (all services in Docker containers)
- **Hosting:** Web server with variable URL. Option for Tor network hosting.
- **Configuration:** All configurations in `.env` file.
    - `GUEST_ACCESS_ENABLED`: Boolean (True/False) to control guest visibility.
    - `REGISTRATION_ENABLED`: Boolean (True/False) to control open registration.
    - SMTP configuration for email invitations.
- **Version Control:** `.env` file should be in `.gitignore`.

### User Roles:
- **Guest User (Gastnutzer):** Can browse platform (visibility controlled by `GUEST_ACCESS_ENABLED`).
- **Registered User (Registrierter Nutzer):** Has an account, can buy and sell.
- **Moderator (Moderator):** Appointed by Administrator, mediates disputes.
- **Administrator (Administrator):** Manages platform, appoints moderators, controls global settings.

### Key Features:
- User registration and login.
    - Classic Email and Password.
    - Apple ID login.
    - Google login.
    - Email invitation system (if open registration is disabled).
- Offering goods and services.
- Purchasing functionality.
- Payment methods: Bank transfer, PayPal, Google Wallet, Bitcoin.
- Multi-Sig Wallet for escrow function (for higher value transactions).