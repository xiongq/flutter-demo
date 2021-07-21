// To parse this JSON data, do
//
//     final newsRecommendResponseEntity = newsRecommendResponseEntityFromMap(jsonString);

import 'dart:convert';

// 推荐新闻
class NewsRecommendRequestEntity {
  String? categoryCode;
  String? channelCode;
  String? tag;
  String? keyword;

  NewsRecommendRequestEntity({
    this.categoryCode,
    this.channelCode,
    this.tag,
    this.keyword,
  });

  Map<String, dynamic> toJson() => {
        "categoryCode": categoryCode,
        "channelCode": channelCode,
        "tag": tag,
        "keyword": keyword,
      };
}

// 推荐新闻
class NewsRecommendResponseEntity {
  NewsRecommendResponseEntity({
    required this.thumbnail,
    required this.title,
    required this.category,
    required this.addtime,
    required this.author,
    required this.url,
    required this.id,
  });

  final String thumbnail;
  final String title;
  final String category;
  final DateTime addtime;
  final String author;
  final String url;
  final String id;

  factory NewsRecommendResponseEntity.fromJson(String str) =>
      NewsRecommendResponseEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsRecommendResponseEntity.fromMap(Map<String, dynamic> json) =>
      NewsRecommendResponseEntity(
        thumbnail: json["thumbnail"],
        title: json["title"],
        category: json["category"],
        addtime: DateTime.parse(json["addtime"]),
        author: json["author"],
        url: json["url"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "thumbnail": thumbnail,
        "title": title,
        "category": category,
        "addtime": addtime.toIso8601String(),
        "author": author,
        "url": url,
        "id": id,
      };
}
