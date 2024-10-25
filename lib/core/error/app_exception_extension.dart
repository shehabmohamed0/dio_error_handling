import 'app_exception.dart';
import 'network_exception_type.dart';
/*
هنا انت هتاخد الايرور من ال 
bloc او ال provider او ال viewmodel
وتعرضه للمستخدم بالطريقة اللى تحبها
او تترجمه للغة اللى تحبها
شوف اخر بوست عندى للترجمة
 */
extension AppExceptionExtension on Object {
  String get errorMessage {
    final shadow = this;
    if (shadow is AppException) {
      return switch (shadow) {
        NetworkException e => e.networkErrorMessage(),
        CacheException e => e.cacheErrorMessage(),
      };
    }
    return 'Unknown error';
  }
}

extension NetworkExceptionExtension on NetworkException {
  String networkErrorMessage() {
    return switch (type) {
      NetworkExceptionType.connectionTimeout => 'Connection timeout',
      NetworkExceptionType.cancel => 'Request canceled',
      NetworkExceptionType.noInternetConnection => 'No internet connection',
      NetworkExceptionType.badCertificate => 'Bad certificate',
      NetworkExceptionType.unknown => 'Unknown error',
      NetworkExceptionType.internal => 'Internal server error',
      NetworkExceptionType.serviceUnavailable => 'Service unavailable',
      // TODO: Handle this case.
      NetworkExceptionType.backend => throw UnimplementedError(),
      // TODO: Handle this case.
      NetworkExceptionType.unauthorized => throw UnimplementedError(),
      // TODO: Handle this case.
      NetworkExceptionType.forbidden => throw UnimplementedError(),
      // TODO: Handle this case.
      NetworkExceptionType.notFound => throw UnimplementedError(),
      // TODO: Handle this case.
      NetworkExceptionType.conflict => throw UnimplementedError(),
      // TODO: Handle this case.
      NetworkExceptionType.timeOut => throw UnimplementedError(),
      // TODO: Handle this case.
      NetworkExceptionType.noInternet => throw UnimplementedError(),
      // TODO: Handle this case.
      NetworkExceptionType.success => throw UnimplementedError(),
      // TODO: Handle this case.
      NetworkExceptionType.noContent => throw UnimplementedError(),
      // TODO: Handle this case.
      NetworkExceptionType.badRequest => throw UnimplementedError(),
      // TODO: Handle this case.
      NetworkExceptionType.revieveTimeout => throw UnimplementedError(),
      // TODO: Handle this case.
      NetworkExceptionType.sendTimeout => throw UnimplementedError(),
    };
  }
}

extension CacheExceptionExtension on CacheException {
  String cacheErrorMessage() {
    return 'Cache error';
  }
}
