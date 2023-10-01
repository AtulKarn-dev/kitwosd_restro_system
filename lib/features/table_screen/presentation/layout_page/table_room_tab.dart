import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/table_screen/presentation/layout_page/tables_tablet.dart';

class TableRoomTab extends StatefulWidget {
  const TableRoomTab({super.key});

  @override
  State<TableRoomTab> createState() => _TableRoomTabState();
}

class _TableRoomTabState extends State<TableRoomTab> {
  List<String> rooms = ['Room 1', 'Room 2', 'Room 3', 'Room 4'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
          bottom: TabBar(
            isScrollable: true,
              tabs: List<Tab>.generate(
                  4,
                  (index) => Tab(
                          child: Text(
                        rooms[index],
                        style: TextStyle(fontSize: 10.sp),
                      )))),
        ),
        body: TabBarView(
          children: List<Tables>.generate(4, (index) => const Tables()),
        ),
      ),
    );
  }
}

