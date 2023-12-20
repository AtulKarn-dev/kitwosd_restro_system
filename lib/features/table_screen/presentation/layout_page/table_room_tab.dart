import 'package:flutter/material.dart';
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
    return  FutureBuilder<List<int>?>(
          future: TableRoomController().getRoom(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<int> data = snapshot.data!;
              return TableRoomWidget(rooms: data);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          });
  }
}
