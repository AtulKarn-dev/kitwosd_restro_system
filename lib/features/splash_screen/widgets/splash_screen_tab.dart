
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashForTablet extends StatefulWidget {
  const SplashForTablet({super.key});

  @override
  State<SplashForTablet> createState() => _SplashForTabletState();
}

class _SplashForTabletState extends State<SplashForTablet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/restro_kit-removebg-preview.png',
              height: 200.w,
              width: 800.h,
            ),
            const Text('version v0.0.1',style: TextStyle(color:Color(0xffF8B64C)))
          ]),
    );
  }
}