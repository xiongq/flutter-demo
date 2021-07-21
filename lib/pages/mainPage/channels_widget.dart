import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/entitys/entitys.dart';
import 'package:flutter_application_1/common/utils/utils.dart';
import 'package:flutter_application_1/common/values/values.dart';

Widget newsChannels({
  required List<ChannelResponseEntity> channels,
  required Function(ChannelResponseEntity) onTap,
}) {
  return Container(
    height: duSetWidth(137),
    // color: Colors.blueAccent,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: channels.map<Widget>((item) {
        return Container(
          margin: EdgeInsets.only(left: duSetWidth(14)),
          width: duSetWidth(70),
          height: duSetWidth(97),
          // color: Colors.red,
          child: InkWell(
            onTap: () {},
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    height: duSetWidth(64),
                    width: duSetWidth(64),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: [
                        Shadows.primaryShadow,
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          duSetWidth(64 * 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: duSetWidth(10),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      width: duSetWidth(44),
                      height: duSetWidth(44),
                      imageUrl: item.thumbnail,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          // borderRadius: Radii.k6pxRadius,
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
                Positioned(
                  bottom: 0,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: duSetWidth(70)),
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: duSetFontSize(14),
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList()),
    ),
  );
}
