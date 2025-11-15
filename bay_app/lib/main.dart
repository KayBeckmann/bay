import 'package:flutter/material.dart';

void main() {
  runApp(const BayApp());
}

class BayApp extends StatelessWidget {
  const BayApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF6758FF),
      brightness: Brightness.light,
    );

    return MaterialApp(
      title: 'Bay Trading Platform',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: colorScheme.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          elevation: 0,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: colorScheme.surfaceContainerHighest,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: colorScheme.surface,
          indicatorColor: colorScheme.primaryContainer,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
          ),
        ),
        textTheme: ThemeData.light().textTheme.apply(
              bodyColor: colorScheme.onSurface,
              displayColor: colorScheme.onSurface,
            ),
      ),
      home: const HomeShell(),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _selectedIndex = 0;

  static final _pages = <_PageDefinition>[
    _PageDefinition(
      headline: 'Marketplace',
      body:
          'Entdecke verifizierte Händler:innen, sichere Escrow-Zahlungen und digitale Güter mit einem Klick.',
      accentColor: const Color(0xFF6758FF),
      icon: Icons.storefront,
      actionLabel: 'Angebote entdecken',
      highlights: const [
        'Sichere Escrow-Abwicklung',
        'Digitale & physische Güter',
        'Multi-Sig Schutz',
      ],
    ),
    _PageDefinition(
      headline: 'Warenkorb',
      body:
          'Behalte offene Transaktionen im Blick, tracke Lieferungen und vergleiche Angebote ganz entspannt.',
      accentColor: const Color(0xFF00A86B),
      icon: Icons.shopping_bag,
      actionLabel: 'Transaktionen prüfen',
      highlights: const [
        'Live Status-Updates',
        'Reservierte Guthaben',
        'Smarte Zahlungspläne',
      ],
    ),
    _PageDefinition(
      headline: 'Profil',
      body:
          'Passe dein Sicherheitsprofil an, verwalte Händlerstatus und erhalte personalisierte Insights.',
      accentColor: const Color(0xFFFF6F61),
      icon: Icons.person,
      actionLabel: 'Einstellungen öffnen',
      highlights: const [
        'Rollen & Berechtigungen',
        'Identitätsprüfung',
        'Vertrauens-Score',
      ],
    ),
  ];

  void _onNavigationItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex].headline),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundColor:
                  Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                Icons.shield_moon,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: _PageContent(content: _pages[_selectedIndex]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: NavigationBar(
            height: 70,
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onNavigationItemTapped,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.storefront_outlined),
                selectedIcon: Icon(Icons.storefront),
                label: 'Markt',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_bag_outlined),
                selectedIcon: Icon(Icons.shopping_bag),
                label: 'Warenkorb',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageContent extends StatelessWidget {
  const _PageContent({required this.content});

  final _PageDefinition content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final subtle = theme.textTheme.labelLarge?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeroCard(content: content),
        const SizedBox(height: 24),
        Text(
          'Was dich erwartet',
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: content.highlights
              .map(
                (highlight) => Chip(
                  avatar: Icon(
                    Icons.check_circle,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                  label: Text(highlight),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nächste Schritte',
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  content.body,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: () {}, // TODO: Navigationsziele ergänzen
                  icon: Icon(content.icon),
                  label: Text(content.actionLabel),
                ),
                const SizedBox(height: 12),
                if (subtle != null)
                  Text(
                    'Feature-Demos folgen. Dieser Bereich zeigt bald Live-Daten.',
                    style: subtle,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.content});

  final _PageDefinition content;

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      colors: [
        content.accentColor,
        content.accentColor.withValues(alpha: 0.7),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: content.accentColor.withValues(alpha: 0.25),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                content.icon,
                size: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              content.headline,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              content.body,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withValues(alpha: 0.95),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageDefinition {
  const _PageDefinition({
    required this.headline,
    required this.body,
    required this.icon,
    required this.accentColor,
    required this.actionLabel,
    required this.highlights,
  });

  final String headline;
  final String body;
  final IconData icon;
  final Color accentColor;
  final String actionLabel;
  final List<String> highlights;
}
