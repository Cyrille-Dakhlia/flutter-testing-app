import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testing_app_001/screens/favourites_page.dart';
import 'package:testing_app_001/screens/home_page.dart';

void main() {
  runApp(const TestingApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: FavouritesPage.routeName,
          builder: (context, state) => const FavouritesPage(),
        ),
      ],
    ),
  ],
);

class TestingApp extends StatelessWidget {
  const TestingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Testing Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
