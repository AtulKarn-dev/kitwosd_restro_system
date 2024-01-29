import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kitwosd_restro_system/error/exceptions.dart';
import 'package:kitwosd_restro_system/error/http_exceptions.dart';
import 'package:kitwosd_restro_system/network/client_info.dart';

class ApiController {
  static Future<Response<T>?> getResponse<T>(String path) async {
    Response<T>? response;
    try {
      Dio dio = await getDioWithToken();

      response = await dio.get(path);
      if (response.statusCode == 200) {
        return response;
      } else {
        return null;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        Map? r = json.decode(e.response!.data!);
        throw ValidationException(r!['message'], r['success']);
      } else if (e.response!.statusCode == 500) {
        Map? r = json.decode(e.response!.data!);
       throw ValidationException(r, r![r.keys.first]);
      } else {
        throw ServerException().gotException(e.message!);
      }
    }
  }
}
