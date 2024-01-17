import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/response/get_order_res.dart';
import 'package:kitwosd_restro_system/features/food_orders/widget/order_list_tile.dart';

class FoodOrderList extends StatelessWidget {
  final List<OrderItem> data;
  const FoodOrderList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      return Expanded(
        flex: 3,
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 330,
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                OrderItem item = data[index];
                List<String?> addExtra = [];
                for (OrderItemAddon orderItemAddon in item.orderItemAddons) {
                  addExtra.add(orderItemAddon.addOns.title);
                }
                List<String?> noAddons = ["No Addons!!"];
                return OrderListTile(
                    orderId: item.id,
                    id: index,
                    sn: index + 1,
                    status: item.status,
                    subtitle: item.items.description,
                    title: item.items.title,
                    variant: item.variants.title,
                    addOns: addExtra.isNotEmpty ? addExtra : noAddons,
                    quantity: item.quantity,
                    price: item.items.currentPrice,
                    onStatusChange: (value) {});
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 8.w,
                );
              },
              itemCount: data.length),
        ),
      );
    } else {
      return Expanded(
        flex: 3,
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 330,
          child: Center(
              child:
                  Text('Select Your Order', style: TextStyle(fontSize: 8.sp))),
        ),
      );
    }
  }
}