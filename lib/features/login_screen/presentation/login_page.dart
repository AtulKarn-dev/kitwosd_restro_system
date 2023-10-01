import 'package:flutter/material.dart';

import 'package:kitwosd_restro_system/widget/helper/function.dart';
import 'package:kitwosd_restro_system/features/login_screen/presentation/layout_page/login_mobile.dart';
import 'package:kitwosd_restro_system/features/login_screen/presentation/layout_page/login_tab.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: isTablet? const LoginTabet() : const LoginMobile(),
    );
  }
}

