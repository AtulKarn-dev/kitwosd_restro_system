import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/features/food_orders/presentation/layout_page/food_orders_mobile.dart';
import 'package:kitwosd_restro_system/features/food_orders/presentation/layout_page/food_orders_tab.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

class FoodOrders extends StatefulWidget {
  final int id;
  const FoodOrders({super.key,required this.id});

  @override
  State<FoodOrders> createState() => _FoodOrdersState();
}

class _FoodOrdersState extends State<FoodOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isTablet ?  FoodOrdersTab(id: widget.id) : const FoodOrdersMobile(),
      floatingActionButton:
          isTablet ? const FloatingButtonTab() : const FloatingButtonMobile(),
    );
  }
}
