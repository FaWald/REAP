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

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    role = json['role'];
    selfHref = json['_links']['self']['href'];
  }
}