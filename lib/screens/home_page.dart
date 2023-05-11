import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_app_001/models/favourites.dart';
import 'favourites_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(right: 80.0),
          child: Text('Testing Sample'),
        ),
        actions: [
          TextButton.icon(
            onPressed: () => context.go('/${FavouritesPage.routeName}'),
            icon: const Icon(Icons.favorite_border),
            label: const Text('Favourites'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        cacheExtent: 20,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        itemBuilder: (context, index) => ItemTile(index),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile(this.itemNumber, {super.key});

  final int itemNumber;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Item $itemNumber',
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[itemNumber % Colors.primaries.length],
      ),
      trailing: Consumer<Favourites>(
        builder: (context, value, _) => IconButton(
          icon: Icon(!value.items.contains(itemNumber)
              ? Icons.favorite_border
              : Icons.favorite),
          onPressed: () {
            !value.items.contains(itemNumber)
                ? value.add(itemNumber)
                : value.remove(itemNumber);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(value.items.contains(itemNumber)
                    ? 'Added to favourites.'
                    : 'Removed from favourites.'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
