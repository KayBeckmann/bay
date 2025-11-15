// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:bay_app/main.dart';
import 'package:bay_app/src/auth/auth_state.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('zeigt Marketplace-Einstieg', (WidgetTester tester) async {
    final authState = AuthState();
    await tester.pumpWidget(
      AuthScope(
        notifier: authState,
        child: BayApp(authState: authState),
      ),
    );
    expect(find.text('Marketplace'), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.textContaining('Escrow'), findsOneWidget);

    await tester.tap(find.text('Account'));
    await tester.pumpAndSettle();
    expect(find.text('Anmelden'), findsOneWidget);
    expect(find.text('Registrieren'), findsOneWidget);
  });
}
