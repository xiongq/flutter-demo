import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/entitys/entitys.dart';
import 'package:flutter_application_1/common/utils/utils.dart';
import 'package:flutter_application_1/common/values/values.dart';

Widget newsItem(Item item) {
  return Container(
    height: duSetWidth(160),
    padding: EdgeInsets.all(20),
    child: Row(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: CachedNetworkImage(
            imageUrl: item.thumbnail,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: Radii.k6pxRadius,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  item.author,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: duSetFontSize(14),
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  item.title,
                  maxLines: 3,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: duSetFontSize(16),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  verticalDirection: VerticalDirection.up,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.category,
                      style: TextStyle(
                        color: AppColors.secondaryElementText,
                        fontSize: duSetFontSize(14),
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(' · '),
                    Container(
                      constraints: BoxConstraints(maxWidth: 75),
                      child: Text(
                        // item.addtime,
                        '32m ago',
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: duSetFontSize(14),
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      child: Icon(
                        Icons.more_horiz,
                        color: AppColors.primaryText,
                        size: 24,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
