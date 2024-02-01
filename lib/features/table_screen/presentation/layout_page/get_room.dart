import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/features/table_screen/controller/table_room_controller.dart';
import 'package:kitwosd_restro_system/features/table_screen/presentation/layout_page/table_room_widget.dart';

class GetRoom extends StatefulWidget {
  const GetRoom({super.key});

  @override
  State<GetRoom> createState() => _GetRoomState();
}

class _GetRoomState extends State<GetRoom> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>?>(
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
