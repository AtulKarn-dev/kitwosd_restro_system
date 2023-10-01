import 'package:flutter/cupertino.dart';

class ServerException implements Exception {
  gotException(String message) {
    debugPrint(message);
  }
}

class CacheException implements Exception {}

class ApiException implements Exception {}
