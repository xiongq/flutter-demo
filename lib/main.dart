import 'package:flutter/material.dart';
import 'package:flutter_application_1/global.dart';
import 'package:flutter_application_1/pages/application/application.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// void main() {
//   runApp(MyApp());
// }

void main() {
  Global.init().then((e) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812 - 44 - 34),
      builder: () => MaterialApp(
        title: 'Flutters',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: ApplicationPage(),
        routes: staticRoutes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
