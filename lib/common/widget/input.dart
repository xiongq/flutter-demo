import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/utils/screen.dart';
import 'package:flutter_application_1/common/values/values.dart';

// 输入框
Widget inputTextEdit({
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  required String hintText,
  bool isPassword = false,
  double marginTop = 15,
  Color bgColor = AppColors.secondaryElement,
}) {
  return Container(
    height: duSetWidth(44),
    margin: EdgeInsets.only(top: marginTop),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: Radii.k6pxRadius,
    ),
    child: Center(
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.only(left: 20, right: 20),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.w400,
          fontSize: duSetFontSize(18),
        ),
        maxLines: 1,
        autocorrect: false, // 自动纠正
        obscureText: isPassword, // 隐藏输入内容, 密码框
      ),
    ),
  );
}
