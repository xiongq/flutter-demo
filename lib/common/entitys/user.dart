// To parse this JSON data, do
//
//     final userResponseEntity = userResponseEntityFromJson(jsonString);

import 'dart:convert';

class UserResponseEntity {
  UserResponseEntity({
    required this.accessToken,
    required this.displayName,
    required this.channels,
  });

  String accessToken;
  String displayName;
  List<String> channels;

  factory UserResponseEntity.fromRawJson(String str) =>
      UserResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserResponseEntity(
        accessToken: json["access_token"],
        displayName: json["display_name"],
        channels: List<String>.from(json["channels"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "display_name": displayName,
        "channels": List<dynamic>.from(channels.map((x) => x)),
      };
}

// To parse this JSON data, do
//
//     final userRequestEntity = userRequestEntityFromMap(jsonString);

class UserRequestEntity {
  UserRequestEntity({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  factory UserRequestEntity.fromJson(String str) =>
      UserRequestEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserRequestEntity.fromMap(Map<String, dynamic> json) =>
      UserRequestEntity(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
      };
}
