
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashForMobile extends StatefulWidget {
  const SplashForMobile({super.key});

  @override
  State<SplashForMobile> createState() => _SplashForMobileState();
}

class _SplashForMobileState extends State<SplashForMobile> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/restro_kit-removebg-preview.png',
              height: 300.w,
              width: 1100.h,
            ),
            const Text('version v0.0.1',style: TextStyle(color:Color(0xffF8B64C)),)
          ]),
    );
  }
}