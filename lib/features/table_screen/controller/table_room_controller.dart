import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:kitwosd_restro_system/features/table_screen/response/table_room_response.dart';

import '../../../error/exceptions.dart';
import '../../../error/http_exceptions.dart';
import '../../../network/client_info.dart';

/*

"Room no. 1" ~ split ". " => ["Room no","1"]
 */

class TableRoomController {
  Future<List<int>?> getRoom() async {
    Response<String>? response;
    try {
      Dio dio = await getDioWithToken();

      response = await dio.get("rooms");
      if (response.statusCode == 200) {
        RoomsResponse roomsResponse = roomsResponseFromJson(response.data!);
        List<int> mainData = [];
        for (Datum data in roomsResponse.data) {
          mainData.add(data.id);
        }
        return mainData;
      } else {
        return null;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        Map? r = json.decode(e.response!.data!);
        throw ValidationException(r, r![r.keys.first.toString()]);
      } else if (e.response!.statusCode.toString() == "401") {
        Map? r = json.decode(e.response!.data!);
        throw ValidationException(r!['message'], r['success']);
      } else {
        throw ServerException().gotException(e.message!);
      }
    }
  }

  Future<List<RoomTable>?> getTables(int roomNumber) async {
    Response<String>? response;
    try {
      Dio dio = await getDioWithToken();

      response = await dio.get("rooms");
      if (response.statusCode == 200) {
        RoomsResponse roomsResponse = roomsResponseFromJson(response.data!);
        for (Datum room in roomsResponse.data) {
          if (room.id == roomNumber) {
            return room.tables;
          }
        }
        return null;
      } else {
        return null;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        Map? r = json.decode(e.response!.data!);
        throw ValidationException(r, r![r.keys.first.toString()]);
      } else if (e.response!.statusCode.toString() == "401") {
        Map? r = json.decode(e.response!.data!);
        throw ValidationException(r!['message'], r['success']);
      } else {
        throw ServerException().gotException(e.message!);
      }
    }
  }
}
