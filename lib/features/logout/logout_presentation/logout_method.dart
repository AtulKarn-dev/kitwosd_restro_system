import 'package:flutter/material.dart';
import 'package:kitwosd_restro_system/features/logout/logout_models/data/request.dart';
import 'package:kitwosd_restro_system/features/logout/logout_models/data/response.dart';
import 'package:kitwosd_restro_system/features/logout/logout_models/logout_controller.dart';
import 'package:kitwosd_restro_system/storage/secure_storage.dart';
import 'package:kitwosd_restro_system/widget/helper/constant.dart';
import 'package:kitwosd_restro_system/widget/snackbar.dart';

void logOut(BuildContext context) async {
  SecureStorage storage = SecureStorage();
  String userIdString = await storage.readData(storageUserId) ?? "";
  int? userId = int.tryParse(userIdString);
  if (!context.mounted) return;
  if (userId == null) {
    ScaffoldMessenger.of(context).showSnackBar(showSnackBar(message: 'Invalid Credential', isError: true));
    return;
  }
  var res = await LogoutController()
      .getLogout(logOutRequestToJson(LogOutRequest(userId: userId)));
  if (res is LogOutResponse) {
    if (!context.mounted) return;
      storage.deleteAll();
    Navigator.of(context).pushReplacementNamed("/login");
  }
}