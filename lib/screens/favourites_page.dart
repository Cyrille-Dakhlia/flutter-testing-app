import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app_001/models/favourites.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  static String routeName = 'favourites_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: Consumer<Favourites>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.items.length,
            itemBuilder: (context, index) =>
                FavouritesItemTile(value.items[index]),
          );
        },
      ),
    );
  }
}

class FavouritesItemTile extends StatelessWidget {
  const FavouritesItemTile(this.itemNumber, {super.key});

  final int itemNumber;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Item $itemNumber',
        key: Key('favourites_text_$itemNumber'),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[itemNumber % Colors.primaries.length],
      ),
      trailing: IconButton(
        key: Key('remove_icon_$itemNumber'),
        icon: const Icon(Icons.close),
        onPressed: () {
          context.read<Favourites>().remove(itemNumber);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Removed from favourites.'),
              duration: Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}
