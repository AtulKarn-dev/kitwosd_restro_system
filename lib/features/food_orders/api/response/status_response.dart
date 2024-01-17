// To parse this JSON data, do
//
//     final statusResponse = statusResponseFromJson(jsonString);

import 'dart:convert';

StatusResponse statusResponseFromJson(String str) => StatusResponse.fromJson(json.decode(str));

String statusResponseToJson(StatusResponse data) => json.encode(data.toJson());

class StatusResponse {
    String message;
    Data data;

    StatusResponse({
        required this.message,
        required this.data,
    });

    factory StatusResponse.fromJson(Map<String, dynamic> json) => StatusResponse(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String orderId;
    String itemId;
    String variantId;
    String status;
    String quantity;
    String price;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.orderId,
        required this.itemId,
        required this.variantId,
        required this.status,
        required this.quantity,
        required this.price,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        orderId: json["order_id"],
        itemId: json["item_id"],
        variantId: json["variant_id"],
        status: json["status"],
        quantity: json["quantity"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "item_id": itemId,
        "variant_id": variantId,
        "status": status,
        "quantity": quantity,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
