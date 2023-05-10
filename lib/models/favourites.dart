import 'package:flutter/material.dart';

class Favourites extends ChangeNotifier {
  final List<int> _favouriteItems = [];

  List<int> get items => _favouriteItems;

  void add(int itemNumber) {
    _favouriteItems.add(itemNumber);
    notifyListeners();
  }

  void remove(int itemNumber) {
    _favouriteItems.remove(itemNumber);
    notifyListeners();
  }
}
