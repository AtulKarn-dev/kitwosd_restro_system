import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/search_widget_tab.dart';

class FoodSearchOrder extends StatefulWidget {
  final int tableId;
  final Function onSearchTap;
  final SearchController searchController;

  const FoodSearchOrder(
      {super.key,
      required this.tableId,
      required this.onSearchTap,
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
                        widget.onSearchTap();
                      },
                      style: ButtonStyle(
                        iconSize: MaterialStateProperty.all(25.r),
                      ),
                    )),
                SearchBar(
                  controller: widget.searchController,
                  constraints: BoxConstraints(minHeight: 45.h, maxWidth: 255.w),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  leading: Icon(
                    Icons.search,
                    color: const Color(0xff868686),
                    size: 24.r,
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
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 80.h)),
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
              searchWidget(context)
            ],
          ),
        ),
      )),
    );
  }
}
