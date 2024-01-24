import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/error/exceptions.dart';
import 'package:kitwosd_restro_system/error/http_exceptions.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/delete_item_response.dart';
import 'package:kitwosd_restro_system/network/client_info.dart';

class DeleteItemController {
  Future<DeleteResponse?> getItem(String data, int id) async {
    Response<String>? response;
    try {
      debugPrint(data);
      Dio dio = await getDioWithToken();
      
      response = await dio.post("delete-item/$id", data: data);
      if (response.statusCode == 200) {
        DeleteResponse deleteResponse = deleteResponseFromJson(response.data!);
        debugPrint(response.data);
        return deleteResponse;
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
