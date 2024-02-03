import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/add_item_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/request/add_item_request.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/add_item_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/addons_list.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/quantity_widget.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/variant_widget.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

class FoodItemDialogWidget extends StatefulWidget {
  const FoodItemDialogWidget(
      {super.key,
      required this.foodItem,
      required this.tableId,
      required this.onAddItem});

  final int tableId;
  final FoodItem foodItem;
  final Function(AddItemResponse) onAddItem;

  @override
  State<FoodItemDialogWidget> createState() => _FoodItemDialogState();
}

class _FoodItemDialogState extends State<FoodItemDialogWidget> {
  int? itemCount;
  @override
  Widget build(BuildContext context) {
    VariantWidget variantWidget = VariantWidget(
      foodItem: widget.foodItem,
    );

    AddOnsList addOnsList = AddOnsList(
        foodItem: widget.foodItem,
        );

    return SizedBox(
      height: isTablet ? 140.w : 320.w,
      width: isTablet ? 120.w : 250.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          variantWidget,
          SizedBox(
            height: 3.w,
          ),
          QuantityWidget(
            onTap: (count) => itemCount = count,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Extra/Specials/Add ons/Side Dishes/Toppings',
            style: TextStyle(
                fontSize: isTablet ? 5.sp : 12.sp, color: Colors.black),
          ),
          addOnsList,
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
                    var item = await AddItemController().addItem(
                        addItemRequestToJson(AddItemRequest(
                            itemId: widget.foodItem.id,
                            variantId: variantWidget.selectedVariant!,
                            status: 'pending',
                            quantity: itemCount ?? 1,
                            price: totalPrice(variantWidget.variantPrice!,
                                addOnsList.selectedPrice),
                            addons: addOnsList.selectedIds)),
                        widget.tableId);

                    if (item != null) {
                      widget.onAddItem(item);
                    }

                    if (!mounted) return;
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

  double totalPrice(double variantPrice, List<double> addOnsPrice) {
    double extraPrice = 0;
    var sumPrice = 0.0;
    for (double price in addOnsPrice) {
      extraPrice = extraPrice + price;
    }
    sumPrice =
        (double.parse(widget.foodItem.currentPrice) + variantPrice + extraPrice) * (itemCount ?? 1);
    return sumPrice;
  }
}
