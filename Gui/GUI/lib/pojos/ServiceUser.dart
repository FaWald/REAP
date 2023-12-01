import 'dart:convert';

class User {
  late String username;
  late String password;
  late String role;
  late String selfHref;

  User({
    required this.username,
    required this.password,
    required this.role,
    required this.selfHref,
  });

  // Named constructor for creating an instance from JSON
  User.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  // Factory method to create a list of User objects from the JSON response body
  static List<User> fromJsonList(String responseBody) {
    final List<dynamic> userData = json.decode(responseBody);

    return userData.map((json) {
      var user = User.fromJson(json);
      return user;
    }).toList().cast<User>();
  }

  // Helper method to set fields from JSON
  void fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    role = json['role'];
    selfHref = json['_links']['self']['href'];
  }

  @override
  String toString() {
    return 'User{username: $username, password: $password, role: $role, selfHref: $selfHref}';
  }
}
