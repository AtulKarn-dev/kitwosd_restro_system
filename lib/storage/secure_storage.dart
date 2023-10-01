import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future writeData(String key, String value) async {

    var writeData = await _storage.write(key: key, value: value);
    if (kDebugMode) {
      debugPrint("${key}w:$value");
    }
    return writeData;
  }

  Future<String?> readData(String key) async {
    String? data = await _storage.read(key: key);

    return data;
  }

  Future deleteData(String key) async {
    var delete = await _storage.delete(key: key);
    return delete;
  }

  Future deleteAll() async {
    var delAll = await _storage.deleteAll();
    return delAll;
  }
}
