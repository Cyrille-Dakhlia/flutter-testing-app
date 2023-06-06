import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_app_001/models/favourites.dart';
import 'package:testing_app_001/screens/home_page.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Favourites>(
      create: (_) => Favourites(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  group('Home page widget tests...', () {
    testWidgets('should find ListView', (widgetTester) async {
      // Given
      await widgetTester.pumpWidget(createHomeScreen());

      // Then
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('should test ListView scrolling', (tester) async {
      // Given
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Item 0'), findsOneWidget);

      // When
      await tester.fling(
        find.byType(ListView),
        const Offset(0, -200), // we just scroll from bottom to top
        2000, // with a positive value to make sure the ListView scrolls enough
      );

      // Then
      expect(find.text('Item 0'), findsNothing);
    });

    testWidgets('should test favourite IconButtons', (widgetTester) async {
      // Given
      await widgetTester.pumpWidget(createHomeScreen());
      expect(find.byIcon(Icons.favorite), findsNothing);

      // When
      await widgetTester.tap(find.byIcon(Icons.favorite_border).first);
      await widgetTester.pumpAndSettle(const Duration(seconds: 1));

      // Then
      expect(find.text('Added to favourites.'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);

      // When
      await widgetTester.tap(find.byIcon(Icons.favorite).first);
      await widgetTester.pumpAndSettle(const Duration(seconds: 1));

      // Then
      expect(find.text('Removed from favourites.'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);
    });
  });
}
