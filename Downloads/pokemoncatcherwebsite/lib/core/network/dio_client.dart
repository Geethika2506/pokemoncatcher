import 'package:dio/dio.dart';
import '../constants/api_endpoints.dart';

class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Accept': 'application/json'},
      ),
    );

    // Optional: log in debug
    // dio.interceptors.add(LogInterceptor(responseBody: true));

    return dio;
  }
}
