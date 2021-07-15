// 静态路由
import 'package:flutter_application_1/pages/sign_in/sign_in.dart';
import 'package:flutter_application_1/pages/sign_up/sign_up.dart';

var staticRoutes = {
  //登录
  "/sign-in":(context) => SignInPage(),
  // 注册
  "/sign-up":(context) => SignUpPage(),
};
