import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/response/get_order_res.dart';
import 'package:kitwosd_restro_system/features/food_orders/controller/get_order_controller.dart';
import 'package:kitwosd_restro_system/features/food_orders/widget/food_order_list.dart';
import 'package:kitwosd_restro_system/features/food_orders/widget/statistic.dart';

class FoodOrdersTab extends StatefulWidget {
  final int id;
  const FoodOrdersTab({super.key, this.tables, required this.id});

  final String? tables;

  @override
  State<FoodOrdersTab> createState() => _FoodOrdersTabState();
}

class _FoodOrdersTabState extends State<FoodOrdersTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 45.h,
                    height: 45.h,
                    decoration: const BoxDecoration(color: Color(0xffeea734)),
                    child: BackButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                          iconSize: MaterialStateProperty.all(25.r),
                          alignment: Alignment.centerRight),
                    )),
                Text(
                  'Your Orders',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 45.w,
                  width: 45.w,
                  padding: EdgeInsets.zero,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/restro_kit-removebg-preview.png'))),
                )
              ],
            ),
            SizedBox(
              height: 2.w,
            ),
            Row(
              children: [
                Text(
                  'Table ${widget.id}',
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  height: 10.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      border: Border.all(color: const Color(0xffF8B64C))),
                  child: Center(
                      child: Text(
                    'SEATED',
                    style: TextStyle(
                        color: const Color(0xffF8B64C),
                        fontSize: 4.sp,
                        fontWeight: FontWeight.w600),
                  )),
                )
              ],
            ),
            SizedBox(
              height: 4.w,
            ),
            FutureBuilder<Data?>(
                future: FoodOrderController().getOrder(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.data != null) {
                    Data data = snapshot.data!;
                    List<OrderItem> itemsList = [];
                    for (OrderItem item in data.orderItems!) {
                      itemsList.add(item);
                    }
                    return Row(
                      children: [
                        FoodOrderList(data: itemsList),
                        SizedBox(
                          width: 15.h,
                        ),
                        Statistic(
                          data: data,
                        )
                      ],
                    );
                  }
                  return Center(
                      child: Text(
                    'Table is Vacant!!',
                    style: TextStyle(fontSize: 8.sp),
                  ));
                })
          ],
        ),
      ),
    );
  }
}




