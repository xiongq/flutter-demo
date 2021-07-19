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
      padding: EdgeInsets.all(20),
      // color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: AspectRatio(
              aspectRatio: 1,
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
              'The green-blue blooms of toxic algae have been found in Prospect Park',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: duSetFontSize(24),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Spacer(),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(10)),
            child: Row(
              children: [
                Text('Health'),
                Text(' · '),
                Text('20m ago'),
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
      height: duSetHeight(137),
      color: Colors.blueAccent,
    );
  }

  // 新闻列表
  Widget _buildNewsList() {
    return Container(
      height: duSetHeight(161 * 5 + 100.0),
      color: Colors.purple,
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
          _buildRecommend(),
        ],
      ),
    );
  }
}
