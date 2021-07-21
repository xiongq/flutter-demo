import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/entitys/entitys.dart';
import 'package:flutter_application_1/common/utils/utils.dart';
import 'package:flutter_application_1/common/values/values.dart';

Widget newsCategoriesWidget(
  List<CategoryResponseEntity> categoriesList,
  String selCategoryCode,
  Function(CategoryResponseEntity) onTap,
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
          child: GestureDetector(
            onTap: () => onTap(e),
            child: Text(
              e.title,
              style: TextStyle(
                color: selCategoryCode == e.code
                    ? AppColors.secondaryElementText
                    : AppColors.primaryText,
                fontSize: duSetFontSize(18),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
