import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/table_screen/presentation/drawer_widget.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';
import 'package:kitwosd_restro_system/features/table_screen/presentation/layout_page/get_room.dart';

class TableView extends StatefulWidget {
  const TableView({super.key});

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          'Tables',
          style: TextStyle(
              fontSize: isTablet ? 12.sp : 24.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff020f06)),
        ),
        actions: isTablet
            ? [
                Container(
                    height: 134.h,
                    width: 134.h,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/restro_kit-removebg-preview.png',
                            ),
                            fit: BoxFit.contain))),
              ]
            : null,
      ),
      body: const GetRoom(),
      drawer: const DrawerWidget(),
    );
  }
}
