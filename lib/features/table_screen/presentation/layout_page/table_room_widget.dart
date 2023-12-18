import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/table_screen/presentation/layout_page/tables_tablet.dart';

class TableRoomWidget extends StatefulWidget {
  final List<int> rooms;

  const TableRoomWidget({super.key, required this.rooms});

  @override
  State<TableRoomWidget> createState() => _TableRoomState();
}

class _TableRoomState extends State<TableRoomWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: widget.rooms.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> data = widget.rooms;
    return Column(
      children: [
        TabBar(
            padding: EdgeInsets.only(bottom: 4.h),
            controller: tabController,
            isScrollable: true,
            tabs: List<Tab>.generate(
                data.length,
                (index) => Tab(
                        child: Text(
                      "Room ${data[index]}",
                      style: TextStyle(fontSize: 10.sp),
                    )))),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: List<Tables>.generate(
                data.length, (index) => Tables(roomNumber: data[index])),
          ),
        ),
      ],
    );
  }
}
