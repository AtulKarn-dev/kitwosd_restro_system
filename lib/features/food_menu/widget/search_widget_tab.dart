import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/food_menu/controller/food_menu_controller.dart';
import 'package:kitwosd_restro_system/features/food_menu/response/food_menu_response.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_filter.dart';
import 'package:kitwosd_restro_system/features/food_menu/widget/food_menu.dart';

StatefulBuilder searchWidget(BuildContext context) {
  return StatefulBuilder(builder: (context, setState) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .60,
              child: FutureBuilder<List<FoodItem>?>(
                future: FoodMenuController().getMenuSearchItems(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<FoodItem> data = snapshot.data!;
                    // FoodOrderProvider.loadSearchList(data);
                    return FoodMenu(mainFoodList: data);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )),
        SizedBox(
          width: 20.h,
        ),
       const Expanded(
            flex: 2,
            child: FoodFilter()),
      ],
    );
  });
}
