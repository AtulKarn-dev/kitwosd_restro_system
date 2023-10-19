import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/order_status_tile.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/request/get_order_response.dart';
import 'package:kitwosd_restro_system/features/food_orders/controller/get_order_controller.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';
import 'package:kitwosd_restro_system/features/provider/item_count_provider.dart';

class OrderItemsWidget extends StatefulWidget {
  final int id;
  const OrderItemsWidget({super.key, required this.id});

  @override
  State<OrderItemsWidget> createState() => _OrderItemsWidgetState();
}

class _OrderItemsWidgetState extends State<OrderItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder<List<Datum>>(
      future: FoodOrderController().getOrder(widget.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Datum> data = snapshot.data!;
          Widget? quantity() {
            return Text(
              'Quantity: ',
              style: TextStyle(
                  fontSize: 4.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff868686)),
            );
          }

          return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Datum item = data[index];
                return OrderStatusTile(
                    sn: index + 1,
                    title: item.items.title,
                    index: index,
                    subtitle: quantity());
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 4.w,
                );
              },
              itemCount: data.length);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    )
        // Consumer<FoodOrderProvider>(
        //   builder: (context, provider, child) {
        //     return ListView.separated(
        //         shrinkWrap: true,
        //         itemBuilder: (context, index) {
        //           FoodItem item = provider.mainFoodList[index];

        //           void removetile() {
        //             setState(() {
        //               provider.deleteAddedOrderItem(index);
        //             });
        //           }

        //           Widget? quantity() {
        //             return Text(
        //               'Quantity: ${context.watch<ItemCountProvider>().itemCount()}',
        //               style: TextStyle(
        //                   fontSize: 4.sp,
        //                   fontWeight: FontWeight.bold,
        //                   color: const Color(0xff868686)),
        //             );
        //           }

        //           return OrderStatusTile(
        //             sn: index + 1,
        //             title: item.title,
        //             index: index,
        //             removeOrder: removetile,
        //             subtitle: quantity(),
        //           );
        //         },
        //         separatorBuilder: (context, index) {
        //           return SizedBox(
        //             height: 4.w,
        //           );
        //         },
        //         itemCount: provider.mainFoodList.length);
        //   },
        // )
        );
  }
}
