
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/response/get_order_res.dart';


class Statistic extends StatelessWidget {
  final Data data;
  const Statistic({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 330,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w300),
                ),
                Text(
                  data.orderAmount,
                  style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w300),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'VAT',
                  style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w300),
                ),
                Text(
                  data.vatAmount,
                  style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w300),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Service Tax',
                  style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w300),
                ),
                Text(
                  data.serviceTaxAmount,
                  style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w300),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount',
                  style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w300),
                ),
                Text(
                  data.discount,
                  style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w300),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Grand Total',
                  style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w300),
                ),
                Text(
                  data.paidAmount,
                  style: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w300),
                )
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}