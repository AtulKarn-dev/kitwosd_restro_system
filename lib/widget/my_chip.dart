import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';
import 'package:kitwosd_restro_system/widget/ripple.dart';

class MyChip extends StatefulWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Function onTap;
  final EdgeInsets? edgeInsets;
  final OutlinedBorder shape;
  final double? fontsize;

  const MyChip(
      {super.key,
      required this.text,
      required this.onTap,
      this.edgeInsets,
      this.textColor = const Color(0xff6f7773),
      this.backgroundColor = const Color(0xfff1f1f1),
      this.shape = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      this.fontsize = 12});

  @override
  State<MyChip> createState() => _MyChipState();
}

class _MyChipState extends State<MyChip> {
  @override
  Widget build(BuildContext context) {
    return Ripple(
      onTap: () {
        widget.onTap();
      },
      child: Chip(
          shape: widget.shape,
          side: BorderSide.none,
          label: Text(
            widget.text,
            style: TextStyle(
                fontSize: isTablet ? 4.sp : widget.fontsize,
                fontWeight: FontWeight.w700,
                color: widget.textColor),
          ),
          labelPadding: widget.edgeInsets,
          backgroundColor: widget.backgroundColor),
    );
  }
}
