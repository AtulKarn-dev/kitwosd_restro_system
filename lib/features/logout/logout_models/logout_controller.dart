import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kitwosd_restro_system/error/exceptions.dart';
import 'package:kitwosd_restro_system/error/http_exceptions.dart';
import 'package:kitwosd_restro_system/features/logout/logout_models/data/response.dart';
import 'package:kitwosd_restro_system/network/client_info.dart';

class LogoutController {
  Future<LogOutResponse?> getLogout(String data) async {
    Response<String>? response;
    try {
      debugPrint(data);
      Dio dio = await getDioWithToken();
  
      response = await dio.post("logout", data: data);
      if (response.statusCode == 200) {
        LogOutResponse logOutResponse = logOutResponseFromJson(response.data!);
        debugPrint(response.data);
        return logOutResponse;
      } else {
        return null;
      }
    }
    on DioException catch (e) {
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