import 'package:flutter_application_1/common/entitys/entitys.dart';
import 'package:flutter_application_1/common/utils/http.dart';

class NewsAPI {
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
}
