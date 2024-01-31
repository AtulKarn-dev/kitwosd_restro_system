import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_orders/presentation/food_orders.dart';
import 'package:kitwosd_restro_system/features/table_screen/controller/table_room_controller.dart';
import 'package:kitwosd_restro_system/features/table_screen/response/table_room_response.dart';

class Tables extends StatefulWidget {
  final int roomNumber;
  const Tables({super.key, required this.roomNumber});

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  Future<void> getData() async {
    setState(() {
      TableRoomController().getTables(widget.roomNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 1), () {
          getData();
        });
      },
      child: Padding(
          padding: EdgeInsets.all(12.r),
          child: FutureBuilder<List<RoomTable>?>(
            future: TableRoomController().getTables(widget.roomNumber),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<RoomTable>? data = snapshot.data!;
                return GridView.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 50,
                    children: List.generate(
                        data.length,
                        (index) => TableWidget(
                              table: data[index],
                            )));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}

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
                  builder: (context) => FoodOrders(
                        id: widget.table!.id,
                      )));
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
