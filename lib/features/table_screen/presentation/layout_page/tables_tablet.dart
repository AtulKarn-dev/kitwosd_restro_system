import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_orders/presentation/food_orders.dart';
import 'package:kitwosd_restro_system/features/table_screen/response/table_room_response.dart';

class Tables extends StatefulWidget {
  const Tables({super.key});

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  // bool isLoading = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getData();
  // }

  // getData() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   var res = await TableRoomController().getTables();
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(12.r),
      child: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 50,
        children: const [
          // FutureBuilder(
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          TableWidget()
          // } else {
          //       // return const Center(child: CircularProgressIndicator());
          //     }
          //   },
          // )
        ],
      ),
    ));
  }
}

class TableWidget extends StatefulWidget {
  final RoomTable? table;

  const TableWidget({super.key, this.table});

  @override
  State<StatefulWidget> createState() => _TableState();
}

class _TableState extends State<TableWidget> {
  String? status;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const FoodOrders()));
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
              /* widget.table!.tableNumber*/ 'Table 1',
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              width: 4.w,
            ),
            status == 'occupied'
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
