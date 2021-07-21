import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/apis/apis.dart';
import 'package:flutter_application_1/common/entitys/categories.dart';
import 'package:flutter_application_1/common/entitys/entitys.dart';
import 'package:flutter_application_1/common/utils/utils.dart';
import 'package:flutter_application_1/common/values/values.dart';
import 'package:flutter_application_1/common/widget/input.dart';
import 'package:flutter_application_1/common/widget/widgets.dart';
import 'package:flutter_application_1/pages/mainPage/categories_widget.dart';
import 'package:flutter_application_1/pages/mainPage/channels_widget.dart';
import 'package:flutter_application_1/pages/mainPage/recommend_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<CategoryResponseEntity>? _categoriesList;
  NewsRecommendResponseEntity? _newRecommend;
  List<ChannelResponseEntity>? _channels;
  String _selCategoryCode = ''; // 选中的分类Code
  @override
  void initState() {
    super.initState();
    loadAllData();
  }

  // 读取所有数据
  void loadAllData() async {
    _categoriesList = await NewsAPI.categories(cacheDisk: true);
    _newRecommend = await NewsAPI.newsRecommend(cacheDisk: false);
    _channels = await NewsAPI.channelResponse();
    if (mounted) {
      setState(() {});
    }
  }

  _loadNewsData(
    categoryCode, {
    bool refresh = false,
  }) async {
    _selCategoryCode = categoryCode;
  }

  Widget _buildCategories() {
    return _categoriesList == null
        ? Container()
        : newsCategoriesWidget(
            _categoriesList!,
            _selCategoryCode,
            (CategoryResponseEntity entity) {
              _loadNewsData(entity.code);
            },
          );
  }

  // 推荐阅读
  Widget _buildRecommend() {
    return _newRecommend == null
        ? Container()
        : recommendWidget(_newRecommend!);
  }

  // 频道
  Widget _buildChannels() {
    return _channels == null
        ? Container()
        : newsChannels(
            channels: _channels!, onTap: (ChannelResponseEntity entity) {});
  }

  // 新闻列表
  Widget _buildNewsList() {
    return Column(
      children: [
        Container(
          height: duSetWidth(160),
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  'assets/images/feature-1.png',
                  fit: BoxFit.cover,
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
                        'Euronews',
                        style: TextStyle(
                          color: AppColors.secondaryElementText,
                          fontSize: duSetFontSize(14),
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'On politics with Lisa Loureniani: Warren’s growing crowds',
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
                        children: [
                          Text(
                            'Politics',
                            style: TextStyle(
                              color: AppColors.secondaryElementText,
                              fontSize: duSetFontSize(14),
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(' · '),
                          Text(
                            '20m ago',
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: duSetFontSize(14),
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.normal,
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
        ),
      ],
    );
  }

  // ad 广告条
  Widget _buildAD() {
    return Container(
      height: 100,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () async {
                // List<CategoryResponseEntity> res = await NewsAPI.categories();
              },
              child: Text(
                'Tired of Ads? Get Premium - \$9.99',
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 18,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: Radii.k6pxRadius),
                ),
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: AppColors.primaryElement,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                minimumSize: MaterialStateProperty.all(Size(100, 80)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final TextEditingController _emailController = TextEditingController();
  // 邮件订阅
  Widget _buildEmailSubscribe() {
    return Container(
      padding: EdgeInsets.all(20),
      color: AppColors.secondaryElement,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Newsletter',
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: duSetFontSize(16),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.close_outlined,
                  color: AppColors.primaryText,
                  size: 24,
                ),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          inputTextEdit(
              controller: _emailController,
              hintText: 'Email',
              marginTop: 0,
              keyboardType: TextInputType.emailAddress,
              bgColor: Colors.white),
          SizedBox(
            height: 20,
          ),
          Container(
            height: duSetWidth(44),
            width: double.infinity,
            child: btnFlatButtonWidget(
              onPressed: () {},
              title: 'Subscribe',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: duSetWidth(130.5 * 2),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'By clicking on Subscribe button you agree to accept',
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w400,
                      fontSize: duSetFontSize(14),
                      height: 1.2,
                    ),
                  ),
                  TextSpan(
                    text: ' Privacy Policy ',
                    style: TextStyle(
                      color: AppColors.primaryElement,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w400,
                      fontSize: duSetFontSize(14),
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
          _buildNewsList(),
          Divider(
            height: 1,
          ),
          _buildAD(),
          Divider(
            height: 1,
          ),
          _buildEmailSubscribe(),
        ],
      ),
    );
  }
}
