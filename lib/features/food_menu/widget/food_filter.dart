import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/enum_filter.dart';
import 'package:kitwosd_restro_system/widget/my_chip.dart';
import 'package:kitwosd_restro_system/widget/ripple.dart';

class FoodFilter extends StatefulWidget {
  const FoodFilter({super.key});

  @override
  State<FoodFilter> createState() => _FoodFilterState();
}

class _FoodFilterState extends State<FoodFilter> {
  FoodItemCategory? selectedCategory;
  FoodItemDietary? selectedDietary;
  FoodItemPrice? selectedPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
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
          children: List.generate(FoodItemCategory.values.length, (index) {
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
          children: List.generate(FoodItemDietary.values.length, (index) {
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
                  backgroundColor: price == selectedPrice
                      ? const Color(0xffF8B64C)
                      : const Color(0xfff1f1f1),
                  foregroundColor: price == selectedPrice
                      ? const Color(0xfff1f1f1)
                      : const Color(0xff6f7773),
                  child: Text(
                    price.title,
                    style:
                        TextStyle(fontSize: 4.sp, fontWeight: FontWeight.w600),
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
            edgeInsets: EdgeInsets.symmetric(horizontal: 50.w, vertical: 4.w),
            textColor: Colors.white,
            backgroundColor: const Color(0xffF8B64C)),
      ],
    );
  }
}
