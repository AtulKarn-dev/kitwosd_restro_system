import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';

class FoodOrderProvider extends ChangeNotifier {
  List<Burger> mainFoodList = [];
  static List<Burger> showingList = [];
  List<Burger> displayList = showingList;
  List<Burger> foodList = showingList;

  static void loadFoodList(List<Burger> list) {
    showingList = list;
  }

  void addItem(int id, bool isSearching) {
    Burger item = isSearching ? displayList[id] : foodList[id];
    mainFoodList.add(item);
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
}
