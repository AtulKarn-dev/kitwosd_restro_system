import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/logout/logout_presentation/logout_method.dart';

Widget alertDialog(BuildContext context) {
  return AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    title: const Center(
      child: Text(
        'Log Out',
      ),
    ),
    titleTextStyle: TextStyle(fontSize: 8.sp, color: Colors.black),
    content: SizedBox(
      width: 300.h,
      height: 150.h,
      child: const Center(
        child: Text(
          'Are You Sure You Want To\nLog Out?',
          textAlign: TextAlign.center,
        ),
      ),
    ),
    contentTextStyle: TextStyle(fontSize: 6.sp, color: Colors.black87),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'No',
            style: TextStyle(fontSize: 8.sp),
          )),
      SizedBox(
        width: 12.w,
      ),
      TextButton(
          onPressed: () {
            logOut(context);
          },
          child: Text(
            'Yes',
            style: TextStyle(fontSize: 8.sp),
          )),
    ],
  );
}
