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
    this.thumbnail,
    this.title,
    this.category,
    this.addtime,
    this.author,
    this.url,
    this.id,
  });

  final String? thumbnail;
  final String? title;
  final String? category;
  final DateTime? addtime;
  final String? author;
  final String? url;
  final String? id;

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
        "addtime": addtime!.toIso8601String(),
        "author": author,
        "url": url,
        "id": id,
      };
}

// 新闻翻页
class NewsPageListRequestEntity {
  String? categoryCode;
  String? channelCode;
  String? tag;
  String? keyword;

  NewsPageListRequestEntity({
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

// To parse this JSON data, do
//
//     final newsPageListResponseEntity = newsPageListResponseEntityFromMap(jsonString);

class NewsPageListResponseEntity {
  NewsPageListResponseEntity({
    required this.counts,
    required this.pagesize,
    required this.pages,
    required this.page,
    required this.items,
  });

  int counts;
  int pagesize;
  int pages;
  int page;
  List<Item> items;

  factory NewsPageListResponseEntity.fromJson(String str) =>
      NewsPageListResponseEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsPageListResponseEntity.fromMap(Map<String, dynamic> json) =>
      NewsPageListResponseEntity(
        counts: json["counts"],
        pagesize: json["pagesize"],
        pages: json["pages"],
        page: json["page"],
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "counts": counts,
        "pagesize": pagesize,
        "pages": pages,
        "page": page,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
      };
}

class Item {
  Item({
    required this.id,
    required this.category,
    required this.thumbnail,
    required this.addtime,
    required this.title,
    required this.author,
    required this.url,
  });

  String id;
  String category;
  String thumbnail;
  String addtime;
  String title;
  String author;
  String url;

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json["id"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        addtime: json["addtime"],
        title: json["title"],
        author: json["author"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category": category,
        "thumbnail": thumbnail,
        "addtime": addtime,
        "title": title,
        "author": author,
        "url": url,
      };
}
