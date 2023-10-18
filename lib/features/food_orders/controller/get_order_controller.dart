import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kitwosd_restro_system/error/exceptions.dart';
import 'package:kitwosd_restro_system/error/http_exceptions.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/request/get_order_response.dart';
import 'package:kitwosd_restro_system/network/client_info.dart';

class FoodOrderController {
  Future<List<Datum>> getOrder(String id) async {
    Response<String>? response;
    try {
      Dio dio = await getDioWithToken();

      response = await dio.get("get-order/$id");
      if (response.statusCode == 200) {
        GetOrderResponse getOrderResponse =
            getOrderResponseFromJson(response.data!);
        List<Datum> itemsList = [];
        for (Datum items in getOrderResponse.data) {
          itemsList.add(items);
        }
        return itemsList;
      } else {
        return [];
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
