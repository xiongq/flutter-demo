import 'dart:collection';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/common/values/values.dart';

class CacheObject {
  CacheObject(this.response)
      : timeStamp = DateTime.now().millisecondsSinceEpoch;
  late Response response;
  late int timeStamp;

  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  @override
  int get hashCode => response.realUri.hashCode;
}

class NetCache extends Interceptor {
  // 为确保迭代器顺序和对象插入时间一致顺序一致，我们使用LinkedHashMap
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('请求拦截 -> 开始 ->');
    if (!CACHE_ENABLE) {
      print('未开启缓存开关');
      super.onRequest(options, handler);
      return;
    }
    bool refresh = options.extra["refresh"] == true;
    // 如果是下拉刷新，先删除相关缓存
    if (refresh) {
      if (options.extra["list"] == true) {
        //若是列表，则只要url中包含当前path的缓存全部删除（简单实现，并不精准）
        cache.removeWhere((key, value) => key.contains(options.path));
        print('List 包含path移除缓存');
      } else {
        // 如果不是列表，则只删除uri相同的缓存
        cache.remove(options.uri.toString());
      }
    }
    // get 请求，开启缓存
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == 'get') {
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      var ob = cache[key];
      if (ob != null) {
        //若缓存未过期，则返回缓存内容
        if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 <
            CACHE_MAXAGE) {
          handler.resolve(cache[key]!.response);

          print('缓存未过期 -> 返回缓存');
          return;

          // super.onRequest(options, handler)
        } else {
          //若已过期则删除缓存，继续向服务器请求
          cache.remove(key);
          print('缓存已过期 -> 移除 -> 继续请求');
        }
      }
    }
    super.onRequest(options, handler);
    print('请求拦截 -> 结束');
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (CACHE_ENABLE) {
      _saveCache(response);
    }
    super.onResponse(response, handler);
  }

  _saveCache(Response object) {
    RequestOptions options = object.requestOptions;

    // 只缓存 get 的请求
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == "get") {
      print('缓存请求 -> GET');
      // 如果缓存数量超过最大数量限制，则先移除最早的一条记录
      if (cache.length == CACHE_MAXCOUNT) {
        cache.remove(cache[cache.keys.first]);
      }
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      cache[key] = CacheObject(object);
    }
  }
}
