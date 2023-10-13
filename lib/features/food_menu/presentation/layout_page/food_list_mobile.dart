import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_filter.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_menu.dart';

import '../../../../widget/ripple.dart';

class FoodListMobile extends StatefulWidget {
  const FoodListMobile({super.key});

  @override
  State<FoodListMobile> createState() => _FoodListMobileState();
}

class _FoodListMobileState extends State<FoodListMobile>
    with TickerProviderStateMixin {
  List<String> categories = ['Beef & Lamb', 'Seafood', 'Appetizers', 'Dim Sum'];
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  bool iconShow = false;
  bool isTapped = false;
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(color: Color(0xffeea734)),
                    child: BackButton(
                      color: Colors.white,
                      onPressed: isTapped
                          ? () {
                              WidgetsBinding.instance.focusManager.primaryFocus
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
                          visualDensity: VisualDensity(horizontal: 1.w)),
                    )),
                isTapped
                    ? SearchBar(
                        controller: text1,
                        onTap: () {},
                        constraints: BoxConstraints(maxWidth: 240.w),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r))),
                        leading: const Icon(
                          Icons.search,
                          color: Color(0xff868686),
                        ),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              iconShow = false;
                            });
                          } else {
                            setState(() {
                              iconShow = true;
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
                                      });
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.black.withOpacity(0.6),
                                    ))
                              ]
                            : null,
                      )
                    : SearchBar(
                        controller: text2,
                        onTap: () {
                          setState(() {
                            isTapped = true;
                            iconShow = false;
                          });
                          text1.clear();
                        },
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.only(left: 20.w)),
                        leading: Icon(
                          Icons.search,
                          color: const Color(0xff868686),
                          size: 20.r,
                        ),
                        hintText: 'search on foodly',
                        hintStyle: MaterialStateProperty.all(TextStyle(
                            color: const Color(0xff949494), fontSize: 14.sp)),
                        elevation: const MaterialStatePropertyAll(1),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r))),
                        constraints: BoxConstraints(maxWidth: 290.w),
                      ),
                if (isTapped == true)
                  Ripple(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FoodFilter()));
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
                  )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            isTapped
                ? FoodMenu(
                    mainFoodList: [],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: TabBar(
                            indicatorColor: const Color(0xffeea734),
                            controller: tabController,
                            isScrollable: true,
                            labelColor: const Color(0xff010F07),
                            unselectedLabelColor:
                                const Color(0xff010F07).withOpacity(0.5),
                            tabs: List.generate(
                                categories.length,
                                (index) => Tab(
                                      child: Text(categories[index]),
                                    ))),
                      ),
                      SizedBox(
                          height: 620,
                          child: TabBarView(
                            controller: tabController,
                            children: List.generate(
                                4,
                                (index) => FoodMenu(
                                      mainFoodList: const [],
                                    )),
                          ))
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}


