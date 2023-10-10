// To parse this JSON data, do
//
//     final menuItemsResponse = menuItemsResponseFromJson(jsonString);

import 'dart:convert';

MenuItemsResponse menuItemsResponseFromJson(String str) =>
    MenuItemsResponse.fromJson(json.decode(str));

String menuItemsResponseToJson(MenuItemsResponse data) =>
    json.encode(data.toJson());

class MenuItemsResponse {
  Data data;

  MenuItemsResponse({
    required this.data,
  });

  factory MenuItemsResponse.fromJson(Map<String, dynamic> json) =>
      MenuItemsResponse(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class FoodCategoryItem {
  String category;
  List<FoodItem> items;

  FoodCategoryItem({required this.category, required this.items});

  factory FoodCategoryItem.fromJson(Map<String, dynamic> json) {
    String category = json["categories"]["name"];
    List<FoodItem> items =
        List<FoodItem>.from(json[category].map((x) => FoodItem.fromJson(x)));
    return FoodCategoryItem(category: category, items: items);
  }
}

class Data {
  List<FoodCategoryItem> categoryItems;

  Data({
    required this.categoryItems,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    List<FoodCategoryItem> categories = [];
    for (MapEntry<String, dynamic> jsonValue in json.entries) {
      List<FoodItem> items = [];
      for (Map<String, dynamic> value in jsonValue.value) {
        FoodItem item = FoodItem.fromJson(value);
        items.add(item);
      }

      FoodCategoryItem itemValue =
          FoodCategoryItem(category: jsonValue.key, items: items);
      categories.add(itemValue);
    }
    return Data(categoryItems: categories);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    for (FoodCategoryItem item in categoryItems) {
      Map<String, dynamic> itemJson = <String, dynamic>{
        item.category: item.items.map((e) => e.toJson())
      };
      json.addEntries(itemJson.entries);
    }
    return json;
  }
}

enum FoodItemState {
  pending,
  preparing,
  ready,
  delivered;

  String get displayTitle {
    switch (this) {
      case FoodItemState.pending:
        return 'Pending';
      case FoodItemState.preparing:
        return 'Preparing';
      case FoodItemState.ready:
        return 'Ready to be served';
      case FoodItemState.delivered:
        return 'Delivered';
    }
  }
}

class FoodItem {
  int id;
  String title;
  String image;
  String status;
  String categoryId;
  String typeId;
  String currentPrice;
  String previousPrice;
  DateTime createdAt;
  DateTime updatedAt;
  String description;
  List<Addon> variants;
  List<Addon> addons;
  Categories categories;

  FoodItem({
    required this.id,
    required this.title,
    required this.image,
    required this.status,
    required this.categoryId,
    required this.typeId,
    required this.currentPrice,
    required this.previousPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.variants,
    required this.addons,
    required this.categories,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
        id: json["id"],
        title: json["title"],
        image: 'http://demo1.kitwosd.com/images/photos/${json["image"]}',
        status: json["status"],
        categoryId: json["category_id"],
        typeId: json["type_id"],
        currentPrice: json["current_price"],
        previousPrice: json["previous_price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        description: json["description"],
        variants:
            List<Addon>.from(json["variants"].map((x) => Addon.fromJson(x))),
        addons: List<Addon>.from(json["addons"].map((x) => Addon.fromJson(x))),
        categories: Categories.fromJson(json["categories"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "status": status,
        "category_id": categoryId,
        "type_id": typeId,
        "current_price": currentPrice,
        "previous_price": previousPrice,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "description": description,
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        "addons": List<dynamic>.from(addons.map((x) => x.toJson())),
        "categories": categories.toJson(),
      };
}

class Addon {
  int id;
  String title;
  String? image;
  String status;
  String currentPrice;
  String previousPrice;
  String itemId;
  DateTime createdAt;
  DateTime updatedAt;

  Addon({
    required this.id,
    required this.title,
    required this.image,
    required this.status,
    required this.currentPrice,
    required this.previousPrice,
    required this.itemId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        status: json["status"],
        currentPrice: json["current_price"],
        previousPrice: json["previous_price"],
        itemId: json["item_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "status": status,
        "current_price": currentPrice,
        "previous_price": previousPrice,
        "item_id": itemId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Categories {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  Categories({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
