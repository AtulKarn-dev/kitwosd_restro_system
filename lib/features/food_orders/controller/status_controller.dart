import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kitwosd_restro_system/error/exceptions.dart';
import 'package:kitwosd_restro_system/error/http_exceptions.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/response/status_response.dart';
import 'package:kitwosd_restro_system/network/client_info.dart';

class StatusController {
  Future<StatusResponse?> getStatus(String data, int id) async {
    Response<String>? response;
    try {
      debugPrint(data);
      Dio dio = await getDioWithToken();
      // var formData = FormData.fromMap(map);
      // String data = json.encode(map);

      // dio.options.headers['content_type'] = 'multipart/form-data';
      response = await dio.post("update-item-status/$id", data: data);
      if (response.statusCode == 200) {
        StatusResponse statusResponse = statusResponseFromJson(response.data!);
        debugPrint(response.data);
        return statusResponse;
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
