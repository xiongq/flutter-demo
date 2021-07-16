import 'package:flutter_application_1/common/entitys/entitys.dart';
import 'package:flutter_application_1/common/utils/http.dart';

class UserAPI {
  // 登录-转化一下参数
  static Future<UserResponseEntity> login(
      {required UserRequestEntity params}) async {
    var response = await HttpUtil().post(
      '/user/login',
      params: params.toJson(),
    );

    return UserResponseEntity.fromJson(response);
  }
}
