import 'package:flutter/cupertino.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';

class ItemCountProvider extends ChangeNotifier {
  int? itemCountVal;
  int? quantity;

  void count(int itemCountValue) {
    itemCountVal = itemCountValue;
    notifyListeners();
  }

  int itemCount(FoodItem item) {
    quantity = itemCountVal!;
    return quantity!;
  }
}
