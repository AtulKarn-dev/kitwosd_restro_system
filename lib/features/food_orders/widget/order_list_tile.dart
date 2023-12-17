import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/request/get_order_response.dart';
import 'package:kitwosd_restro_system/features/food_orders/widget/order_status.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';
import 'package:provider/provider.dart';

class OrderListTile extends StatefulWidget {
  OrderListTile(
      {super.key,
      required this.id,
      required this.sn,
      required this.status,
      required this.subtitle,
      required this.title,
      required this.quantity,
      required this.price,
      this.onStatusChange});

  final int id;
  final int sn;
  final String title;
  final String subtitle;
  final String? price;
  final FoodItemState status;
  final String quantity;

  ValueChanged<FoodItemState>? onStatusChange;

  @override
  State<OrderListTile> createState() => _OrderListTileState();
}

class _OrderListTileState extends State<OrderListTile> {
  bool selectStatus = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.w),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: const Color(0xFFe3e3e3))),
      child: ListTile(
        dense: true,
        visualDensity: const VisualDensity(vertical: 4), //
        leading: Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: const Color(0xff868686))),
            child: Text(
              widget.sn.toString(),
              style: TextStyle(
                  fontSize: 4.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffF8B64C)),
            )),
        title: Text(
         '${widget.title} X ${widget.quantity}' ,
          style: TextStyle(
            fontSize: 6.sp,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        subtitle: Text.rich(TextSpan(
            text: '${widget.subtitle}\n',
            style: TextStyle(
                color: const Color(0xff868686),
                fontWeight: FontWeight.w400,
                fontSize: 5.sp),
            children: [
              WidgetSpan(
                  child: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Consumer<FoodOrderProvider>(
                  builder: (context, value, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Variant:',
                        style: TextStyle(
                            fontSize: 4.sp, fontWeight: FontWeight.bold),
                      ),
                      Text('Add Ons:',
                          style: TextStyle(
                              fontSize: 4.sp, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ))
            ])),
        trailing: Column(
          children: [
            Text(
              'Rs.${widget.price!}',
              style: TextStyle(
                  color: const Color(0xffF8B64C),
                  fontWeight: FontWeight.w600,
                  fontSize: 5.sp),
            ),
            SizedBox(
              height: 5.w,
            ),
            OrderStatus(
              status: widget.status,
              onStatusChange: (value) => widget.onStatusChange?.call(value),
            )
          ],
        ),
      ),
    );
  }
}
