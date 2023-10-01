import 'dart:io';

import '../widget/toast.dart';

class ValidationException extends HttpException {
  final Map? errors;

  const ValidationException(this.errors, String message, {Uri? uri})
      : super(message, uri: uri);
}

void showErrorFromServer(Map errors) {
  String message = errors[errors.keys.first][0];
  Toast.show(text: message);
}
