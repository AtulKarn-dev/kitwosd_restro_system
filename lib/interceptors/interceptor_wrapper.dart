import 'package:dio/dio.dart';

class MyIntercepterWrapper {
  InterceptorsWrapper getWrapper(
      {String message =
          "Network is not available. Please check your internet and try again."}) {
    return InterceptorsWrapper(
      onError: (error, handler) {
        if (error.response == null) {
         
          // Do stuff here
          handler.reject(
              error); // Added this line to let error propagate outside the interceptor
        } else {
          
          handler.reject(error);
        }
      },
    );
  }
}
