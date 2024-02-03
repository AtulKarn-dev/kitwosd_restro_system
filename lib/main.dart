import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/splash_screen/splash_screen_page.dart';
import 'package:kitwosd_restro_system/widget/helper/function.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (isTablet) {
    // check if its bigger
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
  } else {
    // otherwise will be ..
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
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
      splitScreenMode: true,
      minTextAdapt: true,
    );
  }
}
