import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_orders/presentation/layout_page/food_orders_mobile.dart';
import 'package:kitwosd_restro_system/features/food_orders/presentation/layout_page/food_orders_tab.dart';
import 'package:kitwosd_restro_system/features/table_screen/response/table_room_response.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

class TableWidget extends StatefulWidget {
  final RoomTable? table;

  const TableWidget({super.key, this.table});

  @override
  State<TableWidget> createState() => _TableState();
}

class _TableState extends State<TableWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => isTablet? FoodOrdersTab(
                        id: widget.table!.id,
                      ):FoodOrdersMobile(id: widget.table!.id,)));
            },
            icon: Image.asset(
              'assets/images/table-removebg-preview.png',
              width: 50.w,
              height: 50.w,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Table ${widget.table!.tableNumber.replaceAll(RegExp('[^0-9]'), '')}',
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              width: 4.w,
            ),
            widget.table!.status == 'occupied'
                ? CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 6.r,
                  )
                : CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 6.r,
                  )
          ],
        )
      ],
    );
  }
}
