
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String firstName;
  final String lastName;
  final int userType;
  final String phoneNumber;
   String? marketName;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.phoneNumber,
     this.marketName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    userType: json["userType"],
    phoneNumber: json["phoneNumber"],
    marketName: json["marketName"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "userType": userType,
    "phoneNumber": phoneNumber,
    "marketName": marketName,
  };
}
