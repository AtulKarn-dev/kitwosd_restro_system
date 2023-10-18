import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_orders/widget/order_list_tile.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';
import 'package:provider/provider.dart';

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
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 330,
                    child: Consumer<FoodOrderProvider>(
                      builder: (context, provider, child) => ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            FoodItem item = provider.mainFoodList[index];
                            return OrderListTile(
                              id: index,
                              sn: index + 1,
                              status: item.state,
                              subtitle: item.description,
                              title: item.title,
                              price: item.currentPrice,
                              onStatusChange: (value) =>
                                  provider.updateFoodItemState(index, value),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 8.w,
                            );
                          },
                          itemCount: provider.mainFoodList.length),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.h,
                ),
                Expanded(
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
                              style: TextStyle(
                                  fontSize: 6.sp, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Rs.200.00',
                              style: TextStyle(
                                  fontSize: 6.sp, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Add on',
                              style: TextStyle(
                                  fontSize: 6.sp, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Rs.00',
                              style: TextStyle(
                                  fontSize: 6.sp, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Taxable Amount',
                              style: TextStyle(
                                  fontSize: 6.sp, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Rs.00',
                              style: TextStyle(
                                  fontSize: 6.sp, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'VAT',
                              style: TextStyle(
                                  fontSize: 6.sp, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Rs.00',
                              style: TextStyle(
                                  fontSize: 6.sp, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Service Tax',
                              style: TextStyle(
                                  fontSize: 6.sp, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Rs.00',
                              style: TextStyle(
                                  fontSize: 6.sp, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Grand Total',
                              style: TextStyle(
                                  fontSize: 6.sp, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Rs.200.00',
                              style: TextStyle(
                                  fontSize: 6.sp, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
