import 'dart:convert';

LoginUser loginUserFromJson(String str) => LoginUser.fromJson(json.decode(str));

String loginUserToJson(LoginUser data) => json.encode(data.toJson());

class LoginUser {
  final String? token;
  final String? refreshToken;

  LoginUser({
    this.token,
    this.refreshToken,
  });

  LoginUser copyWith({
    String? token,
    String? refreshToken,
  }) =>
      LoginUser(
        token: token ?? this.token,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
    token: json["token"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "refreshToken": refreshToken,
  };
}
