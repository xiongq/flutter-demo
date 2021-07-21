import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/entitys/entitys.dart';
import 'package:flutter_application_1/common/utils/utils.dart';
import 'package:flutter_application_1/common/values/values.dart';

Widget recommendWidget(NewsRecommendResponseEntity newsRecommend) {
  return Container(
    // height: duSetHeight(490),
    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
    // color: Colors.amber,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: AspectRatio(
            aspectRatio: 1,
            child: CachedNetworkImage(
              imageUrl: newsRecommend.thumbnail!,
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
        ),
        Container(
          child: Text(
            newsRecommend.author!,
            // textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: duSetFontSize(14),
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: duSetWidth(10)),
          child: Text(
            newsRecommend.title!,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: duSetFontSize(24),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
            maxLines: 3,
          ),
        ),
        // Spacer(),
        Container(
          margin: EdgeInsets.only(top: duSetHeight(10)),
          child: Row(
            children: [
              Text(
                newsRecommend.category!,
                style: TextStyle(
                  color: AppColors.primaryElement,
                  fontSize: duSetFontSize(14),
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(' · '),
              Text(
                newsRecommend.addtime!.toString(),
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: duSetFontSize(14),
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w400,
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
        ),
      ],
    ),
  );
}
