import 'package:flutter/cupertino.dart';

isEmpty(value, {bool short = false, Function? onNull}) {
  debugPrint(value);
  if (value == null || value.isEmpty) {
    if (short) {
      return "Required";
    }
    return 'The field is required.';
  }
  if (onNull != null) {
    onNull();
  }
  return null;
}

checkPassword(value) {
  if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(value)) {
    return 'Invalid Password. Password must contain atleast one upper case, one lower case, one digit and one special characters';
  }
  return null;
}

isEmail(String value, {bool short = false}) {
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) return 'The email is invalid.';
  return null;
}