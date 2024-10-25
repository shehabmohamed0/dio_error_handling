class User {
  final String id;

  User({required this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
    );
  }
}
