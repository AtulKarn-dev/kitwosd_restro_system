import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/features/login_screen/presentation/login_page.dart';
import 'package:kitwosd_restro_system/features/splash_screen/widgets/splash_screen_mobile.dart';
import 'package:kitwosd_restro_system/features/splash_screen/widgets/splash_screen_tab.dart';
import '../../widget/helper/function.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      // IsFirstRun.reset();
      if (!mounted) return;
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: ( (context) => const LoginPage())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: isTablet
            ? const SplashForTablet()
            : const SplashForMobile());
  }
}

