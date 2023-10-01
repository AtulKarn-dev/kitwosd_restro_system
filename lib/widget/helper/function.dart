import 'package:flutter/widgets.dart';

String get _getDeviceType {
  final data = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single);
  return data.size.shortestSide < 550 ? 'phone' : 'tablet';
}

bool get isTablet {
  return _getDeviceType == 'tablet';
}
