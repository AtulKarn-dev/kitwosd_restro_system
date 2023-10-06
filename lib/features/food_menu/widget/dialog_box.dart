import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/food_menu_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';
import 'package:provider/provider.dart';

Future dialogBox(BuildContext context, int id, bool isSearching) {
  int itemCount = 1;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Add Item',
            style: TextStyle(
                color: Color(0xffeea734), fontWeight: FontWeight.w600),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              ))
        ],
      ),
      content: StatefulBuilder(
        builder: (context, setState) => SizedBox(
          height: isTablet ? 140.w : 320.w,
          width: isTablet ? 120.w : 250.w,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            future: FoodMenuController().getVariants(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<Addon> data = snapshot.data!;
                                String selectedValue = data[0].id.toString();
                                return DropdownWidget(
                                  selectedValue: selectedValue,
                                  data: data,
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                        //  context.read<FoodOrderProvider>().cancelItem();
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Color(0xffeea734)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
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
                        context
                            .read<FoodOrderProvider>()
                            .addItem(id, isSearching);
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Color(0xffeea734)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
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
        ),
      ),
    ),
  );
}

class DropdownWidget extends StatefulWidget {
  late String selectedValue;
  final List<Addon> data;
  DropdownWidget({super.key, required this.selectedValue, required this.data});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
          isDense: true,
          value: widget.selectedValue,
          items: variants(widget.data),
          onChanged: (value) {
            setState(() {
              widget.selectedValue = value!;
            });
          }),
    );
  }
}

List<DropdownMenuItem<String>>? variants(List<Addon> variantItems) {
  List<DropdownMenuItem<String>> variants = [];
  for (Addon items in variantItems) {
    variants.add(DropdownMenuItem(
      value: items.id.toString(),
      child: Text(
        '${items.title}:  Rs. ${items.currentPrice}',
        style: TextStyle(fontSize: isTablet ? 4.sp : 10.sp),
      ),
    ));
  }
  return variants;
}
