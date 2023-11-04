import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_menu.dart';
import 'package:kitwosd_restro_system/widget/my_chip.dart';
import 'package:kitwosd_restro_system/widget/ripple.dart';

enum FoodItemCategory {
  all,
  brunch,
  dinner,
  burgers,
  chinese,
  pizza,
  salads,
  soups,
  breakfast;

  String get value {
    switch (this) {
      case FoodItemCategory.all:
        return "all";
      case FoodItemCategory.brunch:
        return "br";
      case FoodItemCategory.dinner:
        return "d";
      case FoodItemCategory.burgers:
        return "b";
      case FoodItemCategory.chinese:
        return "c";
      case FoodItemCategory.pizza:
        return "p";
      case FoodItemCategory.salads:
        return "s";
      case FoodItemCategory.soups:
        return "sp";
      case FoodItemCategory.breakfast:
        return "brk";
    }
  }

  String get title {
    switch (this) {
      case FoodItemCategory.all:
        return "ALL";
      case FoodItemCategory.brunch:
        return "BRUNCH";
      case FoodItemCategory.dinner:
        return "DINNER";
      case FoodItemCategory.burgers:
        return "BURGERS";
      case FoodItemCategory.chinese:
        return "CHINESE";
      case FoodItemCategory.pizza:
        return "PIZZA";
      case FoodItemCategory.salads:
        return "SALADS";
      case FoodItemCategory.soups:
        return "SOUPS";
      case FoodItemCategory.breakfast:
        return "BREAKFAST";
    }
  }
}

enum FoodItemDietary {
  any,
  vegetarian,
  vegan,
  nonVeg;

  String get value {
    switch (this) {
      case FoodItemDietary.any:
        return 'ANY';
      case FoodItemDietary.vegetarian:
        return 'VEGETARIAN';
      case FoodItemDietary.vegan:
        return 'VEGAN';
      case FoodItemDietary.nonVeg:
        return 'NON-VEG';
    }
  }

  String get title {
    switch (this) {
      case FoodItemDietary.any:
        return 'ANY';
      case FoodItemDietary.vegetarian:
        return 'VEGETARIAN';
      case FoodItemDietary.vegan:
        return 'VEGAN';
      case FoodItemDietary.nonVeg:
        return 'NON-VEG';
    }
  }
}

enum FoodItemPrice {
  $,
  $$,
  $$$,
  $$$$;

  String get title {
    switch (this) {
      case FoodItemPrice.$:
        return '\$';
      case FoodItemPrice.$$:
        return '\$\$';
      case FoodItemPrice.$$$:
        return '\$\$\$';
      case FoodItemPrice.$$$$:
        return '\$\$\$\$';
    }
  }
}

class FoodSearchWidget extends StatefulWidget {
  const FoodSearchWidget({super.key, required this.foodItems});

  final List<FoodItem> foodItems;

  @override
  State<FoodSearchWidget> createState() => _FoodSearchWidgetState();
}

class _FoodSearchWidgetState extends State<FoodSearchWidget> {
  FoodItemCategory? selectedCategory;
  FoodItemDietary? selectedDietary;
  FoodItemPrice? selectedPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .60,
              child: FoodMenu(mainFoodList: widget.foodItems),
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
                            selectedCategory = FoodItemCategory.all;
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
                  children:
                      List.generate(FoodItemCategory.values.length, (index) {
                    FoodItemCategory category = FoodItemCategory.values[index];
                    return MyChip(
                      text: category.title,
                      textColor: category == selectedCategory
                          ? const Color(0xfff1f1f1)
                          : const Color(0xff6f7773),
                      backgroundColor: category == selectedCategory
                          ? const Color(0xffF8B64C)
                          : const Color(0xfff1f1f1),
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    );
                  }),
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
                            selectedDietary = FoodItemDietary.any;
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
                  children:
                      List.generate(FoodItemDietary.values.length, (index) {
                    FoodItemDietary dietary = FoodItemDietary.values[index];
                    return MyChip(
                      text: dietary.title,
                      textColor: dietary == selectedDietary
                          ? const Color(0xfff1f1f1)
                          : const Color(0xff6f7773),
                      backgroundColor: dietary == selectedDietary
                          ? const Color(0xffF8B64C)
                          : const Color(0xfff1f1f1),
                      onTap: () {
                        setState(() {
                          selectedDietary = dietary;
                        });
                      },
                    );
                  }),
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
                            selectedPrice = null;
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
                    itemCount: FoodItemPrice.values.length,
                    itemBuilder: (context, index) {
                      FoodItemPrice price = FoodItemPrice.values[index];
                      return Ripple(
                        onTap: () {
                          setState(() {
                            selectedPrice = price;
                          });
                        },
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor:price == selectedPrice
                            ? const Color(0xffF8B64C)
                            : const Color(0xfff1f1f1),         
                          foregroundColor: price == selectedPrice
                            ? const Color(0xfff1f1f1)
                            : const Color(0xff6f7773),
                          child: Text(
                            price.title,
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
                    onTap: () {},
                    text: 'APPLY FILTERS',
                    edgeInsets:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 4.w),
                    textColor: Colors.white,
                    backgroundColor: const Color(0xffF8B64C)),
              ],
            ))
      ],
    );
  }
}
