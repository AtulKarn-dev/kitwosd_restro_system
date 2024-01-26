import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/response/checkout_response.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/response/get_order_res.dart';
import 'package:kitwosd_restro_system/features/food_orders/controller/cancel_controller.dart';
import 'package:kitwosd_restro_system/features/food_orders/controller/checkout_controller.dart';
import 'package:kitwosd_restro_system/features/table_screen/presentation/table_view.dart';
import 'package:kitwosd_restro_system/widget/snackbar.dart';

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
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myButton(
                  text: 'Checkout',
                  color: const Color(0xffeea734),
                  onTap: () async {
                    var res = await CheckoutController().getCheckout(data.id);
                    if (!context.mounted) return;
                    if (res is CheckOutResponse) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TableView(),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(showSnackBar(
                          message:
                              'Cannot Check out: not all items are delivered.',
                          isError: true));
                    }
                  },
                ),
                SizedBox(
                  width: 10.w,
                ),
                myButton(
                  text: 'Cancel',
                  color: Colors.red[400],
                  onTap: () async {
                    await CancelController().getCancel(data.id);
                    if (!context.mounted) return;
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TableView(),
                    ));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton myButton(
      {Color? color, required String text, Function()? onTap}) {
    return ElevatedButton(
        style: ButtonStyle(
            fixedSize: const MaterialStatePropertyAll(Size(150, 50)),
            backgroundColor: MaterialStatePropertyAll(color)),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
