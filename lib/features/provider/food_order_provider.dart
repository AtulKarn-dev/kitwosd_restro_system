import 'package:flutter/material.dart';
import '../food_menu/widget/food_menu.dart';

class FoodOrderProvider extends ChangeNotifier {
  List<FoodItem> mainFoodList = [];
  static List<FoodItem> showingList = [
    FoodItem(
      'Oyster Dish',
      'Shortbread, chocolate turtle cookies, and red velvet.',
      'Rs.200',
      'assets/images/fried-oysters-2.jpg',
    ),
    FoodItem(
      'Oyster On Ice',
      'Shortbread, chocolate turtle cookies, and red velvet.',
      'Rs.300',
      'assets/images/oyster_on_ice.jpeg',
    ),
    FoodItem(
      'Fried Rice on Pot',
      'Shortbread, chocolate turtle cookies, and red velvet.',
      'Rs.500',
      'assets/images/fried_rice.jpg',
    ),
  ];
  List<FoodItem> displayList = showingList;
  List<FoodItem> foodList = showingList;

  void resetItems() {
    displayList = List.from(showingList);
  }

  void addItem(int id, bool isSearching) {
    FoodItem item = isSearching ? displayList[id] : foodList[id];
    mainFoodList.add(item);
    notifyListeners();
  }

  void filterItems(String? searchText) {
    if (searchText != null) {
      displayList = showingList
          .where((element) =>
              element.title!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    } else {
      displayList = showingList;
    }
  }
}

