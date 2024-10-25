class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
