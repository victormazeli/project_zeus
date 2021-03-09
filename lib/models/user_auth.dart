class User {
  final int id;
  final String email;

  User({this.id, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(email: json['email'], id: json['id']);
  }
  
}

class UserToken {
  final String token;
  UserToken({this.token});

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(token: json['auth_token']);
  }
}
