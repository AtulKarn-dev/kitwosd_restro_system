import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

class AddOnsWidget extends StatefulWidget {
  final String title;
  final String price;
  late bool selectedValue;
  AddOnsWidget(
      {super.key,
      required this.title,
      required this.price,
      required this.selectedValue});

  @override
  State<AddOnsWidget> createState() => _AddOnsWidgetState();
}

class _AddOnsWidgetState extends State<AddOnsWidget> {
  @override
  Widget build(BuildContext context) {
    return isTablet
        ? CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: const Color(0xffeea734),
            side: const BorderSide(color: Color(0xffeea734)),
            value: widget.selectedValue,
            onChanged: (newValue) {
              setState(() {
                widget.selectedValue = newValue!;
              });
            },
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 5.sp),
            ),
            subtitle: Text('(+Rs.${widget.price})',
                style: const TextStyle(
                    color: Color(0xffeea734), fontWeight: FontWeight.bold)),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize: 12.sp),
              ),
              Text(
                '(+Rs.${widget.price})',
                style: const TextStyle(color: Color(0xffeea734)),
              ),
              Checkbox(
                side: const BorderSide(color: Color(0xffeea734)),
                activeColor: const Color(0xffeea734),
                value: widget.selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    widget.selectedValue = newValue!;
                  });
                },
              )
            ],
          );
  }
}
