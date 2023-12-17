import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/food_menu_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/addon_widget.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/drop_down_widget.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';
import 'package:kitwosd_restro_system/features/provider/item_count_provider.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';
import 'package:provider/provider.dart';

class FoodItemDialogWidget extends StatefulWidget {
  const FoodItemDialogWidget(
      {super.key,
      required this.foodId,
      required this.isSearching,
      required this.provider});

  final int foodId;
  final bool isSearching;
  final FoodOrderProvider provider;

  @override
  State<FoodItemDialogWidget> createState() => _FoodItemDialogState();
}

class _FoodItemDialogState extends State<FoodItemDialogWidget> {
  int itemCount = 1;

  Future<List<Addon>?> getVariants() {
    FoodItem item = widget.provider.getItem(widget.foodId, widget.isSearching);
    return FoodMenuController().getVariants(item.categories.name, item.id);
  }

  Future<List<Addon>?> getAddons() {
    FoodItem item = widget.provider.getItem(widget.foodId, widget.isSearching);
    return FoodMenuController().getAddons(item.categories.name, item.id);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isTablet ? 140.w : 320.w,
      width: isTablet ? 120.w : 250.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Variants',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: isTablet ? 5.sp : 10.sp),
              ),
              FutureBuilder<List<Addon>?>(
                future: getVariants(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Addon> data = snapshot.data!;
                    if (data.isEmpty) {
                      return const Text('No Variants Found!');
                    } else {
                      int selectedValue = data[0].id;
                      return Container(
                          width: 85.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: DropdownWidget(
                              selectedValue: selectedValue,
                              data: data,
                            ),
                          ));
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: 3.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quantity',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: isTablet ? 5.sp : 10.sp),
              ),
              Row(
                children: [
                  itemCount != 1
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              itemCount--;
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            size: 20.r,
                          ))
                      : IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.remove,
                            size: 20.r,
                          )),
                  Container(
                    width: 60.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                        child: Text(
                      itemCount.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 6.sp),
                    )),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          itemCount++;
                        });
                      },
                      icon: Icon(
                        Icons.add,
                        size: 20.r,
                      )),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Extra/Specials/Add ons/Side Dishes/Toppings',
            style: TextStyle(
                fontSize: isTablet ? 5.sp : 12.sp, color: Colors.black),
          ),
          FutureBuilder<List<Addon>?>(
            future: getAddons(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Addon> data = snapshot.data!;
                bool selectedValue = false;
                return Column(
                    children: List.generate(
                        data.length,
                        (index) => AddOnsWidget(
                              title: data[index].title,
                              price: data[index].currentPrice,
                              selectedValue: selectedValue,
                            )));
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: isTablet ? 8.sp : 12.sp),
              ),
              Text(
                'Rs.00',
                style: TextStyle(fontSize: isTablet ? 6.sp : 12.sp),
              )
            ],
          ),
          const Divider(),
          SizedBox(
            height: 10.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: isTablet ? 40.w : 100.w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xffeea734)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r)))),
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: isTablet ? 40.w : 100.w,
                child: ElevatedButton(
                  onPressed: () {
                    widget.provider.addItem(widget.foodId, widget.isSearching);
                    Navigator.pop(context);
                    context.read<ItemCountProvider>().count(itemCount);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xffeea734)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r)))),
                  child: const Text(
                    'ADD',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
