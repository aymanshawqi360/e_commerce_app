import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/api_consumer.dart';
import 'package:e_commerce_app/core/networking/base_url.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory extends ApiConsumer {
  final Dio dio;

  DioFactory({required this.dio}) {
    final time = const Duration(seconds: 30);
    dio.options = BaseOptions(
      baseUrl: BaseUrl.baseUrl,
      connectTimeout: time,
      receiveTimeout: time,
      //  headers: {'Content-Type': 'application/json'},
    );

    dio.interceptors.addAll([
      PrettyDioLogger(
        request: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
      // ApiInterceptorsWrapper(dio: dio),
    ]);
  }

  @override
  Future<Response> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await dio.post(path, data: body);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParametes,
  }) async {
    try {
      final result = await dio.get(path, queryParameters: queryParametes);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
