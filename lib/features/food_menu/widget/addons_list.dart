import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/food_menu_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/addon_widget.dart';

class AddOnsList extends StatefulWidget {
  AddOnsList({
    super.key,
    required this.foodItem,
  });
  final FoodItem foodItem;

  List<int> selectedIds = [];
  List<double> selectedPrice = [];

  @override
  State<AddOnsList> createState() => _AddOnsListState();
}

class _AddOnsListState extends State<AddOnsList> {
  Future<List<Addon>?> getAddons() {
    // FoodItem item = widget.provider.getItem(widget.foodId, widget.isSearching);
    return FoodMenuController().getAddons(widget.foodItem.categories.name, widget.foodItem.id);
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
              onTap: (addOnsId, addOnsPrice) {
                if (addOnsId == addOns.id &&
                    addOnsPrice == double.parse(addOns.currentPrice)) {
                  widget.selectedIds.add(addOns.id);
                  widget.selectedPrice.add(double.parse(addOns.currentPrice));
                } else {
                  widget.selectedIds.remove(addOns.id);
                  widget.selectedPrice
                      .remove(double.parse(addOns.currentPrice));
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
