import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;
  final SearchController? searchController;
  final VoidCallback? onTap;
  final Function(String)? onChange;

  const SearchWidget(
      {super.key, required this.hintText, this.searchController, this.onTap, this.onChange});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: searchController,
      onTap: onTap,
      onChanged: onChange,
      elevation: MaterialStateProperty.all(1),
      constraints: BoxConstraints(minHeight: 45.h, maxWidth: 255.w),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      leading: Icon(
        Icons.search,
        color: const Color(0xff868686),
        size: 24.r,
      ),
      hintText: hintText,
      padding:
          MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 80.h)),
      hintStyle: MaterialStateProperty.all(
          TextStyle(fontSize: 6.sp, color: const Color(0xff949494))),
    );
  }
}
