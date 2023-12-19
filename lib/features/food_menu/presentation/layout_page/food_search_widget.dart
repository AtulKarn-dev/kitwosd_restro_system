import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_filter.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_menu.dart';



class FoodSearchWidget extends StatefulWidget {
  const FoodSearchWidget({super.key, required this.foodItems});

  final List<FoodItem> foodItems;

  @override
  State<FoodSearchWidget> createState() => _FoodSearchWidgetState();
}

class _FoodSearchWidgetState extends State<FoodSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .60,
              child: FoodMenu(mainFoodList: widget.foodItems),
            )),
        SizedBox(
          width: 20.h,
        ),
        const Expanded(
            flex: 2,
            child: FoodFilter())
      ],
    );
  }
}
