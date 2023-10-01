import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';
import 'package:kitwosd_restro_system/features/table_screen/presentation/layout_page/table_room_tab.dart';
import 'package:kitwosd_restro_system/features/table_screen/presentation/layout_page/table_room_mobile.dart';

class TableView extends StatefulWidget {
  const TableView({super.key});

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isTablet ? const TableRoomTab() : const TableRoomMobile(),
    );
  }
}
