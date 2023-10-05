import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/food_menu_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_menu.dart';

class MenuTabBarWidget extends StatefulWidget {
  final List<String> categories;
  const MenuTabBarWidget({super.key, required this.categories});

  @override
  State<MenuTabBarWidget> createState() => _MenuTabBarWidgetState();
}

class _MenuTabBarWidgetState extends State<MenuTabBarWidget>
    with TickerProviderStateMixin {
  //  List<String> categories = ['Beef & Lamb', 'Seafood', 'Appetizers', 'Dim Sum'];
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: widget.categories.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // FoodOrderProvider provider = context.read<FoodOrderProvider>();
   
   List<String> categories = widget.categories;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: TabBar(
              indicatorColor: const Color(0xffeea734),
              controller: tabController,
              isScrollable: true,
              labelColor: const Color(0xff010F07),
              unselectedLabelColor: const Color(0xff010F07).withOpacity(0.5),
              tabs: List.generate(
                  categories.length,
                  (index) => Tab(
                        child: Text(
                          categories[index],
                          style: TextStyle(fontSize: 8.sp),
                        ),
                      ))),
        ),
        SizedBox(
          height: 520,
          child: Row(
            children: [
              Expanded(
                child: FutureBuilder<List<Burger>?>(
                  future: FoodMenuController().getMenuList(),
                  builder:(context, snapshot) {
                    if(snapshot.hasData){
                      List<Burger>? data = snapshot.data!;
                    return TabBarView(
                      controller: tabController,
                      children: List.generate(categories.length, (index) => FoodMenu(mainFoodList:data)));
                   }
                   else {
                    return const Center(child: CircularProgressIndicator());
                   }}, 
                ),
              ),
              const VerticalDivider(
                thickness: 4,
                color: Colors.grey,
              ),
              const Expanded(child: Text('data')),
            ],
          ),
        ),
      ],
    );
  }
}
