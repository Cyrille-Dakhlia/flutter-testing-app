import 'package:test/test.dart';
import 'package:testing_app_001/models/favourites.dart';

void main() {
  group(
    'Testing App Provider',
    () {
      var favourites = Favourites();

      test('A new item should be added', () {
        var item = 3;
        favourites.add(item);
        expect(favourites.items.contains(item), true);
      });

      test('An item should be removed', () {
        var item = 42;
        favourites.add(item);
        expect(favourites.items.contains(item), true);
        favourites.remove(item);
        expect(favourites.items.contains(item), false);
      });
    },
  );
}
