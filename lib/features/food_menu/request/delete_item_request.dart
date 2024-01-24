// To parse this JSON data, do
//
//     final deleteRequest = deleteRequestFromJson(jsonString);

import 'dart:convert';

DeleteRequest deleteRequestFromJson(String str) => DeleteRequest.fromJson(json.decode(str));

String deleteRequestToJson(DeleteRequest data) => json.encode(data.toJson());

class DeleteRequest {
    int tableId;

    DeleteRequest({
        required this.tableId,
    });

    factory DeleteRequest.fromJson(Map<String, dynamic> json) => DeleteRequest(
        tableId: json["table_id"],
    );

    Map<String, dynamic> toJson() => {
        "table_id": tableId,
    };
}
