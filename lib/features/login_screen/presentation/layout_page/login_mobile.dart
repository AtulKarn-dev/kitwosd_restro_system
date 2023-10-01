import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitwosd_restro_system/features/table_screen/presentation/table_view.dart';
import 'package:kitwosd_restro_system/widget/helper/validation.dart';

import '../../../../widget/snackbar.dart';
import '../../login_controller/login_controller.dart';
import '../../request/login_request.dart';
import '../../response/login_response.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool canLookPassword1 = false;
  bool obscure = true;
  final _registerKey = GlobalKey<FormState>();

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
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SingleChildScrollView(
          child: Form(
            key: _registerKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                      height: 0.25.sh,
                      width: 0.25.sh,
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
                      color: const Color(0xff010F07),
                      fontWeight: FontWeight.w100,
                      fontSize: 30.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Center(
                    child: Text(
                        'Enter your Phone number or Email address for sign in.Enjoy your food :)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0xff868686),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w100))),
                SizedBox(
                  height: 50.w,
                ),
                SizedBox(
                  width: 270.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'EMAIL ADDRESS',
                        style: TextStyle(
                            fontSize: 12.sp,
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.w,
                ),
                SizedBox(
                  width: 270.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('PASSWORD',
                          style: TextStyle(
                              fontSize: 12.sp,
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.w,
                ),
                SizedBox(
                    height: 60.w,
                    width: 270.h,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_registerKey.currentState!.validate()) {
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
                                  borderRadius: BorderRadius.circular(10.h))),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color(0xffeea734))),
                      child: Center(
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
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
