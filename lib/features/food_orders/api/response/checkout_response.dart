// To parse this JSON data, do
//
//     final checkOutResponse = checkOutResponseFromJson(jsonString);

import 'dart:convert';

CheckOutResponse checkOutResponseFromJson(String str) =>
    CheckOutResponse.fromJson(json.decode(str));

String checkOutResponseToJson(CheckOutResponse data) =>
    json.encode(data.toJson());

class CheckOutResponse {
  String message;
  

  CheckOutResponse({
    required this.message,
  });

  factory CheckOutResponse.fromJson(Map<String, dynamic> json) =>
      CheckOutResponse(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
