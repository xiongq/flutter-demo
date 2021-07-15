import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/welcome/welcomePage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 812 - 44 - 34),
      builder: () => MaterialApp(
        title: 'Flutter',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: WelcomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
