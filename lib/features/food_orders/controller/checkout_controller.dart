import 'package:dio/dio.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/response/checkout_response.dart';
import 'package:kitwosd_restro_system/network/api_controller.dart';

class CheckoutController {
  Future<CheckOutResponse?> getCheckout(int orderId) async {
    Response<String>? response =
        await ApiController.getResponse("checkout-order/$orderId");
    if (response != null) {
      CheckOutResponse checkOutResponse =
          checkOutResponseFromJson(response.data!);
      return checkOutResponse;
    } else {
      return null;
    }
  }
}
