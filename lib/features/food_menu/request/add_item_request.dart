// To parse this JSON data, do
//
//     final addItemRequest = addItemRequestFromJson(jsonString);

import 'dart:convert';

AddItemRequest addItemRequestFromJson(String str) => AddItemRequest.fromJson(json.decode(str));

String addItemRequestToJson(AddItemRequest data) => json.encode(data.toJson());

class AddItemRequest {
    int itemId;
    int variantId;
    String status;
    int quantity;
    int price;
    List<int> addons;

    AddItemRequest({
        required this.itemId,
        required this.variantId,
        required this.status,
        required this.quantity,
        required this.price,
        required this.addons,
    });

    factory AddItemRequest.fromJson(Map<String, dynamic> json) => AddItemRequest(
        itemId: json["item_id"],
        variantId: json["variant_id"],
        status: json["status"],
        quantity: json["quantity"],
        price: json["price"],
        addons: List<int>.from(json["addons"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "variant_id": variantId,
        "status": status,
        "quantity": quantity,
        "price": price,
        "addons": List<dynamic>.from(addons.map((x) => x)),
    };
}
