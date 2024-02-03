// import 'package:flutter/material.dart';
// import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';

// class FoodOrderProvider extends ChangeNotifier {
//   List<FoodItem> mainFoodList = [];
//   static List<FoodItem> showingList = [];
//   static List<FoodItem> searchList = [];
//   List<FoodItem> displayList = showingList;

//   static void loadFoodList(List<FoodItem> list) {
//     showingList = list;
//   }

//   static void loadSearchList(List<FoodItem> list) {
//     searchList = list;
//   }

//   FoodItem getItem(int id, bool isSearching) {
//     FoodItem item =
//         isSearching ? displayList[id] : FoodOrderProvider.showingList[id];
//     return item;
//   }

//   void addItem(int id, bool isSearching) {
//     FoodItem item =
//         isSearching ? displayList[id] : vider.showingList[id];
//     mainFoodList.add(item);
//     notifyListeners();
//   }

//   void deleteAddedOrderItem(int index) {
//     mainFoodList.removeAt(index);
//     notifyListeners();
//   }

//   void filterItems(String? searchText) {
//     if (searchText != null) {
//       displayList = searchList
//           .where((element) =>
//               element.title.toLowerCase().contains(searchText.toLowerCase()))
//           .toList();
//     } else {
//       displayList = showingList;
//     }
//   }

//   void getVariant() {
//     //  notifyListeners();
//   }
// }
