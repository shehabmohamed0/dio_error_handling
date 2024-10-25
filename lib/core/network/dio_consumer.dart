import 'package:dio/dio.dart';
import 'package:dio_error_handling/core/error/dio_error_handler.dart';

import '../models/custom_response.dart';
import 'base_consumer.dart';

class DioConsumer implements BaseConsumer {
  const DioConsumer(this.dio);
  final Dio dio;

  @override
  Future<CustomResponse<T>> delete<T>(String path,
      {Map<String, dynamic>? queryParameters, Object? data}) {
    return _errorHandlerTryCatch(() async {
      final response = await dio.delete<T>(
        path,
        queryParameters: queryParameters,
        data: data,
      );
      return CustomResponse<T>(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    });
  }

  // هنا احنا بنعمل تراي كاتش للفانكشن اللي هتتنفذ
  @override
  Future<CustomResponse<T>> get<T>(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) {
    return _errorHandlerTryCatch(() async {
      final response = await dio.get<T>(
        path,
        queryParameters: queryParameters,
      );
      return CustomResponse<T>(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    });
  }

  @override
  Future<CustomResponse<T>> post<T>(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) {
    return _errorHandlerTryCatch(() async {
      final response = await dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return CustomResponse<T>(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    });
  }

  @override
  Future<CustomResponse<T>> put<T>(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) {
    return _errorHandlerTryCatch(() async {
      final response = await dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return CustomResponse<T>(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    });
  }
}

// هنا احنا عملنا بناخد الفانكشن اللي هتتنفذ ونحاول نعمل لها تراي كاتش
// ونرمي الايرور اللي هيحصل للدالة اللي هتعالج الايرورات
// اى كان نوعها ايه احنا هنعمل لها هاندل
Future<T> _errorHandlerTryCatch<T>(Future<T> Function() function) async {
  try {
    return await function();
  } catch (e) {
    throw DioErrorHandler.handle(e);
  }
}
