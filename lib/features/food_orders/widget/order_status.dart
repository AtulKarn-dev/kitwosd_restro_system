import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/request/status_request.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/response/get_order_res.dart';
import 'package:kitwosd_restro_system/features/food_orders/controller/status_controller.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

class OrderStatus extends StatefulWidget {
  final int id;
  FoodItemState status;
  ValueChanged<FoodItemState>? onStatusChange;
  OrderStatus(
      {super.key, required this.status, this.onStatusChange, required this.id});

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isTablet ? 8.w : 20.w,
      width: isTablet ? 35.w : null,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: const Color(0xffF8B64C))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: widget.status,
            items: FoodItemState.values
                .map(
                  (value) => DropdownMenuItem(
                    onTap: () async {
                      await StatusController().getStatus(
                          statusRequestToJson(
                              StatusRequest(status: value.apiValue)),
                          widget.id);
                    },
                    value: value,
                    child: Text(
                      value.apiValue,
                      style: TextStyle(fontSize: 4.sp),
                    ),
                  ),
                )
                .toList(),
            onChanged: (v) {
              FoodItemState state = v!;
              widget.onStatusChange?.call(state);
              setState(() {
                widget.status = state;
              });
            }),
      ),
    );
  }
}
