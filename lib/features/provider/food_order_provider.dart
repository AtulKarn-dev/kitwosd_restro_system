import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';

class FoodOrderProvider extends ChangeNotifier {
  List<FoodItem> mainFoodList = [];
  static List<FoodItem> showingList = [];
  List<FoodItem> displayList = showingList;

  static void loadFoodList(List<FoodItem> list) {
    showingList = list;
  }

  FoodItem getItem(int id, bool isSearching) {
    FoodItem item =
        isSearching ? displayList[id] : FoodOrderProvider.showingList[id];
    return item;
  }

  void addItem(int id, bool isSearching) {
    FoodItem item =
        isSearching ? displayList[id] : FoodOrderProvider.showingList[id];
    mainFoodList.add(item);
    notifyListeners();
  }

  void updateFoodItemState(int index, FoodItemState state) {
    FoodItem item = mainFoodList[index];
    item.state = state;
    notifyListeners();
  }

  void deleteAddedOrderItem(int index) {
    mainFoodList.removeAt(index);
    notifyListeners();
  }

  void filterItems(String? searchText) {
    if (searchText != null) {
      displayList = showingList
          .where((element) =>
              element.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    } else {
      displayList = showingList;
    }
  }

  void getVariant() {
    //  notifyListeners();
  }
}
