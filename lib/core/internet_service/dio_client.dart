import "package:dio/dio.dart";
import "urls.dart";


class DioClient {
  DioClient()
      : _dio = Dio(BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 60),
            receiveTimeout: const Duration(seconds: 60),
            headers: {"Login": "narisuemvse", "Password": "!by123narisuemvse" }
  ));

  late final Dio _dio;

  // POST METHOD
  Future<Response<dynamic>> post(
      String url, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final Response<dynamic> response = await _dio.post(
        url,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
