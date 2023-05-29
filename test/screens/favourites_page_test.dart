import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_app_001/models/favourites.dart';
import 'package:testing_app_001/screens/favourites_page.dart';

late Favourites _favourites;

Widget createFavouritesScreen() => ChangeNotifierProvider<Favourites>(
      create: (_) {
        _favourites = Favourites();
        return _favourites;
      },
      child: const MaterialApp(
        home: FavouritesPage(),
      ),
    );

void main() {
  group('Favourites page widget tests...', () {
    testWidgets('should initially have an empty ListView', (tester) async {
      // Given
      await tester.pumpWidget(createFavouritesScreen());

      // Then
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(FavouritesItemTile), findsNothing);
    });

    testWidgets(
        'should have a new element when an item is added to the favourites',
        (widgetTester) async {
      // Given
      await widgetTester.pumpWidget(createFavouritesScreen());
      const int number = 0;

      // When
      _favourites.add(number);
      await widgetTester.pumpAndSettle();

      // Then
      expect(find.byType(FavouritesItemTile), findsOneWidget);
      expect(find.text('Item $number'), findsOneWidget);
    });

    testWidgets(
        'should have an element less when an item is removed from the favourites',
        (widgetTester) async {
      // Given
      await widgetTester.pumpWidget(createFavouritesScreen());
      _favourites.add(0);
      await widgetTester.pumpAndSettle();

      // When
      _favourites.remove(0);
      await widgetTester.pumpAndSettle();

      // Then
      expect(find.byType(FavouritesItemTile), findsNothing);
    });

    testWidgets('should test the remove button', (widgetTester) async {
      // Given
      await widgetTester.pumpWidget(createFavouritesScreen());
      const int itemCount = 3;
      for (var i = 0; i < itemCount; i++) {
        _favourites.add(i);
      }
      await widgetTester.pumpAndSettle();
      var totalItems = widgetTester.widgetList(find.byIcon(Icons.close)).length;

      // When
      var closeButton = find.byIcon(Icons.close).first;
      await widgetTester.tap(closeButton);
      await widgetTester.pumpAndSettle();

      // Then
      expect(widgetTester.widgetList(find.byIcon(Icons.close)).length,
          lessThan(totalItems));
    });
  });
}
