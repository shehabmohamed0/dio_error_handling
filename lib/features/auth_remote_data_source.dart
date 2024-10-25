import 'package:dio_error_handling/core/network/base_consumer.dart';
import 'package:dio_error_handling/features/models/user.dart';

import 'models/params/login_params.dart';


/*
هنا احنا هنعمل طبعا dependency injection لل DioConsumer
وتستخدمه هنا انا مش هخوض فالتفاصيل دى 
لو حصل هنا exception 
انت طبعا هتهندله فال provider او ال bloc او ال viewmodel اللى بتستخدمه
وتاخد ال AppException وتعرضها للمستخدم بالطريقة اللى تحبها
 */

class AuthRemoteDataSource {
  const AuthRemoteDataSource(this._consumer);
  final BaseConsumer _consumer;

  Future<User> login(LoginParams params) async {
    final response = await _consumer.post(
      '/login',
      data: params.toJson(),
    );

    return User.fromJson(response.data);
  }
}
