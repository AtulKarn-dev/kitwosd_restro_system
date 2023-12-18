import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/request/get_order_response.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

class OrderStatus extends StatefulWidget {
  FoodItemState status;
  ValueChanged<FoodItemState>? onStatusChange;
  OrderStatus({super.key, required this.status, this.onStatusChange});

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
