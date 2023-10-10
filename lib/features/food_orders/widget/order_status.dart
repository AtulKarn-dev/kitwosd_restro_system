import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

class OrderStatus extends StatefulWidget {
  FoodItemState status;
  OrderStatus({super.key, required this.status});

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isTablet ? 7.w : 20.w,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: const Color(0xffF8B64C))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: widget.status,
            items: FoodItemState.values
                .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(
                        value.displayTitle,
                        style: TextStyle(fontSize: 4.sp),
                      ),
                    ))
                .toList(),
            onChanged: (v) {
              setState(() {
                widget.status = v!;
              });
            }),
      ),
    );
  }
}
