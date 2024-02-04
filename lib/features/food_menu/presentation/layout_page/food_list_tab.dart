import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/features/food_menu/presentation/layout_page/food_menu_categories.dart';
import 'package:kitwosd_restro_system/features/food_menu/presentation/layout_page/food_search_order.dart';

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
  TextEditingController searchController = TextEditingController();
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
            onRefreshTap: (){
              widget.onRefresh();
            },
            onSearchTap: () {
              setState(() {
                isTapped = true;
              });
            },
            searchController: searchController);
  }
}
