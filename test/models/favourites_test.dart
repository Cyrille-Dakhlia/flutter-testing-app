import 'package:test/test.dart';
import 'package:testing_app_001/models/favourites.dart';

void main() {
  group(
    'Testing App Provider',
    () {
      var favourites = Favourites();

      test('should add a new item', () {
        // Given
        var item = 3;

        // When
        favourites.add(item);

        // Then
        expect(favourites.items.contains(item), true);
      });

      test('should remove an item', () {
        // Given
        var item = 42;
        favourites.add(item);
        expect(favourites.items.contains(item), true);

        // When
        favourites.remove(item);

        // Then
        expect(favourites.items.contains(item), false);
      });
    },
  );
}
