import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/features/food_orders/presentation/layout_page/food_orders_mobile.dart';
import 'package:kitwosd_restro_system/features/food_orders/presentation/layout_page/food_orders_tab.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

class FoodOrders extends StatefulWidget {
  const FoodOrders({super.key});

  @override
  State<FoodOrders> createState() => _FoodOrdersState();
}

class _FoodOrdersState extends State<FoodOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isTablet ? const FoodOrdersTab() : const FoodOrdersMobile(),
      floatingActionButton:
          isTablet ? const FloatingButtonTab() : const FloatingButtonMobile(),
    );
  }
}
