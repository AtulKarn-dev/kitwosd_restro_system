import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_filter.dart';

class FoodFilterMobile extends StatefulWidget {
  const FoodFilterMobile({super.key});

  @override
  State<FoodFilterMobile> createState() => _FoodFilterMobileState();
}

class _FoodFilterMobileState extends State<FoodFilterMobile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: FoodFilter()),
    );
  }
}