import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/food_menu_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/drop_down_widget.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

class VariantWidget extends StatefulWidget {
  final FoodItem foodItem;
  int? selectedVariant;
  double? variantPrice;

  VariantWidget(
      {super.key,
      required this.foodItem,
      });

  @override
  State<VariantWidget> createState() => _VariantWidgetState();
}

class _VariantWidgetState extends State<VariantWidget> {
  Future<List<Addon>?> getVariants() {
    // FoodItem item = widget.provider.getItem(widget.foodId, widget.isSearching);
    return FoodMenuController().getVariants(widget.foodItem.categories.name, widget.foodItem.id);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Variants',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: isTablet ? 5.sp : 10.sp),
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
                widget.selectedVariant = selectedValue;
                String currentPrice = data[0].currentPrice;
                widget.variantPrice = double.parse(currentPrice);
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
                      onTap: (variantId, variantPrice) {
                        widget.selectedVariant = variantId;
                        widget.variantPrice = variantPrice;
                      },
                      data: data,
                    ),
                  ),
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
