import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kitwosd_restro_system/error/exceptions.dart';
import 'package:kitwosd_restro_system/error/http_exceptions.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/network/client_info.dart';

class FoodMenuController {
  Future<List<String>?> getMenuCategories() async {
    Response<String>? response;
    try {
      Dio dio = await getDioWithToken();

      response = await dio.get("menu-items");
      if (response.statusCode == 200) {
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
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        Map? r = json.decode(e.response!.data!);
        throw ValidationException(r, r![r.keys.first.toString()]);
      } else if (e.response!.statusCode.toString() == "401") {
        Map? r = json.decode(e.response!.data!);
        throw ValidationException(r!['message'], r['success']);
      } else {
        throw ServerException().gotException(e.message!);
      }
    }
  }

  Future<List<FoodItem>> getMenuList(String category) async {
    Response<String>? response;
    try {
      Dio dio = await getDioWithToken();

      response = await dio.get("menu-items");
      if (response.statusCode == 200) {
        MenuItemsResponse menuItemsResponse =
            menuItemsResponseFromJson(response.data!);
        return menuItemsResponse.data.categoryItems
            .firstWhere((item) => item.category == category)
            .items;
      } else {
        return [];
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        Map? r = json.decode(e.response!.data!);
        throw ValidationException(r, r![r.keys.first.toString()]);
      } else if (e.response!.statusCode.toString() == "401") {
        Map? r = json.decode(e.response!.data!);
        throw ValidationException(r!['message'], r['success']);
      } else {
        throw ServerException().gotException(e.message!);
      }
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


