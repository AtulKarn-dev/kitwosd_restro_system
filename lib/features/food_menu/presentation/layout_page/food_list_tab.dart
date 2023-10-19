import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/food_menu_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/menu_tab_bar_widget.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_menu.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/search_widget_tab.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';
import 'package:provider/provider.dart';

class FoodListTab extends StatefulWidget {
  final int id;
  const FoodListTab({
    super.key,required this.id
  });

  @override
  State<FoodListTab> createState() => _FoodListTabState();
}

class _FoodListTabState extends State<FoodListTab> {
  late FoodMenu menu;

  @override
  void initState() {
    super.initState();
    menu =
        FoodMenu(mainFoodList: context.read<FoodOrderProvider>().displayList);
  }

  bool iconShow = false;
  bool isTapped = false;
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodOrderProvider>(
      builder: (context, provider, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 45.h,
                      height: 45.h,
                      alignment: Alignment.centerRight,
                      decoration: const BoxDecoration(color: Color(0xffeea734)),
                      child: BackButton(
                        color: Colors.white,
                        onPressed: isTapped
                            ? () {
                                WidgetsBinding
                                    .instance.focusManager.primaryFocus
                                    ?.unfocus();
                                setState(() {
                                  isTapped = false;
                                });
                              }
                            : () {
                                Navigator.of(context).pop();
                              },
                        style: ButtonStyle(
                          iconSize: MaterialStateProperty.all(25.r),
                        ),
                      )),
                  isTapped
                      ? SearchBar(
                          controller: text1,
                          constraints:
                              BoxConstraints(minHeight: 45.h, maxWidth: 255.w),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          leading: Icon(
                            Icons.search,
                            color: const Color(0xff868686),
                            size: 24.r,
                          ),
                          onChanged: (value) {
                            if (value.isEmpty) {
                              setState(() {
                                iconShow = false;
                                provider.filterItems(null);
                                menu = FoodMenu(
                                    mainFoodList: provider.displayList);
                              });
                            } else {
                              setState(() {
                                iconShow = true;

                                provider.filterItems(value);
                                menu = FoodMenu(
                                  mainFoodList: provider.displayList,
                                  isSearching: true,
                                );
                              });
                            }
                          },
                          trailing: iconShow
                              ? [
                                  IconButton(
                                      onPressed: () {
                                        text1.clear();
                                        setState(() {
                                          iconShow = false;
                                          provider.displayList =
                                              FoodOrderProvider.showingList;
                                          menu = FoodMenu(
                                              mainFoodList:
                                                  provider.displayList);
                                        });
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        size: 24.h,
                                        color: Colors.black.withOpacity(0.6),
                                      ))
                                ]
                              : null,
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 80.h)),
                        )
                      : SearchBar(
                          controller: text2,
                          onTap: () {
                            setState(() {
                              isTapped = true;
                              iconShow = false;
                              provider.displayList =
                                  FoodOrderProvider.showingList;
                              menu =
                                  FoodMenu(mainFoodList: provider.displayList);
                            });
                            text1.clear();
                          },
                          elevation: MaterialStateProperty.all(1),
                          constraints:
                              BoxConstraints(minHeight: 45.h, maxWidth: 255.w),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          leading: Icon(
                            Icons.search,
                            color: const Color(0xff868686),
                            size: 24.r,
                          ),
                          hintText: 'Search on foodly',
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 80.h)),
                          hintStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 6.sp, color: const Color(0xff949494))),
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
                ],
              ),
              isTapped
                  ? searchWidget(context, menu, provider.displayList)
                  : FutureBuilder<List<String>?>(
                      future: FoodMenuController().getMenuCategories(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<String> data = snapshot.data!;
                          return MenuTabBarWidget(categories: data,id: widget.id,);
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
