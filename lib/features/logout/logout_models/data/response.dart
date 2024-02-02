// To parse this JSON data, do
//
//     final logOutResponse = logOutResponseFromJson(jsonString);

import 'dart:convert';

LogOutResponse logOutResponseFromJson(String str) => LogOutResponse.fromJson(json.decode(str));

String logOutResponseToJson(LogOutResponse data) => json.encode(data.toJson());

class LogOutResponse {
    String message;
    bool success;

    LogOutResponse({
        required this.message,
        required this.success,
    });

    factory LogOutResponse.fromJson(Map<String, dynamic> json) => LogOutResponse(
        message: json["message"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
    };
}
