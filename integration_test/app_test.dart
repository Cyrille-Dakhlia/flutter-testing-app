import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app_001/main.dart';

void main() {
  group('Testing App...', () {
    testWidgets('should test favourites operations', (widgetTester) async {
      // Given
      await widgetTester.pumpWidget(const TestingApp());

      var keyList = [
        'icon_0',
        'icon_1',
        'icon_2',
      ];

      for (var key in keyList) {
        // When
        await widgetTester.tap(find.byKey(ValueKey(key)));
        await widgetTester.pumpAndSettle(const Duration(seconds: 1));

        // Then
        expect(find.text('Added to favourites.'), findsOneWidget);
      }

      // Given-2
      final removeKeyList = [
        'remove_icon_0',
        'remove_icon_1',
        'remove_icon_2',
      ];

      await widgetTester.tap(find.text('Favourites'));
      await widgetTester.pumpAndSettle();

      for (var key in removeKeyList) {
        // When-2
        await widgetTester.tap(find.byKey(ValueKey(key)));
        await widgetTester.pumpAndSettle(const Duration(seconds: 1));

        // Then-2
        expect(find.text('Removed from favourites.'), findsOneWidget);
      }
    });
  });
}
