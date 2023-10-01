import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/features/food_menu/presentation/layout_page/food_list_mobile.dart';
import 'package:kitwosd_restro_system/features/food_menu/presentation/layout_page/food_list_tab.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      isTablet?const FoodListTab():const FoodListMobile(),),
    );
  }
}