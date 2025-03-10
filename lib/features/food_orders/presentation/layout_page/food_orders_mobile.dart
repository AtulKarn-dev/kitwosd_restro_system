import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/presentation/food_list.dart';

class FoodOrdersMobile extends StatefulWidget {
  const FoodOrdersMobile({super.key});

  @override
  State<FoodOrdersMobile> createState() => _FoodOrdersMobileState();
}

class _FoodOrdersMobileState extends State<FoodOrdersMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(color: Color(0xffeea734)),
                    child: BackButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                          iconSize: MaterialStateProperty.all(25.r),
                          visualDensity: VisualDensity(horizontal: 1.w)),
                    )),
                Text(
                  'Table 1 Orders',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 20.h,
                  width: 60.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      border: Border.all(color: const Color(0xffF8B64C))),
                  child: Center(
                      child: Text(
                    'SEATED',
                    style: TextStyle(
                        color: const Color(0xffF8B64C),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600),
                  )),
                )
              ],
            ),
            Container(
              height: 250.h,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class FloatingButtonMobile extends StatefulWidget {
  const FloatingButtonMobile({super.key});

  @override
  State<FloatingButtonMobile> createState() => _FloatingButtonMobileState();
}

class _FloatingButtonMobileState extends State<FloatingButtonMobile> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FoodList()));
        },
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 231, 62, 118),
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          size: 25.r,
        ));
  }
}
