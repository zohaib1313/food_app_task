import "package:dio/dio.dart";

import 'ApiInterceptors.dart';

class ApiClient {
  static Dio getDio() {
    Dio _dio = new Dio();
    _dio.interceptors.add(new ApiInterceptors());
    _dio.unlock();
    return _dio;
  }
}
