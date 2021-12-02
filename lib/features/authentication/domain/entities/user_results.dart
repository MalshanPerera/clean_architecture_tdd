import 'package:equatable/equatable.dart';

class UserResults {
  final Data? data;
  final String? message;

  const UserResults({
    this.data,
    this.message,
  });
}

class Data extends Equatable {
  
  final String accessToken;
  final String refreshToken;
  final List<String> roles;
  final UserData userData;

  const Data({
    required this.accessToken,
    required this.refreshToken,
    required this.roles,
    required this.userData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["accessToken"] ?? "",
    refreshToken: json["refreshToken"] ?? "",
    roles: List<String>.from(json["roles"].map((x) => x)),
    userData: UserData.fromJson(json["userData"]),
  );

  @override
  List<Object?> get props => [
    accessToken,
    refreshToken,
    roles,
    userData,
  ];
}

class UserData extends Equatable {
  final String firstName;
  final String lastName;
  final String displayName;
  final String avatar;
  final String email;

  const UserData({
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.avatar,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    firstName: json["firstName"],
    lastName: json["lastName"],
    displayName: json["displayName"],
    avatar: json["avatar"],
    email: json["email"],
  );

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    displayName,
    avatar,
    email,
  ];
}
