import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kitwosd_restro_system/error/exceptions.dart';
import 'package:kitwosd_restro_system/error/http_exceptions.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/add_item_response.dart';
import 'package:kitwosd_restro_system/network/client_info.dart';

class AddItemController {
  Future<AddItemResponse?> getItem(String data, int id) async {
    Response<String>? response;
    try {
      debugPrint(data);
      Dio dio = await getDioWithToken();

      response = await dio.post("addMenuItem/$id", data: data);
      if (response.statusCode == 200) {
        AddItemResponse addItemResponse =
            addItemResponseFromJson(response.data!);
        debugPrint(response.data);
        var msg = response.data;
        var splitMessage = msg!.split(':')[1];
        Fluttertoast.showToast(
            msg: splitMessage.replaceAll(RegExp('[^A-Za-z]'), ' '),
            backgroundColor: const Color(0xffeea734),
            gravity: ToastGravity.CENTER);
        return addItemResponse;
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
