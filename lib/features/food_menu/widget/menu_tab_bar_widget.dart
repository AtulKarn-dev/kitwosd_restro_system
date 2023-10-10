import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/food_menu_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_menu.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/order_status_tile.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';
import 'package:provider/provider.dart';

class MenuTabBarWidget extends StatefulWidget {
  final List<String> categories;
  const MenuTabBarWidget({super.key, required this.categories});

  @override
  State<MenuTabBarWidget> createState() => _MenuTabBarWidgetState();
}

class _MenuTabBarWidgetState extends State<MenuTabBarWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: widget.categories.length, vsync: this);
    currentIndex = tabController.index;
    tabController.addListener(() {
      // Reset previous food list
      FoodOrderProvider.loadFoodList([]);
      setState(() {
        currentIndex = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                          style: TextStyle(fontSize: 7.sp),
                        ),
                      ))),
        ),
        SizedBox(
          height: 520,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FutureBuilder<List<FoodItem>>(
                  future: FoodMenuController()
                      .getMenuList(widget.categories[currentIndex]),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          List<FoodItem> data = snapshot.data!;
                          FoodOrderProvider.loadFoodList(data);
                          return TabBarView(
                              controller: tabController,
                              children: List.generate(categories.length,
                                  (index) => FoodMenu(mainFoodList: data)));
                        }
                    }
                  },
                ),
              ),
              Expanded(
                  child: Consumer<FoodOrderProvider>(
                builder: (context, provider, child) => ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      FoodItem item = provider.mainFoodList[index];
                      return OrderStatusTile(
                        sn: index + 1,
                        title: item.title,
                        index: index,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 4.w,
                      );
                    },
                    itemCount: provider.mainFoodList.length),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
