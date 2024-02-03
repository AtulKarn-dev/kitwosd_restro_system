import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/add_item_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_item_dialog.dart';

Future dialogBox(BuildContext context,int tableId, 
                FoodItem foodItem, Function(AddItemResponse) onAddItem) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Add Item',
            style: TextStyle(
                color: Color(0xffeea734), fontWeight: FontWeight.w600),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              ))
        ],
      ),
      content: FoodItemDialogWidget(
        foodItem: foodItem,
        tableId: tableId,
        onAddItem: (item) => onAddItem(item),
      ),
    ),
  );
}
