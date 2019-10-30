/*
 * @author chengpenggao
 * @date 2019/10/15
 */
import 'package:flutter/material.dart';

class CommonUtils {
  /// 底部弹出的Snack Tips
  static void showSnackBar(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
