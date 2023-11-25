import "package:dio/dio.dart";

class ServerException implements Exception {

  ServerException.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(dioException.response?.statusCode);
      case DioExceptionType.connectionTimeout:
        errorMessage = "Connection timed out.";
      case DioExceptionType.sendTimeout:
        errorMessage = "Request send timeout.";
      case DioExceptionType.badCertificate:
        errorMessage = "Incorrect certificate.";
      case DioExceptionType.cancel:
        errorMessage = "Request to the server was cancelled.";
      case DioExceptionType.connectionError:
        errorMessage = "Connection error.";
      case DioExceptionType.unknown:
        if (dioException.message!.contains("SocketException")) {
          errorMessage = "No Internet.";
          break;
        }
        errorMessage = "Unexpected error occurred.";
      case DioExceptionType.receiveTimeout:
        errorMessage = "Receiving timeout occurred.";
    }
  }

  late String errorMessage;

  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad request.";
      case 401:
        return "Authentication failure";
      case 403:
        return "User is not authorized to access API";
      case 404:
        return "Request resource does not exist";
      case 405:
        return "Operation not allowed";
      case 415:
        return "Media type unsupported";
      case 422:
        return "validation data failure";
      case 429:
        return "too much requests";
      case 500:
        return "Internal server error";
      case 503:
        return "Service unavailable";
      default:
        return "Oops something went wrong!";
    }
  }

  @override
  String toString() => errorMessage;
}
