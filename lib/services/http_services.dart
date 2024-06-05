import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../app/app.logger.dart';

class MyHttpServices {
  final log = getLogger('MyHttpServices');
  final _options = BaseOptions(
    baseUrl: dotenv.env['api_url']!,
    connectTimeout: const Duration(seconds: 120),
    receiveTimeout: const Duration(seconds: 120),
  );

  late Dio _dio;

  MyHttpServices() {
    _dio = Dio(_options);
  }

  Future<Response> get(String path) async {
    try {
      return await _dio.get(path);
    } on DioError catch (e) {
      log.e(e.message);
      log.e(e.response);
      rethrow;
    }
  }

  Future<Response> postWithFormData(String path, FormData formData) async {
    try {
      return await _dio.post(path, data: formData);
    } on DioError catch (e) {
      log.e(e.message);
      log.e(e.response!.statusCode);
      log.e(e.response!.statusMessage);
      rethrow;
    }
  }

  // // delete
  // Future<Response> delete(String path, FormData data) async {
  //   try {
  //     // log.i('path: $path');
  //     return await _dio.delete(
  //       path,
  //       data: data,
  //       // encoding: Encoding.getByName('utf-8'),
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/x-www-form-urlencoded',
  //         },
  //       ),
  //     );
  //   } on DioError catch (e) {
  //     log.e(e.message);
  //     log.e(e.response);
  //     rethrow;
  //   }
  // }
}
