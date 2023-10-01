import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widget/helper/function.dart';
import 'dialog_box.dart';

class FoodMenu extends StatefulWidget {
  List<FoodItem> mainFoodList = [];
  bool isSearching = false;

  FoodMenu({super.key, required this.mainFoodList, this.isSearching = false});

  @override
  FoodMenuState createState() => FoodMenuState();
}

class FoodMenuState extends State<FoodMenu> {
  @override
  Widget build(BuildContext context) {
    if (widget.mainFoodList.isEmpty) {
      return Center(
          child: Text(
        'No Result Found',
        style: TextStyle(fontSize: 8.sp),
      ));
    } else {
      return Padding(
          padding: EdgeInsets.all(8.r),
          child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(
                    color: Colors.grey,
                  ),
              itemCount: widget.mainFoodList.length,
              itemBuilder: (context, index) {
                FoodItem foodItem = widget.mainFoodList[index];
                int id = index;
                return ListTile(
                  dense: true,
                  visualDensity: const VisualDensity(vertical: 4),
                  leading: Container(
                      width: isTablet ? 100.h : 80.h,
                      height: isTablet ? 100.w : 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                            image: AssetImage(
                              foodItem.image!,
                            ),
                            fit: BoxFit.fill),
                      )),
                  title: Text(foodItem.title!,
                      style: TextStyle(
                        color: const Color(0xff020f06),
                        fontWeight: FontWeight.w300,
                        fontSize: isTablet ? 8.sp : 12.sp,
                      )),
                  subtitle: Text(
                    foodItem.subtitle!,
                    style: TextStyle(
                        color: const Color(0xff868686),
                        fontWeight: FontWeight.w400,
                        fontSize: isTablet ? 4.sp : 10.sp),
                  ),
                  trailing: Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                    ),
                    child: Column(
                      children: [
                        Text(
                          foodItem.price!,
                          style: TextStyle(
                              fontSize: isTablet ? 4.sp : 10.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff6f7773)),
                        ),
                        Expanded(
                          child: TextButton(
                              onPressed: () {
                                dialogBox(context, id, widget.isSearching);
                              },
                              child: const Text(
                                'Add Item',
                                style: TextStyle(
                                    color: Color(0xffF8B64C),
                                    fontWeight: FontWeight.w800),
                              )),
                        )
                      ],
                    ),
                  ),
                );
              }));
    }
  }
}

class FoodItem {
  String? title;
  String? subtitle;
  String? image;
  String? price;
  FoodItem(this.title, this.subtitle, this.price, this.image);
}
