import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/food_menu_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/drop_down_widget.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

class VariantWidget extends StatefulWidget {
  final int foodId;
  final bool isSearching;
  final FoodOrderProvider provider;
  int? selectedVariant;

   VariantWidget(
      {super.key,
      required this.foodId,
      required this.isSearching,
      required this.provider});

  @override
  State<VariantWidget> createState() => _VariantWidgetState();
}

class _VariantWidgetState extends State<VariantWidget> {
  Future<List<Addon>?> getVariants() {
    FoodItem item = widget.provider.getItem(widget.foodId, widget.isSearching);
    return FoodMenuController().getVariants(item.categories.name, item.id);
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
                        onTap: (variantId)=> widget.selectedVariant = variantId,
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
    );
  }
}
