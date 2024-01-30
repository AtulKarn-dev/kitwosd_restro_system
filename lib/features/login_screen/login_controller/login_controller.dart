import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../error/exceptions.dart';
import '../../../error/http_exceptions.dart';
import '../../../network/client_info.dart';
import '../../../storage/secure_storage.dart';
import '../../../widget/helper/constant.dart';
import '../response/login_response.dart';

class LoginController {
  Future<LoginResponse?> getLogin(String data) async {
    Response<String>? response;
    try {
      debugPrint(data);
      Dio dio = getDio();
      // var formData = FormData.fromMap(map);
      // String data = json.encode(map);

      // dio.options.headers['content_type'] = 'multipart/form-data';
      response = await dio.post("login", data: data);
      if (response.statusCode == 200) {
        LoginResponse loginResponse = loginResponseFromJson(response.data!);
        debugPrint(response.data);

        await SecureStorage().writeData(storageToken, loginResponse.data.token);
        await SecureStorage()
            .writeData(storageEmail, loginResponse.data.user.email);
        await SecureStorage()
            .writeData(storageFullname, loginResponse.data.user.name);
        await SecureStorage()
            .writeData(storageUserId, loginResponse.data.user.id.toString());

        return loginResponse;
      } else {
        return null;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
        Map? r = json.decode(e.response!.data!);
        throw ValidationException(r, r!['data']);
      } else if (e.response!.statusCode == 401) {
        Map? r = json.decode(e.response!.data!);
        throw ValidationException(r, r!['message']);
      } else {
        throw ServerException().gotException(e.message!);
      }
    }
  }
}
