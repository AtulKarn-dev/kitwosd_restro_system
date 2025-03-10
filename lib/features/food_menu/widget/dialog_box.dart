import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_item_dialog.dart';
import 'package:provider/provider.dart';

Future dialogBox(BuildContext context, int id, bool isSearching) {
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
        foodId: id,
        isSearching: isSearching,
        provider: context.read(),
      ),
    ),
  );
}
