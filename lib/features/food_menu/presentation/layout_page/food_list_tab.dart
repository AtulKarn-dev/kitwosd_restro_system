import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/food_menu_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/presentation/layout_page/food_menu_categories.dart';
import 'package:kitwosd_restro_system/features/food_menu/presentation/layout_page/food_search_order.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/menu_tab_bar_widget.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/search_widget_tab.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';
import 'package:provider/provider.dart';

class FoodListTab extends StatefulWidget {
  final VoidCallback onRefresh;
  final int tableId;
  const FoodListTab(
      {super.key, required this.tableId, required this.onRefresh});

  @override
  State<FoodListTab> createState() => _FoodListTabState();
}

class _FoodListTabState extends State<FoodListTab> {
  @override
  void initState() {
    super.initState();
  }

  bool isTapped = false;
  SearchController searchController = SearchController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isTapped
        ? FoodSearchOrder(
            tableId: widget.tableId,
            onSearchTap: () {
              setState(() {
                isTapped = false;
              });
            },
            searchController: searchController)
        : FoodMenuCategories(
            tableId: widget.tableId,
            onSearchTap: () {
              widget.onRefresh();
              setState(() {
                isTapped = true;
              });
            },
            searchController: searchController);
  }
}
