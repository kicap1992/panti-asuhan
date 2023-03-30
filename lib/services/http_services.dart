import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyHttpServices {
  final _options = BaseOptions(
    baseUrl: dotenv.env['api_url']!,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );

  late Dio _dio;

  MyHttpServices() {
    _dio = Dio(_options);
  }

  Future<Response> get(String path) async {
    try {
      return await _dio.get(path);
    } on DioError {
      rethrow;
    }
  }

  Future<Response> postWithFormData(String path, FormData formData) async {
    try {
      return await _dio.post(path, data: formData);
    } on DioError {
      rethrow;
    }
  }
}
