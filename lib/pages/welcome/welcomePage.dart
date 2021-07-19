import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/utils/utils.dart';
import 'package:flutter_application_1/common/values/values.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  // 标题
  Widget _buildPageHeadTitle() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(65)),
      child: Text(
        'Features',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: duSetFontSize(24),
        ),
      ),
    );
  }

  // 说明
  Widget _buildPageHeadDetail() {
    return Container(
      width: duSetWidth(242),
      height: duSetHeight(70),
      margin: EdgeInsets.only(top: duSetHeight(14)),
      child: Text(
        "The best of news channels all in one place. Trusted sources and personalized news for you.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.normal,
          fontSize: duSetFontSize(16),
          height: 1.3,
        ),
      ),
    );
  }

  // 特效
  Widget _buildFeatureItem(String imageName, String intro, double marginTop) {
    return Container(
      width: duSetWidth(295),
      height: duSetHeight(80),
      margin: EdgeInsets.only(top: duSetHeight(marginTop)),
      child: Row(
        children: [
          Container(
            width: duSetWidth(80),
            height: duSetWidth(80),
            child: Image.asset('assets/images/$imageName.png'),
          ),
          Spacer(),
          Container(
            width: duSetWidth(195),
            child: Text(
              intro,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: duSetFontSize(16),
              ),
            ),
          )
        ],
      ),
    );
  }

  // 按钮
  Widget _buildStartButton(BuildContext context) {
    return Container(
      width: duSetWidth(295),
      height: duSetWidth(44),
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, "/sign-in");
        },
        child: Text(
          'Get started',
          style: TextStyle(color: AppColors.primaryElementText),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => AppColors.primaryElement),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(duSetHeight(6)))),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 高度去掉 顶部、底部 导航
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              _buildPageHeadTitle(),
              _buildPageHeadDetail(),
              _buildFeatureItem(
                "feature-1",
                "Compelling photography and typography provide a beautiful reading",
                40,
              ),
              _buildFeatureItem(
                "feature-2",
                "Sector news never shares your personal data with advertisers or publishers",
                40,
              ),
              _buildFeatureItem(
                "feature-3",
                "You can get Premium to unlock hundreds of publications",
                40,
              ),
              Spacer(),
              _buildStartButton(context)
            ],
          ),
        ),
      ),
    );
  }
}
