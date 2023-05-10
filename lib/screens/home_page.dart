import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        key: Key('item_$itemNumber'),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[itemNumber % Colors.primaries.length],
      ),
      trailing: IconButton(
        onPressed: () => print('Favourite!'),
        icon: const Icon(Icons.favorite_border),
      ),
    );
  }
}
