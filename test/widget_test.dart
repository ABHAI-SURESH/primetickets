import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prime_tickets/main.dart';

void main() {
  group('PrimeTickets Home Screen Tests', () {
    testWidgets('Home screen loads successfully',
        (WidgetTester tester) async {

      // Build app
      await tester.pumpWidget(const PrimeTicketsApp());

      // Verify location label
      expect(find.text('Current Location'), findsOneWidget);

      // Verify city name
      expect(find.text('Trivandrum'), findsOneWidget);

      // Verify search field
      expect(
        find.byType(TextField),
        findsOneWidget,
      );

      // Verify search placeholder
      expect(
        find.text('Search movies, theatres...'),
        findsOneWidget,
      );

      // Verify bookmark icon
      expect(
        find.byIcon(Icons.bookmark_border),
        findsNothing,
      );
    });
  });
}