// To parse this JSON data, do
//
//     final categoryResponseEntity = categoryResponseEntityFromMap(jsonString);

import 'dart:convert';

class CategoryResponseEntity {
  CategoryResponseEntity({
    required this.code,
    required this.title,
  });

  final String code;
  final String title;

  factory CategoryResponseEntity.fromJson(String str) =>
      CategoryResponseEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryResponseEntity.fromMap(Map<String, dynamic> json) =>
      CategoryResponseEntity(
        code: json["code"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "title": title,
      };
}
