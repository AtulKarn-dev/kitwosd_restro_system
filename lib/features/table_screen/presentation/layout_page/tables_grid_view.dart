import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/table_screen/controller/table_room_controller.dart';
import 'package:kitwosd_restro_system/features/table_screen/presentation/layout_page/table_widget.dart';
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
                return gridViewTablet(data);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }

  GridView gridViewTablet(List<RoomTable> data) {
    return GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 50,
        children: List.generate(
            data.length,
            (index) => TableWidget(
                  table: data[index],
                )));
  }
}
