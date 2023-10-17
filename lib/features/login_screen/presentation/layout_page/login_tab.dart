import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/login_screen/response/login_response.dart';
import 'package:kitwosd_restro_system/features/table_screen/presentation/table_view.dart';
import 'package:kitwosd_restro_system/widget/helper/validation.dart';

import '../../../../widget/snackbar.dart';
import '../../login_controller/login_controller.dart';
import '../../request/login_request.dart';

class LoginTabet extends StatefulWidget {
  const LoginTabet({super.key});

  @override
  State<LoginTabet> createState() => _LoginTabetState();
}

class _LoginTabetState extends State<LoginTabet> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool canLookPassword1 = false;
  bool obscure = true;
  final loginTabletKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SingleChildScrollView(
          child: Form(
            key: loginTabletKey,
            child: Column(
              children: [
                Center(
                  child: Container(
                      // height: 0.25
                      // width:0.25
                      height: 200.h,
                      width: 200.h,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/restro_kit-removebg-preview.png',
                              ),
                              fit: BoxFit.cover))),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Center(
                  child: Text(
                    'Welcome to Kitwosd Restro System',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 10.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                    child: Text(
                        'Enter your Phone number or Email address for sign in.Enjoy your food :)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0xff868686), fontSize: 4.sp))),
                SizedBox(
                  height: 25.w,
                ),
                SizedBox(
                    width: 400.h,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EMAIL ADDRESS',
                            style: TextStyle(
                                fontSize: 4.sp,
                                color: const Color(0xff868686),
                                fontWeight: FontWeight.w300),
                          ),
                          TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              return isEmpty(val) ?? isEmail(val!);
                            },
                          ),
                        ])),
                SizedBox(
                  height: 10.w,
                ),
                SizedBox(
                    width: 400.h,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('PASSWORD',
                              style: TextStyle(
                                  fontSize: 4.sp,
                                  color: const Color(0xff868686),
                                  fontWeight: FontWeight.w300)),
                          TextFormField(
                              controller: password,
                              obscureText: obscure,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (val) {
                                return isEmpty(val);
                              },
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      canLookPassword1 = !canLookPassword1;
                                      obscure = !obscure;
                                    });
                                  },
                                  child: canLookPassword1
                                      ? const Icon(Icons.visibility,
                                          color: Colors.black54)
                                      : const Icon(Icons.visibility_off,
                                          color: Colors.black54),
                                ),
                              )),
                        ])),
                SizedBox(
                  // height: 20,
                  height: 20.w,
                ),
                SizedBox(
                    // height: 24,
                    height: 24.w,
                    width: 400.h,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (loginTabletKey.currentState!.validate()) {
                          var res = await LoginController().getLogin(
                              loginRequestToJson(LoginRequest(
                                  email: email.text.trim(),
                                  password: password.text.trim())));
                          if (res is LoginResponse) {
                            if (!mounted) return;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const TableView()));
                          } else {
                            showSnackBar(
                                message: 'Invalid Credential', isError: true);
                          }
                        } else {
                          debugPrint('Invalid');
                        }
                      },
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color(0xffeea734))),
                      child: Center(
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 4.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

