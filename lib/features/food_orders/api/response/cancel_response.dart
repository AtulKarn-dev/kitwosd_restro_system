// To parse this JSON data, do
//
//     final checkOutResponse = checkOutResponseFromJson(jsonString);

import 'dart:convert';

CancelResponse cancelResponseFromJson(String str) =>
    CancelResponse.fromJson(json.decode(str));

String cancelResponseToJson(CancelResponse data) =>
    json.encode(data.toJson());

class CancelResponse {
  String message;
  

  CancelResponse({
    required this.message,
  });

  factory CancelResponse.fromJson(Map<String, dynamic> json) =>
      CancelResponse(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
