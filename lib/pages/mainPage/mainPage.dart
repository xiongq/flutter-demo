import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/utils/utils.dart';
import 'package:flutter_application_1/common/values/values.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    loadAllData();
  }

  // 读取所有数据
  void loadAllData() async {}
  Widget _buildCategories() {
    List<String> cateList = [
      'Latest',
      'World',
      'Business',
      'Sports',
      'Life',
      '国内',
      '国外',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cateList.map<Widget>((e) {
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

  // 推荐阅读
  Widget _buildRecommend() {
    return Container(
      // height: duSetHeight(490),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      // color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: AspectRatio(
              aspectRatio: 1.57,
              child: Image.asset(
                'assets/images/NS.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Text(
              'Bloomberg',
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
              'The green-blue blooms of toxic algae have been found in Prospect Park ，卫星顺利进入预定轨道，发射任务获得圆满成功。新华社发（郭文彬 摄）',
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
                  'Health',
                  style: TextStyle(
                    color: AppColors.primaryElement,
                    fontSize: duSetFontSize(14),
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(' · '),
                Text(
                  '20m ago',
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: duSetFontSize(14),
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 频道
  Widget _buildChannels() {
    return Container(
      height: duSetWidth(137),
      // color: Colors.blueAccent,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Container(
            width: duSetWidth(70),
            height: duSetWidth(97),
            // color: Colors.red,
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
                    child: Image.asset(
                      "assets/images/NS.jpeg",
                      fit: BoxFit.cover,
                      width: duSetWidth(44),
                      height: duSetWidth(44),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Text(
                    'Fox News dad dds',
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: duSetFontSize(14),
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: duSetWidth(104),
            height: duSetWidth(97),
            // color: Colors.red,
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
                    child: Image.asset(
                      "assets/images/NS.jpeg",
                      fit: BoxFit.cover,
                      width: duSetWidth(44),
                      height: duSetWidth(44),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Text(
                    'Fox News',
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: duSetFontSize(14),
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 新闻列表
  Widget _buildNewsList() {
    return Container(
      height: duSetHeight(161 * 5 + 100.0),
      color: Colors.purple,
      child: Row(
        children: [
          Container(
            width: duSetWidth(70),
            height: duSetWidth(97),
            color: Colors.red,
          )
        ],
      ),
    );
  }

  // ad 广告条
  // 邮件订阅
  Widget _buildEmailSubscribe() {
    return Container(
      height: duSetHeight(259),
      color: Colors.brown,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCategories(),
          Divider(
            height: 1,
          ),
          _buildRecommend(),
          Divider(
            height: 1,
          ),
          _buildChannels(),
          Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}
