import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/food_menu_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/addon_widget.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';

class AddOnsList extends StatefulWidget {
  const AddOnsList({super.key,
  required this.foodId,
      required this.isSearching,
      required this.provider});
  final int foodId;
  final bool isSearching;
  final FoodOrderProvider provider;

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
    return   FutureBuilder<List<Addon>?>(
            future: getAddons(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Addon> data = snapshot.data!;
                bool selectedValue = false;
                return Column(
                    children: List.generate(
                        data.length,
                        (index) => AddOnsWidget(
                              title: data[index].title,
                              price: data[index].currentPrice,
                              selectedValue: selectedValue,
                            )));
              } else {
                return const CircularProgressIndicator();
              }
            },
          );
  }
}