import 'package:flutter/material.dart';

import 'src/auth/auth_state.dart';
import 'src/auth/models.dart';

void main() {
  final authState = AuthState();
  runApp(AuthScope(
    notifier: authState,
    child: BayApp(authState: authState),
  ));
}

class BayApp extends StatelessWidget {
  const BayApp({required this.authState, super.key});

  final AuthState authState;

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
      home: HomeShell(authState: authState),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({required this.authState, super.key});

  final AuthState authState;

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
    final isAccount = _selectedIndex >= _pages.length;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isAccount ? 'Account' : _pages[_selectedIndex].headline,
        ),
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
          child: isAccount
              ? AccountPage(authState: widget.authState)
              : _PageContent(content: _pages[_selectedIndex]),
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
              NavigationDestination(
                icon: Icon(Icons.lock_outline),
                selectedIcon: Icon(Icons.lock),
                label: 'Account',
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

class AccountPage extends StatefulWidget {
  const AccountPage({required this.authState, super.key});

  final AuthState authState;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _loginEmail = TextEditingController();
  final _loginPassword = TextEditingController();
  final _registerEmail = TextEditingController();
  final _registerPassword = TextEditingController();
  final _registerName = TextEditingController();
  final _registerInvite = TextEditingController();
  final _displayName = TextEditingController();
  final _disputeTitle = TextEditingController();
  final _disputeDescription = TextEditingController();
  final _inviteEmail = TextEditingController();

  @override
  void dispose() {
    _loginEmail.dispose();
    _loginPassword.dispose();
    _registerEmail.dispose();
    _registerPassword.dispose();
    _registerName.dispose();
    _registerInvite.dispose();
    _displayName.dispose();
    _disputeTitle.dispose();
    _disputeDescription.dispose();
    _inviteEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = widget.authState;
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: auth,
      builder: (context, _) {
        final user = auth.user;
        final error = auth.errorMessage;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (auth.isBusy) const LinearProgressIndicator(),
            if (error != null) ...[
              Card(
                child: ListTile(
                  leading: const Icon(Icons.warning_amber_rounded),
                  title: Text(
                    error,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.colorScheme.error),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            if (!auth.isAuthenticated)
              _buildAuthForms(context, auth)
            else ...[
              _buildProfileCard(context, auth, user!),
              const SizedBox(height: 16),
              _buildDisputeComposer(context, auth),
              const SizedBox(height: 16),
              _buildDisputeList(context, auth),
              if (user.role == 'moderator' || user.role == 'admin')
                const SizedBox(height: 16),
              if (user.role == 'admin') ...[
                _AdminPanel(authState: auth),
                const SizedBox(height: 16),
              ],
              _InviteCard(
                controller: _inviteEmail,
                onInvite: (email) => auth.requestInvite(email),
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildAuthForms(BuildContext context, AuthState auth) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Anmelden',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _loginEmail,
                  decoration: const InputDecoration(
                    labelText: 'E-Mail',
                    prefixIcon: Icon(Icons.mail_outline),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _loginPassword,
                  decoration: const InputDecoration(
                    labelText: 'Passwort',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: auth.isBusy
                      ? null
                      : () => auth.login(
                            LoginPayload(
                              email: _loginEmail.text,
                              password: _loginPassword.text,
                            ),
                          ),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Registrieren',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _registerEmail,
                  decoration: const InputDecoration(
                    labelText: 'E-Mail',
                    prefixIcon: Icon(Icons.alternate_email),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _registerPassword,
                  decoration: const InputDecoration(
                    labelText: 'Passwort',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _registerName,
                  decoration: const InputDecoration(
                    labelText: 'Anzeigename',
                    prefixIcon: Icon(Icons.badge_outlined),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _registerInvite,
                  decoration: const InputDecoration(
                    labelText: 'Einladungscode (optional)',
                    prefixIcon: Icon(Icons.card_giftcard),
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: auth.isBusy
                      ? null
                      : () => auth.register(
                            RegisterPayload(
                              email: _registerEmail.text,
                              password: _registerPassword.text,
                              displayName: _registerName.text,
                              inviteCode: _registerInvite.text.isEmpty
                                  ? null
                                  : _registerInvite.text,
                            ),
                          ),
                  child: const Text('Account erstellen'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileCard(
    BuildContext context,
    AuthState auth,
    UserProfile user,
  ) {
    _displayName.text = user.displayName ?? '';
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Willkommen, ${user.displayName ?? user.email}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: auth.isBusy ? null : auth.refresh,
                  tooltip: 'Status aktualisieren',
                ),
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: auth.isBusy ? null : auth.logout,
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _displayName,
              decoration: const InputDecoration(
                labelText: 'Anzeigename',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: auth.isBusy
                  ? null
                  : () => auth.updateProfile(_displayName.text),
              child: const Text('Profil speichern'),
            ),
            const Divider(height: 32),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                _InfoChip(label: 'Rolle', value: user.role),
                _InfoChip(
                  label: 'Mitglied seit',
                  value:
                      '${user.createdAt.day}.${user.createdAt.month}.${user.createdAt.year}',
                ),
                _InfoChip(
                  label: 'Status',
                  value: user.isActive ? 'Aktiv' : 'Gesperrt',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDisputeComposer(BuildContext context, AuthState auth) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Streitfall eröffnen',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _disputeTitle,
              decoration: const InputDecoration(
                labelText: 'Titel',
                prefixIcon: Icon(Icons.report_problem_outlined),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _disputeDescription,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Beschreibung',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: auth.isBusy
                  ? null
                  : () => auth.createDispute(
                        title: _disputeTitle.text,
                        description: _disputeDescription.text,
                      ),
              child: const Text('Absenden'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDisputeList(BuildContext context, AuthState auth) {
    if (auth.disputes.isEmpty) {
      return const SizedBox.shrink();
    }
    final canResolve =
        auth.user?.role == 'moderator' || auth.user?.role == 'admin';
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Streitfälle',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ...auth.disputes.map(
              (dispute) => ListTile(
                title: Text(dispute.title),
                subtitle: Text(
                  dispute.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: dispute.isResolved
                    ? const Icon(Icons.verified, color: Colors.green)
                    : canResolve
                        ? TextButton(
                            onPressed: auth.isBusy
                                ? null
                                : () => auth.resolveDispute(dispute.id),
                            child: const Text('Schlichten'),
                          )
                        : const Icon(Icons.pending_actions),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdminPanel extends StatelessWidget {
  const _AdminPanel({required this.authState});

  final AuthState authState;

  @override
  Widget build(BuildContext context) {
    final settings = authState.settings ??
        PlatformSettings(guestAccessEnabled: true, registrationEnabled: true);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Administration',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: const Text('Registrierung erlaubt'),
              value: settings.registrationEnabled,
              onChanged: authState.isBusy
                  ? null
                  : (value) => authState.updateSettings(
                        settings.copyWith(registrationEnabled: value),
                      ),
            ),
            SwitchListTile(
              title: const Text('Gastzugang aktiv'),
              value: settings.guestAccessEnabled,
              onChanged: authState.isBusy
                  ? null
                  : (value) => authState.updateSettings(
                        settings.copyWith(guestAccessEnabled: value),
                      ),
            ),
            const Divider(height: 24),
            Text(
              'Benutzerrollen',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            ...authState.users.map(
              (user) => ListTile(
                title: Text(user.email),
                subtitle: Text('Rolle: ${user.role}'),
                trailing: PopupMenuButton<String>(
                  onSelected: (role) => authState.setUserRole(
                    userId: user.id,
                    role: role,
                  ),
                  itemBuilder: (context) => const [
                    PopupMenuItem(value: 'user', child: Text('User')),
                    PopupMenuItem(value: 'moderator', child: Text('Moderator')),
                    PopupMenuItem(value: 'admin', child: Text('Admin')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InviteCard extends StatelessWidget {
  const _InviteCard({
    required this.controller,
    required this.onInvite,
  });

  final TextEditingController controller;
  final Future<void> Function(String email) onInvite;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Einladung anfordern',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'E-Mail Adresse',
                prefixIcon: Icon(Icons.mail),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => onInvite(controller.text),
              child: const Text('Einladung senden'),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(value),
        ],
      ),
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
