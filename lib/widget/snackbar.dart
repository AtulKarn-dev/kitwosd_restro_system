import 'package:flutter/material.dart';

SnackBar showSnackBar({bool isError = false, required String message}) {
  return SnackBar(
    content: Text(message),
    backgroundColor: isError ? const Color(0xff710000) : Colors.green,
  );
}
