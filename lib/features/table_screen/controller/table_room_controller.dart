import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:kitwosd_restro_system/features/table_screen/response/table_room_response.dart';

import '../../../error/exceptions.dart';
import '../../../error/http_exceptions.dart';
import '../../../network/client_info.dart';

class TableRoomController {
  Future<RoomsResponse?> getTables() async {
    Response<String>? response;
    try {
      Dio dio = await getDioWithToken();
      // var formData = FormData.fromMap(map);
      // String data = json.encode(map);

      // dio.options.headers['content_type'] = 'multipart/form-data';
      response = await dio.get("rooms");
      if (response.statusCode == 200) {
        return roomsResponseFromJson(response.data!);
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

