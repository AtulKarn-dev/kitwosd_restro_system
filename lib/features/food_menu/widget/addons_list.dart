import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/food_menu_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/addon_widget.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';

class AddOnsList extends StatefulWidget {
  AddOnsList(
      {super.key,
      required this.foodId,
      required this.isSearching,
      required this.provider});
  final int foodId;
  final bool isSearching;
  final FoodOrderProvider provider;
  List<int> selectedIds = [];

  @override
  State<AddOnsList> createState() => _AddOnsListState();
}

class _AddOnsListState extends State<AddOnsList> {
  Future<List<Addon>?> getAddons() {
    FoodItem item = widget.provider.getItem(widget.foodId, widget.isSearching);
    return FoodMenuController().getAddons(item.categories.name, item.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Addon>?>(
      future: getAddons(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Addon> data = snapshot.data!;
          return Column(
              children: List.generate(data.length, (index) {
            var addOns = data[index];
            return AddOnsWidget(
              addOns: addOns,
              onTap: (addOnsId) {
                if (addOnsId == addOns.id) {
                  widget.selectedIds.add(addOns.id);
                } else {
                  widget.selectedIds.remove(addOns.id);
                }
              },
            );
          }));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
