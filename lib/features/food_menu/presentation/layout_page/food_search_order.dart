import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/food_menu_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_filter.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_filter_mobile.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_menu.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/search_widget_tab.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';
import 'package:kitwosd_restro_system/widget/ripple.dart';

class FoodSearchOrder extends StatefulWidget {
  final int tableId;
  final Function onBackTap;
  final TextEditingController searchController;

  const FoodSearchOrder(
      {super.key,
      required this.tableId,
      required this.onBackTap,
      required this.searchController});

  @override
  State<FoodSearchOrder> createState() => _FoodSearchOrderState();
}

class _FoodSearchOrderState extends State<FoodSearchOrder> {
  bool showCrossIcon = false;

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
                      onPressed: () {
                        WidgetsBinding.instance.focusManager.primaryFocus
                            ?.unfocus();
                        widget.onBackTap();
                      },
                      style: ButtonStyle(
                        iconSize: MaterialStateProperty.all(25.r),
                        visualDensity:
                            !isTablet ? VisualDensity(horizontal: 1.w) : null,
                      ),
                    )),
                SearchBar(
                  controller: widget.searchController,
                  constraints: isTablet
                      ? BoxConstraints(minHeight: 45.h, maxWidth: 255.w)
                      : BoxConstraints(maxWidth: 240.w, minHeight: 45.h),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(isTablet ? 10 : 8.r))),
                  leading: Icon(
                    Icons.search,
                    color: const Color(0xff868686),
                    size: isTablet ? 24.r : null,
                  ),
                  onChanged: (value) {
                    setState(() {
                      showCrossIcon = value.isNotEmpty;
                    });
                  },
                  trailing: showCrossIcon
                      ? [
                          IconButton(
                              onPressed: () {
                                widget.searchController.clear();
                                setState(() {
                                  showCrossIcon = false;
                                });
                              },
                              icon: Icon(
                                Icons.close,
                                size: 24.h,
                                color: Colors.black.withOpacity(0.6),
                              ))
                        ]
                      : null,
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                      horizontal: isTablet ? 80.h : 10.h,
                      vertical: isTablet ? double.infinity : 5.w)),
                ),
                isTablet
                    ? Container(
                        height: 45.w,
                        width: 45.w,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                            'assets/images/restro_kit-removebg-preview.png',
                          ),
                        )))
                    : Ripple(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FoodFilterMobile()));
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          padding: EdgeInsets.zero,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffeea734),
                          ),
                          child: const Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ]),
              isTablet
                  ? searchWidget(context)
                  : FutureBuilder<List<FoodItem>?>(
                      future: FoodMenuController().getMenuSearchItems(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<FoodItem> data = snapshot.data!;
                          return FoodMenu(mainFoodList: data);
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
            ],
          ),
        ),
      )),
    );
  }
}
