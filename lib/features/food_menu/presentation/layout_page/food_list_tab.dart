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
  TextEditingController searchController1 = TextEditingController();
  TextEditingController searchController2 = TextEditingController();
  @override
  void dispose() {
    searchController1.dispose();
    searchController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isTapped
        ? FoodSearchOrder(
            tableId: widget.tableId,
            onBackTap: () {
              setState(() {
                isTapped = false;
              });
            },
            searchController: searchController1)
        : FoodMenuCategories(
            tableId: widget.tableId,
            onRefreshTap: () {
              widget.onRefresh();
            },
            onSearchTap: () {
              setState(() {
                isTapped = true;
              });
            },
            searchController: [searchController1,searchController2]);
  }
}
