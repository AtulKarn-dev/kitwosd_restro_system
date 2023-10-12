import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';

class OrderStatusTile extends StatefulWidget {
  final int sn;
  final String title;
  final int index;
  final FoodItemState state;
  final Function? removeOrder;

  const OrderStatusTile(
      {super.key,
      required this.sn,
      required this.title,
      required this.state,
      required this.index,
      this.removeOrder});

  @override
  State<OrderStatusTile> createState() => _OrderStatusTileState();
}

class _OrderStatusTileState extends State<OrderStatusTile> {
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
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
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
              widget.title,
              style: TextStyle(
                fontSize: 6.sp,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            trailing: statusWidget()));
  }

  Widget? statusWidget() {
    switch (widget.state) {
      case FoodItemState.pending:
        return Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.pending,
              size: 30,
              color: Color(0xffF8B64C),
            ),
            SizedBox(
              width: 2.w,
            ),
            IconButton(
                onPressed: () {
                  if (widget.removeOrder != null) {
                      widget.removeOrder!(widget.index);
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        );
      case FoodItemState.preparing:
        return const Icon(
          Icons.sync,
          size: 30,
          color: Colors.green,
        );
      case FoodItemState.ready:
        return const Icon(
          Icons.check_circle_outline,
          size: 30,
          color: Colors.green,
        );
      default:
        return const Icon(Icons.check_circle, size: 30, color: Colors.green);
    }
  }
}
