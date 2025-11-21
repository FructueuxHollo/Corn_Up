import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  // Example state for dashboard
  int _items = 0;

  int get items => _items;

  void updateItems(int newValue) {
    _items = newValue;
    notifyListeners();
  }
}
