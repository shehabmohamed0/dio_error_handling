import 'package:dio_error_handling/core/error/network_exception_type.dart';

sealed class AppException {
  final String message;
  final int? code;

  const AppException({required this.message, this.code});
}

class NetworkException extends AppException {
  final NetworkExceptionType type;
  const NetworkException({
    required this.type,
    super.message = 'Network Error',
    super.code,
  });
}

class CacheException extends AppException {
  const CacheException({
    super.message = 'Cache Error',
    super.code,
  });
}
