import "package:dio/dio.dart";
import "server_exception.dart";

Future<List<D>> getResponseFuncWrapper<D, T>({
  required Future<Response<dynamic>> Function() request,
  required T Function(Map<String, dynamic> json) fromJson,
  required D Function(T t) toD,
  required String dataKey,
}) async {
  try {
    final Response<dynamic> response = await request();
    if (response.statusCode == 200) {
      final List<D> data = (response.data[dataKey] as List).map((
          dynamic elt) =>
          toD(fromJson(elt as Map<String, dynamic>))).toList();
      return data;
    } else {
      throw ServerException.fromDioError(DioException.badResponse(
          statusCode: 1000,
          requestOptions: response.requestOptions,
          response: response)
      );
    }
  } on DioException catch (e) {
    throw ServerException.fromDioError(e);
  }
}
