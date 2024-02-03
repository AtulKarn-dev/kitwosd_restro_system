import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/food_menu_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/menu_tab_bar_widget.dart';
import 'package:kitwosd_restro_system/features/food_orders/widget/search_widget.dart';

class FoodMenuCategories extends StatefulWidget {
  final int tableId;
  final Function onSearchTap;
  final SearchController searchController;

  const FoodMenuCategories({super.key, required this.tableId, required this.onSearchTap, required this.searchController});

  @override
  State<FoodMenuCategories> createState() => _FoodMenuCategoriesState();
}

class _FoodMenuCategoriesState extends State<FoodMenuCategories> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                    width: 45.h,
                    height: 45.h,
                    alignment: Alignment.centerRight,
                    decoration: const BoxDecoration(color: Color(0xffeea734)),
                    child: BackButton(
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                      style: ButtonStyle(
                        iconSize: MaterialStateProperty.all(25.r),
                      ),
                    )),
                SearchWidget(
                  hintText: 'Search on foodly',
                  searchController: widget.searchController
                  ),
                Container(
                    height: 45.w,
                    width: 45.w,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        'assets/images/restro_kit-removebg-preview.png',
                      ),
                    ))),
              ]),
              FutureBuilder<List<String>?>(
                future: FoodMenuController().getMenuCategories(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<String> data = snapshot.data!;
                    return MenuTabBarWidget(
                      categories: data,
                      tableId: widget.tableId,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
