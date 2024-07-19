import 'dart:convert';

ConfirmCodeModel confirmCodeModelFromJson(String str) => ConfirmCodeModel.fromJson(json.decode(str));

String confirmCodeModelToJson(ConfirmCodeModel data) => json.encode(data.toJson());


class ConfirmCodeModel {
  final String? phone;
  final String? code;
  final String? token; // Add token field if not present

  ConfirmCodeModel({
    this.phone,
    this.code,
    this.token,
  });

  ConfirmCodeModel copyWith({
    String? phone,
    String? code,
    String? token,
  }) =>
      ConfirmCodeModel(
        phone: phone ?? this.phone,
        code: code ?? this.code,
        token: token ?? this.token,
      );

  factory ConfirmCodeModel.fromJson(Map<String, dynamic> json) => ConfirmCodeModel(
    phone: json["phone"],
    code: json["code"],
    token: json["token"], // Update according to your API response
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "code": code,
    "token": token, // Include token in JSON serialization if needed
  };
}
