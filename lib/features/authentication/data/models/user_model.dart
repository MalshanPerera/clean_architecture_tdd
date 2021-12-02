import 'dart:convert';

import 'package:clean_architecture_tdd/features/authentication/domain/entities/user_results.dart';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel extends UserResults {

  UserModel({
    Data? data,
    String? message,
  }) : super(
    data: data,
    message: message,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    data: Data.fromJson(
      json["data"] ?? {},
    ),
    message: json["message"] ?? "",
  );

}
