import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_orders/presentation/food_orders.dart';

class TablesMobile extends StatefulWidget {
  const TablesMobile({super.key});

  @override
  State<TablesMobile> createState() => _TablesMobileState();
}

class _TablesMobileState extends State<TablesMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(12.r),
            child: GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              children: List.generate(16, (index) {
                return Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FoodOrders()));
                          },
                          icon: Image.asset(
                            'assets/images/table-removebg-preview.png',
                          )),
                    ),
                    Expanded(
                      child: Text(
                        'Table ${index + 1}',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                );
              }),
            )));
  }
}
