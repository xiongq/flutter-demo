import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/utils/utils.dart';
import 'package:flutter_application_1/common/values/values.dart';

Widget newsCategoriesWidget(
  List categoriesList,
  String selCategoryCode,
) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: categoriesList.map<Widget>((e) {
        return Container(
          // color: Colors.red,
          alignment: Alignment.center,
          height: duSetWidth(52),
          padding: EdgeInsets.symmetric(horizontal: 8.5),
          child: Text(
            e,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: duSetFontSize(18),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }).toList(),
    ),
  );
}
