// To parse this JSON data, do
//
//     final getOrderResponse = getOrderResponseFromJson(jsonString);

import 'dart:convert';

GetOrderResponse getOrderResponseFromJson(String str) =>
    GetOrderResponse.fromJson(json.decode(str));

String getOrderResponseToJson(GetOrderResponse data) =>
    json.encode(data.toJson());

class GetOrderResponse {
  List<Datum> data;

  GetOrderResponse({
    required this.data,
  });

  factory GetOrderResponse.fromJson(Map<String, dynamic> json) =>
      GetOrderResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String orderId;
  String itemId;
  String variantId;
  String itemStatus;
  String quantity;
  String price;
  DateTime createdAt;
  DateTime updatedAt;
  Items items;

  FoodItemState get status {
    return FoodItemState.values
        .firstWhere((element) => element.apiValue == itemStatus);
  }

  Datum({
    required this.id,
    required this.orderId,
    required this.itemId,
    required this.variantId,
    required this.itemStatus,
    required this.quantity,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderId: json["order_id"],
        itemId: json["item_id"],
        variantId: json["variant_id"],
        itemStatus: json["status"],
        quantity: json["quantity"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        items: Items.fromJson(json["items"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "item_id": itemId,
        "variant_id": variantId,
        "status": itemStatus,
        "quantity": quantity,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "items": items.toJson(),
      };
}

enum FoodItemState {
  pending,
  preparing,
  ready,
  delivered;

  String get apiValue {
    switch (this) {
      case FoodItemState.pending:
        return 'pending';
      case FoodItemState.preparing:
        return 'preparing';
      case FoodItemState.ready:
        return 'ready';
      case FoodItemState.delivered:
        return 'delivered';
    }
  }

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

class Items {
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

  Items({
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
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        status: json["status"],
        categoryId: json["category_id"],
        typeId: json["type_id"],
        currentPrice: json["current_price"],
        previousPrice: json["previous_price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        description: json["description"],
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
      };
}
