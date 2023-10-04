import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/table_screen/controller/table_room_controller.dart';
import 'package:kitwosd_restro_system/features/table_screen/presentation/layout_page/table_room_widget.dart';

class TableRoomTab extends StatefulWidget {
  const TableRoomTab({super.key});

  @override
  State<TableRoomTab> createState() => _TableRoomTabState();
}

class _TableRoomTabState extends State<TableRoomTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Tables',
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff020f06)),
        ),
        actions: [
          Container(
              height: 134.h,
              width: 134.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/restro_kit-removebg-preview.png',
                      ),
                      fit: BoxFit.contain))),
        ],
      ),
      body: FutureBuilder<List<int>?>(
          future: TableRoomController().getRoom(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<int> data = snapshot.data!;
              return TableRoomWidget(rooms: data);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
