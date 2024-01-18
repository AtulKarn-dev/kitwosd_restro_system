import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/add_item_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/request/add_item_request.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/addons_list.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/quantity_widget.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/variant_widget.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';
import 'package:kitwosd_restro_system/features/table_screen/controller/table_room_controller.dart';
import 'package:kitwosd_restro_system/features/table_screen/response/table_room_response.dart';
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isTablet ? 140.w : 320.w,
      width: isTablet ? 120.w : 250.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VariantWidget(
              foodId: widget.foodId,
              isSearching: widget.isSearching,
              provider: widget.provider),
          SizedBox(
            height: 3.w,
          ),
          const QuantityWidget(),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Extra/Specials/Add ons/Side Dishes/Toppings',
            style: TextStyle(
                fontSize: isTablet ? 5.sp : 12.sp, color: Colors.black),
          ),
          AddOnsList(
              foodId: widget.foodId,
              isSearching: widget.isSearching,
              provider: widget.provider),
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
                  onPressed: () async {
                    await AddItemController().getItem(
                        addItemRequestToJson(AddItemRequest(
                            itemId: 1,
                            variantId: 69,
                            status: 'pending',
                            quantity: 2,
                            price: 300,
                            addons: [1, 10])),
                        13);

                    if (!mounted) return;
                    Navigator.pop(context);

                    // widget.provider.addItem(widget.foodId, widget.isSearching);
                    // context.read<ItemCountProvider>().count(itemCount);
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
