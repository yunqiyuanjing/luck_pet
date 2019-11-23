import 'package:flutter/material.dart';
import 'package:luck_pets/lib_mian_ui/follow_pager.dart';
import 'package:luck_pets/lib_mian_ui/hot_pager.dart';
import 'package:luck_pets/lib_utils/colors.dart';
import 'package:luck_pets/lib_config/Config.dart';
import 'package:luck_pets/lib_mian_ui/partner_pager.dart';
import 'package:luck_pets/lib_utils/Utils.dart';
import 'package:luck_pets/lib_test/DynamicsBodyWidget.dart';
import 'package:luck_pets/lib_test/Sustenance_page.dart';
import 'package:luck_pets/lib_test/Identify_page.dart';
import 'package:luck_pets/lib_test/Locus_Widget.dart';
import 'package:luck_pets/lib_test/My_test.dart';
/*
 * @author chengpenggao
 * @date 2019/11/2
 */

class MainRoute extends StatefulWidget {
  @override
  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute>
    with SingleTickerProviderStateMixin {
  ///tab 控制器
  TabController _tabController;

  ///tab当前选中页面
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///整个app的Tabbar
    var appBars = [null, null, null, null, null];

    ///appBarBody
    var appBarBody = [DynamicsBodyWidget(), DynamicsBodyWidget()];

    var styles = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500);

    var tabTitles = [
      TabBar(
        //与文字同宽
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colours.green_1,
        labelColor: Colours.green_1,
        unselectedLabelColor: Colours.divider,
        tabs: <Widget>[
          new Container(
            child: Tab(
              icon: Text(
                Config.follow,
                style: styles,
              ),
            ),
          ),
          new Container(
            child: Tab(
              icon: Text(
                Config.hot,
                style: styles,
              ),
            ),
          )
        ],
        controller: _tabController,
      ),
      null,
      null,
      null,
      null
    ];

    var appBody = [
      TabBarView(
        children: appBarBody,
        controller: _tabController,
      ),
      HomeHotWidget(),
      Identify(),
      Locus_Page(),
      My_Page(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: appBars[_currentIndex],
        bottom: tabTitles[_currentIndex],
      ),
      body: appBody[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colours.green_1,
          unselectedItemColor: Colours.text_gray,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: CommonUtils.getBottomIcon(
                    'assets/main_ui/partner_normal.png'),
                activeIcon:
                    CommonUtils.getBottomIcon('assets/main_ui/partner_sel.png'),
                title: Text(Config.partner)),
            BottomNavigationBarItem(
                icon: CommonUtils.getBottomIcon(
                    'assets/main_ui/sustenance_normal.png'),
                activeIcon: CommonUtils.getBottomIcon(
                    'assets/main_ui/sustenance_sel.png'),
                title: Text(Config.sustenance)),
            BottomNavigationBarItem(
                icon: CommonUtils.getBottomIcon(
                    'assets/main_ui/identify_normal.png'),
                activeIcon: CommonUtils.getBottomIcon(
                    'assets/main_ui/identify_sel.png'),
                title: Text(Config.identify)),
            BottomNavigationBarItem(
                icon: CommonUtils.getBottomIcon(
                    'assets/main_ui/locus_normal.png'),
                activeIcon:
                    CommonUtils.getBottomIcon('assets/main_ui/locus_sel.png'),
                title: Text(Config.locus)),
            BottomNavigationBarItem(
                icon: CommonUtils.getBottomIcon('assets/main_ui/my_normal.png'),
                activeIcon:
                    CommonUtils.getBottomIcon('assets/main_ui/my_sel.png'),
                title: Text(Config.my)),
          ]),
    );
  }
}
