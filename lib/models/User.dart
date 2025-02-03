import 'dart:convert';

class User {
  final String id;
  final String fullName;
  final String email;
  final String password;
  final String token;
  User(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.password,
      required this.token});

  Map<String, dynamic> tomap() {
    return <String, dynamic>{
      "id": id,
      "fullName": fullName,
      "email": email,
      "password": password,
      "token": token
    };
  }

  String tojson() => jsonEncode(tomap());

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map["_id"] as String? ?? "",
        fullName: map["fullName"] as String? ?? "",
        email: map["email"] as String? ?? "",
        password: map["password"] as String? ?? "",
        token: map["token"] as String? ?? "");
  }
  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
