import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

class OrderStatus extends StatefulWidget {
  String status;
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
            items: [
              DropdownMenuItem(
                value: 'pending',
                child: Text(
                  'Pending',
                  style: TextStyle(fontSize: 4.sp),
                ),
              ),
              DropdownMenuItem(
                value: 'preparing',
                child: Text(
                  'Preparing',
                  style: TextStyle(fontSize: 4.sp),
                ),
              ),
              DropdownMenuItem(
                value: 'ready',
                child: Text(
                  'Ready to be served',
                  style: TextStyle(fontSize: 4.sp),
                ),
              ),
              DropdownMenuItem(
                value: 'delivered',
                child: Text(
                  'Delivered',
                  style: TextStyle(fontSize: 4.sp),
                ),
              ),
            ],
            onChanged: (v) {
              setState(() {
                widget.status = v!;
              });
            }),
      ),
    );
  }
}
