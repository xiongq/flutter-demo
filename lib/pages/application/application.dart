import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/utils/iconfont.dart';
import 'package:flutter_application_1/common/utils/utils.dart';
import 'package:flutter_application_1/common/values/values.dart';
import 'package:flutter_application_1/common/widget/app.dart';
import 'package:flutter_application_1/pages/account/accountPage.dart';
import 'package:flutter_application_1/pages/bookmarks/bookmarksPage.dart';
import 'package:flutter_application_1/pages/category/categoryPage.dart';
import 'package:flutter_application_1/pages/mainPage/mainPage.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  //当前tab页码
  int _page = 0;
  //tab页面
  final List<String> _tabTitles = [
    'Welcome',
    'Cagegory',
    'Bookmarks',
    'Account',
  ];
  //页控制器
  late PageController _pageController;
  final List<BottomNavigationBarItem> _bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(
        Iconfont.home,
        color: AppColors.tabBarElement,
      ),
      label: 'main',
      activeIcon: Icon(
        Iconfont.home,
        color: AppColors.secondaryElementText,
      ),
      backgroundColor: AppColors.primaryBackground,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Iconfont.grid,
        color: AppColors.tabBarElement,
      ),
      label: 'category',
      activeIcon: Icon(
        Iconfont.grid,
        color: AppColors.secondaryElementText,
      ),
      backgroundColor: AppColors.primaryBackground,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Iconfont.tag,
        color: AppColors.tabBarElement,
      ),
      label: 'tag',
      activeIcon: Icon(
        Iconfont.tag,
        color: AppColors.secondaryElementText,
      ),
      backgroundColor: AppColors.primaryBackground,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Iconfont.me,
        color: AppColors.tabBarElement,
      ),
      label: 'my',
      activeIcon: Icon(
        Iconfont.me,
        color: AppColors.secondaryElementText,
      ),
      backgroundColor: AppColors.primaryBackground,
    ),
  ];

  //tab 栏页码切换
  void _handlePageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  //tab 栏动画
  void _handleNavBarTap(int index) {
    // _pageController.animateToPage(
    //   index,
    //   duration: Duration(milliseconds: 1000),
    //   curve: Curves.easeIn,
    // );
    _pageController.jumpToPage(index);
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      fixedColor: AppColors.primaryElement,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return taransparentAppBar(
      context: context,
      title: Text(
        _tabTitles[_page],
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Montserrat',
          fontSize: duSetFontSize(18.0),
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: AppColors.primaryText,
          ),
        ),
      ],
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.primaryText,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  //内容
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: [MainPage(), CategoryPage(), BookmarksPage(), AccountPage()],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: this._page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
