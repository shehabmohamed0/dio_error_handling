import '../models/custom_response.dart';

abstract interface class BaseConsumer {
  Future<CustomResponse<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<CustomResponse<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<CustomResponse<T>> put<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<CustomResponse<T>> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  });
}
