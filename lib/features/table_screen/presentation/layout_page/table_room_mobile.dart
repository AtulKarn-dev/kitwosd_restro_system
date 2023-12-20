import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/table_screen/presentation/layout_page/tables_mobile.dart';

class TableRoomMobile extends StatefulWidget {
  const TableRoomMobile({super.key});

  @override
  State<TableRoomMobile> createState() => _TableRoomMobileState();
}

class _TableRoomMobileState extends State<TableRoomMobile>
    with TickerProviderStateMixin {
  List<String> rooms = ['Room 1', 'Room 2', 'Room 3', 'Room 4'];
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            controller: tabController,
            isScrollable: true,
            tabs: List.generate(
                4,
                (index) => Tab(
                        child: Text(
                      rooms[index],
                      style: TextStyle(fontSize: 12.sp),
                    )))),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: List.generate(4, (index) => const TablesMobile()),
          ),
        ),
      ],
    );
  }
}
