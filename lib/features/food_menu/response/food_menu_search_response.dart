import 'dart:convert';

import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';

MenuSearchItemsResponse menuSearchItemsResponseFromJson(String str) =>
    MenuSearchItemsResponse.fromJson(json.decode(str));

String menuSearchItemsResponseToJson(MenuSearchItemsResponse data) =>
    json.encode(data.toJson());

class MenuSearchItemsResponse {
  Data data;

  MenuSearchItemsResponse({
    required this.data,
  });

  factory MenuSearchItemsResponse.fromJson(Map<String, dynamic> json) =>
      MenuSearchItemsResponse(
        data: Data.fromJson(json["items"]),
      );

  Map<String, dynamic> toJson() => {
        "items": data.toJson(),
      };
}

class Data {
  List<FoodItem> items;
  Data({
    required this.items,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    List<FoodItem> items = [];
    for (Map<String, dynamic> jsonValue in json.values) {
      FoodItem item = FoodItem.fromJson(jsonValue);
      items.add(item);
    }
    return Data(items: items);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    for (FoodItem item in items) {
      Map<String, dynamic> itemJson = item.toJson();
      json.addEntries(itemJson.entries);
    }
    return json;
  }
}
