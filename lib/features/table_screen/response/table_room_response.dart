// To parse this JSON data, do
//
//     final roomsResponse = roomsResponseFromJson(jsonString);

import 'dart:convert';

RoomsResponse roomsResponseFromJson(String str) =>
    RoomsResponse.fromJson(json.decode(str));

String roomsResponseToJson(RoomsResponse data) => json.encode(data.toJson());

class RoomsResponse {
  List<Datum> data;

  RoomsResponse({
    required this.data,
  });

  factory RoomsResponse.fromJson(Map<String, dynamic> json) => RoomsResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  List<RoomTable> tables;

  Datum({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.tables,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        tables: List<RoomTable>.from(
            json["tables"].map((x) => RoomTable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "tables": List<dynamic>.from(tables.map((x) => x.toJson())),
      };
}

class RoomTable {
  int id;
  String tableNumber;
  String? status;
  DateTime createdAt;
  DateTime updatedAt;
  String roomId;

  RoomTable({
    required this.id,
    required this.tableNumber,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.roomId,
  });

  factory RoomTable.fromJson(Map<String, dynamic> json) => RoomTable(
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


