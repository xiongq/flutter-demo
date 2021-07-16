import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/utils/utils.dart';
import 'package:flutter_application_1/common/values/values.dart';

Widget btnFlatButtonWidget({
  required VoidCallback onPressed,
  required String title,
  Color gbColor = AppColors.primaryElement,
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 18,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      title,
      style: TextStyle(
        color: fontColor,
        fontFamily: fontName,
        fontWeight: fontWeight,
        fontSize: duSetFontSize(fontSize),
        height: 1,
      ),
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) => gbColor),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: Radii.k6pxRadius),
      ),
    ),
  );
}

Widget btnImageButtonWidget({
  required VoidCallback onPressed,
  required String iconFileName,
}) {
  return TextButton(
    onPressed: () {},
    child: Image.asset(
      "assets/images/icons-$iconFileName.png",
    ),
    style: ButtonStyle(
      // backgroundColor: MaterialStateProperty.resolveWith((states) => gbColor),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: Radii.k6pxRadius),
      ),
      side: MaterialStateProperty.all(BorderSide(
        color: Color.fromARGB(255, 230, 230, 231),
        width: 1,
        style: BorderStyle.solid,
      )),
    ),
  );
}
