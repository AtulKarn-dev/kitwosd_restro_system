import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_menu.dart';
import 'package:kitwosd_restro_system/widget/ripple.dart';
import '../../../widget/my_chip.dart';

String selectedCategories = 'all';
String selectedDietary = 'any';
String? price;

StatefulBuilder searchWidget(
    BuildContext context, FoodMenu menu, List<FoodItem> items) {
  final List<String> entries = ['\$', '\$\$', '\$\$\$', '\$\$\$\$'];
  List<String?> priceRange = ['1', '2', '3', '4'];
  return StatefulBuilder(builder: (context, setState) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .60,
              child: menu,
            )),
        SizedBox(
          width: 20.h,
        ),
        Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filters',
                  style: TextStyle(
                      fontSize: 8.sp,
                      color: const Color(0xff010F07),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'CATEGORIES',
                      style: TextStyle(
                          fontSize: 6.sp,
                          color: const Color(0xff454f49),
                          fontWeight: FontWeight.w300),
                    ),
                    Ripple(
                        onTap: () {
                          setState(() {
                            selectedCategories = 'all';
                            setState(() {
                              menu = FoodMenu(mainFoodList: items);
                            });
                          });
                        },
                        child: Text(
                          'CLEAR ALL',
                          style: TextStyle(
                              fontSize: 4.sp,
                              color: const Color(0xff999f9b),
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
                SizedBox(
                  height: 2.w,
                ),
                Wrap(
                  spacing: 3.w,
                  runSpacing: 1.w,
                  children: [
                    MyChip(
                      text: 'ALL',
                      textColor: getTextColorCategories('all'),
                      backgroundColor: getBackgroundColorCategories('all'),
                      onTap: () {
                        setState(() {
                          selectedCategories = 'all';
                        });
                      },
                    ),
                    MyChip(
                        text: 'BRUNCH',
                        textColor: getTextColorCategories('br'),
                        backgroundColor: getBackgroundColorCategories('br'),
                        onTap: () {
                          setState(() {
                            selectedCategories = 'br';
                          });
                        }),
                    MyChip(
                        text: 'DINNER',
                        textColor: getTextColorCategories('d'),
                        backgroundColor: getBackgroundColorCategories('d'),
                        onTap: () {
                          setState(() {
                            selectedCategories = 'd';
                          });
                        }),
                    MyChip(
                        text: 'BURGERS',
                        textColor: getTextColorCategories('b'),
                        backgroundColor: getBackgroundColorCategories('b'),
                        onTap: () {
                          setState(() => selectedCategories = 'b');
                        }),
                    MyChip(
                        text: 'CHINESE',
                        textColor: getTextColorCategories('c'),
                        backgroundColor: getBackgroundColorCategories('c'),
                        onTap: () {
                          setState(() {
                            selectedCategories = 'c';
                          });
                        }),
                    MyChip(
                        text: 'PIZZA',
                        textColor: getTextColorCategories('p'),
                        backgroundColor: getBackgroundColorCategories('p'),
                        onTap: () {
                          setState(() {
                            selectedCategories = 'p';
                          });
                        }),
                    MyChip(
                        text: 'SALADS',
                        textColor: getTextColorCategories('s'),
                        backgroundColor: getBackgroundColorCategories('s'),
                        onTap: () {
                          setState(() {
                            selectedCategories = 's';
                          });
                        }),
                    MyChip(
                        text: 'SOUPS',
                        textColor: getTextColorCategories('sp'),
                        backgroundColor: getBackgroundColorCategories('sp'),
                        onTap: () {
                          setState(() {
                            selectedCategories = 'sp';
                          });
                        }),
                    MyChip(
                        text: 'BREAKFAST',
                        textColor: getTextColorCategories('brk'),
                        backgroundColor: getBackgroundColorCategories('brk'),
                        onTap: () {
                          setState(() {
                            selectedCategories = 'brk';
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: 4.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'DIETARY',
                      style: TextStyle(
                          fontSize: 6.sp,
                          color: const Color(0xff454f49),
                          fontWeight: FontWeight.w300),
                    ),
                    Ripple(
                        onTap: () {
                          setState(() {
                            selectedDietary = 'any';
                          });
                        },
                        child: Text(
                          'CLEAR ALL',
                          style: TextStyle(
                              fontSize: 4.sp,
                              color: const Color(0xff999f9b),
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
                SizedBox(
                  height: 2.w,
                ),
                Wrap(
                  spacing: 2.w,
                  runSpacing: 2.w,
                  children: [
                    MyChip(
                      text: 'ANY',
                      textColor: getTextColorDietry('any'),
                      backgroundColor: getBackgroundColorDietry('any'),
                      onTap: () {
                        setState(() {
                          selectedDietary = 'any';
                        });
                      },
                    ),
                    MyChip(
                        text: 'VEGETERIAN',
                        textColor: getTextColorDietry('v'),
                        backgroundColor: getBackgroundColorDietry('v'),
                        onTap: () {
                          setState(() {
                            selectedDietary = 'v';
                          });
                        }),
                    MyChip(
                        text: 'VEGAN',
                        textColor: getTextColorDietry('vn'),
                        backgroundColor: getBackgroundColorDietry('vn'),
                        onTap: () {
                          setState(() {
                            selectedDietary = 'vn';
                          });
                        }),
                    MyChip(
                        text: 'NON-VEG',
                        textColor: getTextColorDietry('g'),
                        backgroundColor: getBackgroundColorDietry('g'),
                        onTap: () {
                          setState(() {
                            selectedDietary = 'g';
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: 4.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PRICE RANGE',
                      style: TextStyle(
                          fontSize: 6.sp,
                          color: const Color(0xff454f49),
                          fontWeight: FontWeight.w300),
                    ),
                    Ripple(
                        onTap: () {
                          setState(() {
                            price = null;
                          });
                        },
                        child: Text(
                          'CLEAR ALL',
                          style: TextStyle(
                              fontSize: 4.sp,
                              color: const Color(0xff999f9b),
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
                SizedBox(
                  height: 2.w,
                ),
                SizedBox(
                  height: 20.w,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 5.h,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: entries.length,
                    itemBuilder: (context, index) {
                      return Ripple(
                        onTap: () {
                          setState(() {
                            price = priceRange[index];
                          });
                        },
                        child: CircleAvatar(
                          radius: 20.r,
                          // ignore: dead_code
                          backgroundColor:
                              getBackgroundColorPrice(priceRange[index]),
                          foregroundColor: getTextColorPrice(priceRange[index]),
                          child: Text(
                            entries[index],
                            style: TextStyle(
                                fontSize: 4.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                MyChip(
                    onTap: () {
                      if (selectedCategories == 'c') {
                        if (selectedDietary == 'g') {
                          setState(() {
                            // menu = FoodMenu(mainFoodList: );
                          });
                        } else {
                          setState(() {
                            menu = FoodMenu(mainFoodList: items);
                          });
                        }
                      } else {
                        setState(() {
                          menu = FoodMenu(mainFoodList: items);
                        });
                      }
                    },
                    text: 'APPLY FILTERS',
                    edgeInsets:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 4.w),
                    textColor: Colors.white,
                    backgroundColor: const Color(0xffF8B64C)),
              ],
            ))
      ],
    );
  });
}

Color getTextColorCategories(String text) {
  if (selectedCategories == text) {
    return const Color(0xfff1f1f1);
  } else {
    return const Color(0xff6f7773);
  }
}

Color getBackgroundColorCategories(String text) {
  if (selectedCategories == text) {
    return const Color(0xffF8B64C);
  } else {
    return const Color(0xfff1f1f1);
  }
}

Color getTextColorDietry(String text) {
  if (selectedDietary == text) {
    return const Color(0xfff1f1f1);
  } else {
    return const Color(0xff6f7773);
  }
}

Color getBackgroundColorDietry(String text) {
  if (selectedDietary == text) {
    return const Color(0xffF8B64C);
  } else {
    return const Color(0xfff1f1f1);
  }
}

Color getTextColorPrice(String? text) {
  if (price == text) {
    return const Color(0xfff1f1f1);
  } else {
    return const Color(0xff6f7773);
  }
}

Color getBackgroundColorPrice(String? text) {
  if (price == text) {
    return const Color(0xffF8B64C);
  } else {
    return const Color(0xfff1f1f1);
  }
}