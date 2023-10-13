import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//  import 'package:kitwosd_restro_system/features/login_screen/presentation/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/provider/food_order_provider.dart';
import 'package:kitwosd_restro_system/features/provider/item_count_provider.dart';
// import 'package:kitwosd_restro_system/features/food_orders.dart';
// import 'package:kitwosd_restro_system/features/food_list.dart';
//  import 'package:kitwosd_restro_system/features/search_page_tab.dart';
import 'package:kitwosd_restro_system/features/splash_screen/splash_screen_page.dart';
import 'package:provider/provider.dart';
// import 'package:kitwosd_restro_system/widget/food_search_tablet.dart';
//  import 'package:kitwosd_restro_system/table_room.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FoodOrderProvider()),
          ChangeNotifierProvider(create: (context) => ItemCountProvider())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            progressIndicatorTheme:
                const ProgressIndicatorThemeData(color: Color(0xffeea734)),
            textTheme:
                GoogleFonts.yaldeviTextTheme(Theme.of(context).textTheme),
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xffeea734)),
            useMaterial3: true,
          ),
          home: const SplashScreenPage(),
        ),
      ),
      splitScreenMode: true,
      minTextAdapt: true,
    );
  }
}
