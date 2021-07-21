// To parse this JSON data, do
//
//     final channelResponseEntity = channelResponseEntityFromJson(jsonString);

import 'dart:convert';

class ChannelResponseEntity {
  ChannelResponseEntity({
    required this.code,
    required this.title,
    required this.thumbnail,
  });

  String code;
  String title;
  String thumbnail;

  factory ChannelResponseEntity.fromRawJson(String str) =>
      ChannelResponseEntity.fromMap(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChannelResponseEntity.fromMap(Map<String, dynamic> json) =>
      ChannelResponseEntity(
        code: json["code"],
        title: json["title"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "title": title,
        "thumbnail": thumbnail,
      };
}
