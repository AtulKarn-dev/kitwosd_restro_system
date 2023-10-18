import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/presentation/food_list.dart';

class FloatingButtonTab extends StatefulWidget {
  const FloatingButtonTab({super.key});

  @override
  State<FloatingButtonTab> createState() => _FloatingButtonTabState();
}

class _FloatingButtonTabState extends State<FloatingButtonTab> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FoodList()));
        },
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 231, 62, 118),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 50,
        ));
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
