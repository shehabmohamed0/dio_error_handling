import 'package:dio/dio.dart';
import 'package:dio_error_handling/core/error/network_exception_type.dart';
import 'app_exception.dart';
import 'error_response.dart';

class DioErrorHandler {
  const DioErrorHandler();

  static AppException handle(dynamic e) {
    if (e is DioException) {
      return _handleDioError(e);
    } else {
      return const NetworkException(
        type: NetworkExceptionType.unknown,
      );
    }
  }

  static AppException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.badResponse:
        return _dioBadResponseExceptionToAppException(error);
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          type: NetworkExceptionType.connectionTimeout,
          code: error.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return const NetworkException(type: NetworkExceptionType.cancel);
      case DioExceptionType.connectionError:
        return const NetworkException(
          type: NetworkExceptionType.noInternetConnection,
        );
      case DioExceptionType.badCertificate:
        return const NetworkException(
            type: NetworkExceptionType.badCertificate);
      case DioExceptionType.unknown:
        return const NetworkException(type: NetworkExceptionType.unknown);
    }
  }

  static NetworkException _dioBadResponseExceptionToAppException(
      DioException error) {
    final statusCode = error.response?.statusCode;
    return switch (statusCode) {
      // we handle internal server error and bad gateway and service
      // unavailable because in some cases the backend might not handle it
      // and we want to inform the user about the issue not just return an
      // unknown error

      /*internal server error*/ 500 ||
      /*bad gateway*/ 502 =>
        const NetworkException(type: NetworkExceptionType.internal),
      /*service unavailable*/ 503 =>
        const NetworkException(type: NetworkExceptionType.serviceUnavailable),
      _ => _backendErrorResponseToAppException(error)
    };
  }

  static NetworkException _backendErrorResponseToAppException(
      DioException error) {
    return error.response != null
        ? NetworkException(
            type: NetworkExceptionType.backend,
            code: error.response!.statusCode,
            message: ErrorResponse.fromJson(
              error.response!.data as Map<String, dynamic>,
            ).message,
          )
        : const NetworkException(type: NetworkExceptionType.unknown);
  }
}
