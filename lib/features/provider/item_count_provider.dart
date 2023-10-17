import 'package:flutter/cupertino.dart';


class ItemCountProvider extends ChangeNotifier {
  int? itemCountVal;
  int? quantity;

  void count(int itemCountValue) {
    itemCountVal = itemCountValue;
    notifyListeners();
  }

  int itemCount() {
    quantity = itemCountVal!;
    return quantity!;
  }
}
