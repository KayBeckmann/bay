# UI-Konzept nach Material Design

Dieses Dokument beschreibt das erste UI-Konzept für die Handelsplattform auf Basis der Google Material Design Guidelines. Ziel ist es, in Flutter schnell kohärente Oberflächen zu entwerfen, die konsistent über Mobilgeräte, Tablets, Desktop und Web funktionieren.

## Leitlinien & Designprinzipien
- **Material 3 (You)** dient als Grundlage, um adaptive Farbpaletten und dynamische Typografie zu verwenden.
- Nutzerführung folgt dem Prinzip „Content first“ – alle kritischen Aktionen (z. B. Kauf/Verkauf) liegen maximal zwei Interaktionen entfernt.
- Zustände (Laden, Fehler, Erfolge) werden durch einheitliche Farb- und Icon-Sets kommuniziert.

## Farb- & Typografie-System
- **Primärfarben**: `#0A5C74` (Blaugrün, Vertrauen), `#F5A201` (Akzent für Calls-to-Action).
- **Sekundärfarben**: `#1F2933` (Dark Surface), `#F4F6F8` (Light Surface) für Hell-/Dunkelmodus.
- **Feedbackfarben**: Grün `#1ABF7E` (positiv), Rot `#D64545` (negativ).
- **Typografie**: Material 3 Roboto/Roboto Flex, Display-L für große Hero-Elemente, Title-M für Karten, Body-M für Fließtexte, Label-S für Buttons/Badges. Schriftgrößen folgen dem `textTheme` von Flutter.

## Layout & Komponenten
1. **Onboarding / Login Flow**
   - Full-bleed Illustration, Card für Formular mit Social Login Buttons.
   - ProgressIndicator und Snackbar für Rückmeldungen.
2. **Dashboard (Default Landing)**
   - AppBar mit Quick Actions (Search, Notifications, Profile Avatar).
   - `NavigationRail` (Desktop) bzw. `NavigationBar` (Mobile) für die Bereiche: Dashboard, Angebote, Aufträge, Wallet, Einstellungen.
   - Contentbereich: 
     - KPI-Kacheln (z. B. Offene Aufträge, Guthaben).
     - Letzte Aktivitäten Timeline.
     - Highlight-Karte „Top Angebot“ inkl. CTA.
3. **Angebotsliste & Detail**
   - `SliverAppBar` mit Filterchips und Sortiermenü.
   - Cards mit Produktbild, Badge (z. B. „Neu“, „Escrow“), Preis, Händlerbewertung.
   - Detailseite mit TabBar (Beschreibung, Bewertung, Verkäuferprofil, Historie) + CTA „Kaufen“.
4. **Trade-/Escrow-Flow**
   - Stepper-Komponente: Angebot prüfen → Zahlung wählen → Escrow bestätigen → Abschluss.
   - `Banner` zeigt Status (z. B. „Warte auf Banküberweisung“).
5. **Wallet & Multi-Sig**
   - `ListView` mit Assets, CTA „Neues Multi-Sig Wallet“.
   - BottomSheet für Signaturen/Teilnehmer hinzufügen.

## Responsive Verhalten
- Breakpoints orientieren sich an Material 3 (`0-600`, `600-840`, `>840`).
- Desktop nutzt `NavigationRail` + persistente Filterpaneels, Mobile arbeitet mit Modal Bottom Sheets und Vollbilddialogen für komplexe Interaktionen.
- Wichtige Tabellen (z. B. Orderbuch) erhalten kompakte/expansive Layouts abhängig vom Viewport.

## Interaktionsmuster
- Buttons folgen Material 3 Typen (Filled, Filled Tonal, Outline, Text). Kritische Aktionen (z. B. Kauf bestätigen) nutzen `FilledButton`.
- Snackbar für sekundäre Bestätigungen, Dialoge für irreversible Aktionen.
- Bewegungen (Hero, Shared Axis) betonen Kontextwechsel (z. B. von Liste zu Detail).

## Nächste Schritte
- UI-Kit in Figma/Flutter Widgetbook umsetzen.
- Design Tokens als `ThemeData` ableiten.
- Accessibility Check (Kontrast, Screen Reader Labels) integrieren.
