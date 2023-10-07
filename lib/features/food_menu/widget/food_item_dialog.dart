import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/food_menu_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/drop_down_widget.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

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
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;

  Future<List<Addon>?> getVariants() {
    FoodItem item = widget.provider.getItem(widget.foodId, widget.isSearching);
    return FoodMenuController().getVariants(item.categories.name, item.id);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isTablet ? 140.w : 320.w,
      width: isTablet ? 120.w : 250.w,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Variants',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isTablet ? 5.sp : 10.sp),
                ),
                SizedBox(
                  height: 4.w,
                ),
                Container(
                  height: 25.h,
                  padding: EdgeInsets.only(left: 3.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: FutureBuilder<List<Addon>?>(
                    future: getVariants(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Addon> data = snapshot.data!;
                        int selectedValue = data[0].id;
                        return DropdownWidget(
                          selectedValue: selectedValue,
                          data: data,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                )
              ]),
              Column(
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
                        width: 30.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                            child: Text(
                          itemCount.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Extra/Specials/Add ons/Side Dishes/Toppings',
            style: TextStyle(
                fontSize: isTablet ? 5.sp : 12.sp,
                color: const Color(0xff69716d)),
          ),
          isTablet
              ? CheckboxListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
                  activeColor: const Color(0xffeea734),
                  side: const BorderSide(color: Color(0xffeea734)),
                  value: isSelected1,
                  onChanged: (newValue) {
                    setState(() {
                      isSelected1 = newValue!;
                    });
                  },
                  title: Text.rich(TextSpan(
                      text: 'Add an extra cheese',
                      style: TextStyle(fontSize: 5.sp),
                      children: [
                        WidgetSpan(
                            child: SizedBox(
                          width: 40.w,
                        )),
                        const TextSpan(
                            text: '(+Rs.120)',
                            style: TextStyle(color: Color(0xffeea734)))
                      ])),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add an extra cheese',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    const Text(
                      '(+Rs.120)',
                      style: TextStyle(color: Color(0xffeea734)),
                    ),
                    Checkbox(
                      side: const BorderSide(color: Color(0xffeea734)),
                      activeColor: const Color(0xffeea734),
                      value: isSelected1,
                      onChanged: (newValue) {
                        setState(() {
                          isSelected1 = newValue!;
                        });
                      },
                    )
                  ],
                ),
          isTablet
              ? CheckboxListTile(
                  side: const BorderSide(color: Color(0xffeea734)),
                  activeColor: const Color(0xffeea734),
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
                  value: isSelected2,
                  onChanged: (newValue) {
                    setState(() {
                      isSelected2 = newValue!;
                    });
                  },
                  title: Text(
                    'Extra Spicy',
                    style: TextStyle(fontSize: 5.sp),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Extra Spicy',
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                    Checkbox(
                      side: const BorderSide(color: Color(0xffeea734)),
                      activeColor: const Color(0xffeea734),
                      value: isSelected2,
                      onChanged: (newValue) {
                        setState(() {
                          isSelected2 = newValue!;
                        });
                      },
                    )
                  ],
                ),
          isTablet
              ? CheckboxListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
                  activeColor: const Color(0xffeea734),
                  side: const BorderSide(color: Color(0xffeea734)),
                  value: isSelected3,
                  onChanged: (newValue) {
                    setState(() {
                      isSelected3 = newValue!;
                    });
                  },
                  title: Text.rich(TextSpan(
                      text: 'Potato Chips On Side',
                      style: TextStyle(fontSize: 5.sp),
                      children: [
                        WidgetSpan(
                            child: SizedBox(
                          width: 36.w,
                        )),
                        const TextSpan(
                            text: '(+Rs.120)',
                            style: TextStyle(color: Color(0xffeea734)))
                      ])),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Potato Chips On Side',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    const Text(
                      '(+Rs.120)',
                      style: TextStyle(color: Color(0xffeea734)),
                    ),
                    Checkbox(
                      side: const BorderSide(color: Color(0xffeea734)),
                      activeColor: const Color(0xffeea734),
                      value: isSelected3,
                      onChanged: (newValue) {
                        setState(() {
                          isSelected3 = newValue!;
                        });
                      },
                    )
                  ],
                ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: isTablet ? 5.sp : 12.sp),
              ),
              Text(
                'Rs.00',
                style: TextStyle(fontSize: isTablet ? 5.sp : 12.sp),
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
