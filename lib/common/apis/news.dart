import 'package:flutter_application_1/common/entitys/entitys.dart';
import 'package:flutter_application_1/common/utils/http.dart';

class NewsAPI {
  //分类
  static Future<List<CategoryResponseEntity>> categories({
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/categories',
      cacheDisk: cacheDisk,
    );
    return response
        .map<CategoryResponseEntity>(
            (item) => CategoryResponseEntity.fromMap(item))
        .toList();
  }

  //推荐新闻
  static Future<NewsRecommendResponseEntity> newsRecommend({
    NewsRecommendRequestEntity? params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/news/recommend',
      params: params?.toJson(),
      cacheDisk: false,
      refresh: refresh,
    );
    return NewsRecommendResponseEntity.fromMap(response);
  }

  //频道
  static Future<List<ChannelResponseEntity>> channelResponse({
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/channels',
      cacheDisk: cacheDisk,
    );
    return response
        .map<ChannelResponseEntity>(
            (item) => ChannelResponseEntity.fromMap(item))
        .toList();
  }

// 翻页
  /// refresh 是否刷新
  static Future<NewsPageListResponseEntity> newsPageList({
    NewsPageListRequestEntity? params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/news',
      params: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
    );
    return NewsPageListResponseEntity.fromMap(response);
  }
}
