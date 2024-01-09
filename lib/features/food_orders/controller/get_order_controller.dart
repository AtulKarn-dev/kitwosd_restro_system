import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kitwosd_restro_system/error/exceptions.dart';
import 'package:kitwosd_restro_system/error/http_exceptions.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/response/get_order_res.dart';
import 'package:kitwosd_restro_system/network/client_info.dart';

class FoodOrderController {
  Future<List<OrderItem>> getOrder(int id) async {
    Response<String>? response;
    try {
      Dio dio = await getDioWithToken();

      response = await dio.get("get-order/$id");
      if (response.statusCode == 200) {
        GetOrderResponse getOrderResponse =
            getOrderResponseFromJson(response.data!);
        List<OrderItem> itemsList = [];
        for (OrderItem item in getOrderResponse.data.orderItems) {
          itemsList.add(item);
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
