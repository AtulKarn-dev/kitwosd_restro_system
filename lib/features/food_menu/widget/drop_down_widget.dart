import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

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

List<DropdownMenuItem<int>>? variants(List<Addon> variantItems) {
  List<DropdownMenuItem<int>> variants = [];
  for (Addon items in variantItems) {
    variants.add(DropdownMenuItem(
      value: items.id,
      child: Text(
        '${items.title}:  Rs. ${items.currentPrice}',
        style: TextStyle(fontSize: isTablet ? 4.sp : 10.sp),
      ),
    ));
  }
  return variants;
}
