class UserModel {
  String username;
  String password;
  bool hasLogin;

  UserModel({this.hasLogin, this.password, this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      hasLogin: json['has_login'],
      password: json['password'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'hasLogin': hasLogin,
      };
}
