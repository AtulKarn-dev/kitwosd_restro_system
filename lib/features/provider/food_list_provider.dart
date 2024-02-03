import 'package:flutter/material.dart';

class FoodListProvider extends ChangeNotifier {
  void setState() {
    VoidCallback onAdd;
    notifyListeners();
  }
}
