import 'package:flutter/material.dart';
import 'package:luck_pets/lib_config/Config.dart';
/*
 * @author chengpenggao
 * @date 2019/11/2
 */

class HotPager extends StatefulWidget {
  @override
  _HotPagerState createState() => _HotPagerState();
}

class _HotPagerState extends State<HotPager> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(Config.hot),
    );
  }
}
