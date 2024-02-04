import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController? searchController;
  final VoidCallback? onTap;
  final Function(String)? onChange;

  const SearchWidget(
      {super.key,
      required this.hintText,
      this.searchController,
      this.onTap,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: searchController,
      onTap: onTap,
      onChanged: onChange,
      elevation: MaterialStateProperty.all(1),
      constraints: isTablet
          ? BoxConstraints(minHeight: 45.h, maxWidth: 255.w)
          : BoxConstraints(maxWidth: 280.w, minHeight: 45.h),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isTablet ? 10 : 8.r))),
      leading: Icon(
        Icons.search,
        color: const Color(0xff868686),
        size: isTablet ? 24.r : 20.r,
      ),
      hintText: hintText,
      padding: MaterialStateProperty.all(isTablet
          ? EdgeInsets.symmetric(horizontal: 80.h)
          : EdgeInsets.only(left: 20.w)),
      hintStyle: MaterialStateProperty.all(TextStyle(
          fontSize: isTablet ? 6.sp : 14.sp, color: const Color(0xff949494))),
    );
  }
}
