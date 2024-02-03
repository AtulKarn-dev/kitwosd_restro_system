import 'package:dio/dio.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_search_response.dart';
import 'package:kitwosd_restro_system/network/api_controller.dart';


class FoodMenuController {
  Future<List<String>?> getMenuCategories() async {
    Response<String>? response = await ApiController.getResponse("menu-items");
    if (response != null) {
      MenuItemsResponse menuItemsResponse =
          menuItemsResponseFromJson(response.data!);
      List<String>? categories = [];
      for (FoodCategoryItem item in menuItemsResponse.data.categoryItems) {
        categories.add(item.category);
      }
      return categories;
    } else {
      return null;
    }
  }

  Future<List<FoodItem>> getMenuList(String category) async {
    Response<String>? response = await ApiController.getResponse("menu-items");
    if (response != null) {
      MenuItemsResponse menuItemsResponse =
          menuItemsResponseFromJson(response.data!);
      return menuItemsResponse.data.categoryItems
          .firstWhere((item) => item.category == category)
          .items;
    } else {
      return [];
    }
  }

  Future<List<FoodItem>> getMenuSearchItems() async {
    Response<String>? response = await ApiController.getResponse("menu-items");
    if (response != null) {
      MenuSearchItemsResponse menuItemsResponse =
          menuSearchItemsResponseFromJson(response.data!);
      return menuItemsResponse.data.items;
    } else {
      return [];
    }
  }

  Future<List<Addon>?> getVariants(String category, int id) async {
    List<FoodItem> items = await getMenuList(category);
    return items.firstWhere((element) => element.id == id).variants;
  }

  Future<List<Addon>?> getAddons(String category, int id) async {
    List<FoodItem> items = await getMenuList(category);
    return items.firstWhere((element) => element.id == id).addons;
  }
}
