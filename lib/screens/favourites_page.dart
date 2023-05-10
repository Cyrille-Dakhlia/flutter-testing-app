import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  static String routeName = 'favourites_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: const Center(
        child: Text('Hi! Favourites Page!'),
      ),
    );
  }
}
