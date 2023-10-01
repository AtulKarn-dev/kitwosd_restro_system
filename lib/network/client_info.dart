import 'dart:io';

import 'package:dio/dio.dart';

import '../interceptors/interceptor_wrapper.dart';
import '../storage/secure_storage.dart';
import '../widget/helper/constant.dart';

Future<Dio> getDioWithToken() async {
  String? token = await SecureStorage().readData(storageToken);
  Dio dio = getDio();
  dio.options.headers['authorization'] = 'Bearer $token';

  return dio;
}

Dio getDio() {
  final Dio dio = Dio(BaseOptions(
    baseUrl: '$restroApi/',
    connectTimeout:  const Duration(seconds: 50000 ),
    receiveTimeout:  const Duration(seconds: 50000 ),
  ));

  dio.options.headers['content_type'] = 'application/json';
  dio.options.headers['accept'] = 'application/json';
  dio.options.headers[HttpHeaders.acceptEncodingHeader] = "*";
  dio.interceptors.add(LogInterceptor());

  dio.interceptors.add(MyIntercepterWrapper().getWrapper());
  return dio;
}
