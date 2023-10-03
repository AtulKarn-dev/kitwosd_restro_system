import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/table_screen/controller/table_room_controller.dart';
import 'package:kitwosd_restro_system/features/table_screen/presentation/layout_page/tables_tablet.dart';

class TableRoomTab extends StatefulWidget {
  const TableRoomTab({super.key});

  @override
  State<TableRoomTab> createState() => _TableRoomTabState();
}

class _TableRoomTabState extends State<TableRoomTab>
    with SingleTickerProviderStateMixin {
  // List<String> rooms = ['Room 1', 'Room 2', 'Room 3', 'Room 4'];
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length:1, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

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
      body: Column(
        children: [
          FutureBuilder<List<String>?>(
              future: TableRoomController().getRoom(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return TabBar(
                      controller: tabController,
                      isScrollable: true,
                      tabs: List<Tab>.generate(
                          snapshot.data!.length,
                          (index) => Tab(
                                  child: Text(
                                "Room ${snapshot.data![index]}",
                                style: TextStyle(fontSize: 10.sp),
                              ))));
                } else {
                  return  const Center(child: CircularProgressIndicator());
                }
              }),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: List<Tables>.generate(1, (index) => const Tables()),
            ),
          ),
        ],
      ),
    );
  }
}
