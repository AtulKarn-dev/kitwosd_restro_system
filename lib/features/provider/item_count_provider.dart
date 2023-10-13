import 'package:flutter/cupertino.dart';

class ItemCountProvider extends ChangeNotifier {
  int? itemCountVal;
  void count(int itemCountValue) {
    itemCountVal = itemCountValue;
    notifyListeners();
  }

  int get itemCount => itemCountVal!;
}

