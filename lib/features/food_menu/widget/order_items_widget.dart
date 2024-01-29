import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/delete_item_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/request/delete_item_request.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/order_status_tile.dart';
import 'package:kitwosd_restro_system/features/food_orders/api/response/get_order_res.dart';
import 'package:kitwosd_restro_system/features/food_orders/controller/get_order_controller.dart';
import 'package:kitwosd_restro_system/widget/snackbar.dart';

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
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData) {
              Data data = snapshot.data!;
              List<OrderItem> itemList = data.orderItems!;
              return generateListView(itemList);
            } else {
              return const Center(child: Text("No Data"));
            }
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  DismissDirection deletePending(FoodItemState state) {
    if (state == FoodItemState.pending) {
      return DismissDirection.startToEnd;
    } else {
      return DismissDirection.none;
    }
  }

  Widget generateListView(List<OrderItem> itemList) {
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

          return Dismissible(
            confirmDismiss: (DismissDirection direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("CONFIRM"),
                    content: const Text(
                        "Are you sure you wish to delete this item?"),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () async {
                            await DeleteItemController().getItem(
                                deleteRequestToJson(
                                    DeleteRequest(tableId: widget.id)),
                                item.id);
                            if (!mounted) return;
                            Navigator.of(context).pop(true);
                          },
                          child: const Text("DELETE")),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("CANCEL"),
                      ),
                    ],
                  );
                },
              );
            },
            onDismissed: (direction) {
              setState(() {
                itemList.removeAt(index);
              });
              ScaffoldMessenger.of(context)
                  .showSnackBar(showSnackBar(message: 'Item deleted!!'));
            },
            direction: deletePending(item.status),
            key: UniqueKey(),
            child: OrderStatusTile(
                itemId: item.id,
                tableId: widget.id,
                sn: index + 1,
                title: item.items.title,
                state: item.status,
                index: index,
                subtitle: quantity()),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 4.w,
          );
        },
        itemCount: itemList.length);
  }
}
