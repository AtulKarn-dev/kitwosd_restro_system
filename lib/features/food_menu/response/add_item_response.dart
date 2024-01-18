// To parse this JSON data, do
//
//     final addItemResponse = addItemResponseFromJson(jsonString);

import 'dart:convert';

AddItemResponse addItemResponseFromJson(String str) => AddItemResponse.fromJson(json.decode(str));

String addItemResponseToJson(AddItemResponse data) => json.encode(data.toJson());

class AddItemResponse {
    String message;

    AddItemResponse({
        required this.message,
    });

    factory AddItemResponse.fromJson(Map<String, dynamic> json) => AddItemResponse(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
