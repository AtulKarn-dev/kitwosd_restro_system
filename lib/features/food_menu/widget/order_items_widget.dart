import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/order_status_tile.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/response/get_order_res.dart';
import 'package:kitwosd_restro_system/features/food_orders/controller/get_order_controller.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';
import 'package:kitwosd_restro_system/features/provider/item_count_provider.dart';

class OrderItemsStatus extends StatefulWidget {
  final int id;
  const OrderItemsStatus({super.key, required this.id});

  @override
  State<OrderItemsStatus> createState() => _OrderItemsStatusState();
}

class _OrderItemsStatusState extends State<OrderItemsStatus> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder<Data?>(
      future: FoodOrderController().getOrder(widget.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Data data = snapshot.data!;
          List<OrderItem> itemList = [];
          for (OrderItem orderItem in data.orderItems!) {
            itemList.add(orderItem);
          }
          return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                OrderItem item = itemList[index];
                Widget? quantity() {
                  return Text(
                    'Quantity: ${item.quantity}',
                    style: TextStyle(
                        fontSize: 4.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff868686)),
                  );
                }

                return OrderStatusTile(
                    sn: index + 1,
                    title: item.items.title,
                    state: item.status,
                    index: index,
                    subtitle: quantity());
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 4.w,
                );
              },
              itemCount: itemList.length);
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
