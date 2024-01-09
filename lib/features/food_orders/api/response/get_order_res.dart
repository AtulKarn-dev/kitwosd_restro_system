// To parse this JSON data, do
//
//     final getOrderResponse = getOrderResponseFromJson(jsonString);

import 'dart:convert';

GetOrderResponse getOrderResponseFromJson(String str) => GetOrderResponse.fromJson(json.decode(str));

String getOrderResponseToJson(GetOrderResponse data) => json.encode(data.toJson());

class GetOrderResponse {
    Data data;

    GetOrderResponse({
        required this.data,
    });

    factory GetOrderResponse.fromJson(Map<String, dynamic> json) => GetOrderResponse(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String orderNumber;
    String status;
    String orderAmount;
    String vatAmount;
    String serviceTaxAmount;
    String discount;
    String paidAmount;
    dynamic paymentMethodId;
    String paymentStatus;
    String tableId;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic paymentDate;
    Tables tables;
    List<OrderItem> orderItems;

    Data({
        required this.id,
        required this.orderNumber,
        required this.status,
        required this.orderAmount,
        required this.vatAmount,
        required this.serviceTaxAmount,
        required this.discount,
        required this.paidAmount,
        required this.paymentMethodId,
        required this.paymentStatus,
        required this.tableId,
        required this.createdAt,
        required this.updatedAt,
        required this.paymentDate,
        required this.tables,
        required this.orderItems,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        orderNumber: json["order_number"],
        status: json["status"],
        orderAmount: json["order_amount"],
        vatAmount: json["vat_amount"],
        serviceTaxAmount: json["service_tax_amount"],
        discount: json["discount"],
        paidAmount: json["paid_amount"],
        paymentMethodId: json["payment_method_id"],
        paymentStatus: json["payment_status"],
        tableId: json["table_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        paymentDate: json["payment_date"],
        tables: Tables.fromJson(json["tables"]),
        orderItems: List<OrderItem>.from(json["order_items"].map((x) => OrderItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_number": orderNumber,
        "status": status,
        "order_amount": orderAmount,
        "vat_amount": vatAmount,
        "service_tax_amount": serviceTaxAmount,
        "discount": discount,
        "paid_amount": paidAmount,
        "payment_method_id": paymentMethodId,
        "payment_status": paymentStatus,
        "table_id": tableId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "payment_date": paymentDate,
        "tables": tables.toJson(),
        "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
    };
}

class OrderItem {
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
    Variants variants;
    List<OrderItemAddon> orderItemAddons;
    FoodItemState get status {
    return FoodItemState.values
        .firstWhere((element) => element.apiValue == itemStatus);
  }

    OrderItem({
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
        required this.variants,
        required this.orderItemAddons,
    });
    

    factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
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
        variants: Variants.fromJson(json["variants"]),
        orderItemAddons: List<OrderItemAddon>.from(json["order_item_addons"].map((x) => OrderItemAddon.fromJson(x))),
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
        "variants": variants.toJson(),
        "order_item_addons": List<dynamic>.from(orderItemAddons.map((x) => x.toJson())),
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

class OrderItemAddon {
    int id;
    String orderItemsId;
    String addOnsId;
    DateTime createdAt;
    DateTime updatedAt;
    Variants addOns;

    OrderItemAddon({
        required this.id,
        required this.orderItemsId,
        required this.addOnsId,
        required this.createdAt,
        required this.updatedAt,
        required this.addOns,
    });

    factory OrderItemAddon.fromJson(Map<String, dynamic> json) => OrderItemAddon(
        id: json["id"],
        orderItemsId: json["order_items_id"],
        addOnsId: json["add_ons_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        addOns: Variants.fromJson(json["add_ons"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_items_id": orderItemsId,
        "add_ons_id": addOnsId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "add_ons": addOns.toJson(),
    };
}

class Variants {
    int id;
    String title;
    String? image;
    String status;
    String currentPrice;
    String previousPrice;
    String itemId;
    DateTime createdAt;
    DateTime updatedAt;

    Variants({
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

    factory Variants.fromJson(Map<String, dynamic> json) => Variants(
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

class Tables {
    int id;
    String tableNumber;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    String roomId;

    Tables({
        required this.id,
        required this.tableNumber,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.roomId,
    });

    factory Tables.fromJson(Map<String, dynamic> json) => Tables(
        id: json["id"],
        tableNumber: json["table_number"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roomId: json["room_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "table_number": tableNumber,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "room_id": roomId,
    };
}
