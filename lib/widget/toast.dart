import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as base_toast;

class Toast {
  static show({text = '', bool error = false}) {
    Color backgroundColor = Colors.white;
    Color textColor = Colors.white.withOpacity(0.8);
    if (error) {
      backgroundColor = Colors.red.withOpacity(0.3);
      textColor = Colors.red;
    }

    base_toast.Fluttertoast.showToast(
      msg: text,
      toastLength: base_toast.Toast.LENGTH_SHORT,
      gravity: base_toast.ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 14.0,
    );
  }
}
