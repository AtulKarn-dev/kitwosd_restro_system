
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

class AddOnsWidget extends StatefulWidget {
  final Addon addOns;
  final Function(int?,double?) onTap;
  const AddOnsWidget({
    super.key,
    required this.addOns,
    required this.onTap,
  });

  @override
  State<AddOnsWidget> createState() => _AddOnsWidgetState();
}

class _AddOnsWidgetState extends State<AddOnsWidget> {
  bool isAddonSelected = false;

  @override
  Widget build(BuildContext context) {
    Addon addOns = widget.addOns;

    return isTablet
        ? CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: const Color(0xffeea734),
            side: const BorderSide(color: Color(0xffeea734)),
            value: isAddonSelected,
            onChanged: (newValue) {
              setState(() {
                isAddonSelected = newValue!;
                widget.onTap(isAddonSelected ? addOns.id : null, isAddonSelected? double.parse(addOns.currentPrice) : null);
              });
            },
            title: Text(
              addOns.title,
              style: TextStyle(fontSize: 5.sp),
            ),
            subtitle: Text('(+Rs.${addOns.currentPrice})',
                style: const TextStyle(
                    color: Color(0xffeea734), fontWeight: FontWeight.bold)),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                addOns.title,
                style: TextStyle(fontSize: 12.sp),
              ),
              Text(
                '(+Rs.${addOns.currentPrice})',
                style: const TextStyle(color: Color(0xffeea734)),
              ),
              Checkbox(
                side: const BorderSide(color: Color(0xffeea734)),
                activeColor: const Color(0xffeea734),
                value: isAddonSelected,
                onChanged: (newValue) {
                  setState(() {
                    isAddonSelected = newValue!;
                    widget.onTap(isAddonSelected ? addOns.id : null, isAddonSelected? double.parse(addOns.currentPrice) : null);
                  });
                },
              )
            ],
          );
  }
}
