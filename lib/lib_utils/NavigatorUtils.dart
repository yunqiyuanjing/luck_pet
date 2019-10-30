import 'package:flutter/material.dart';

/*
 * @author chengpenggao
 * @date 2019/10/4
 */

class NavigatorUtils {
  ///替换
  static pushReplacement(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  /// 无参数跳转
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
