import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';
import 'package:provider/provider.dart';

class DropdownWidget extends StatefulWidget {
  int selectedValue;
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
          iconSize: 30,
          iconEnabledColor: const Color(0xffeea734),
          isDense: true,
          value: widget.selectedValue,
          items: variants(widget.data),
          onChanged: (value) {
            setState(() {
              widget.selectedValue = value!;
              context.read<FoodOrderProvider>().getVariant();
            });
          }),
    );
  }
}

List<DropdownMenuItem<int>>? variants(List<Addon> variantItems) {
  List<DropdownMenuItem<int>> variants = [];
  for (Addon items in variantItems) {
    variants.add(DropdownMenuItem(
      value: items.id,
      child: Text(
        '${items.title}: \nRs. ${items.currentPrice}',
        style: TextStyle(fontSize: isTablet ? 4.sp : 10.sp),
      ),
    ));
  }
  return variants;
}
