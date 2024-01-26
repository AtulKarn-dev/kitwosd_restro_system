


import 'package:dio/dio.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/response/cancel_response.dart';
import 'package:kitwosd_restro_system/network/api_controller.dart';

class CancelController{
  Future<CancelResponse?> getCancel(int orderId) async {
    Response<String>? response = await ApiController.getResponse("cancel-order/$orderId");
    if (response != null) {
      CancelResponse cancelResponse =
          cancelResponseFromJson(response.data!);
      return cancelResponse;
    } else {
      return null;
    }
  }
}