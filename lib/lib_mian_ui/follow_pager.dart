import 'package:flutter/material.dart';
import 'package:luck_pets/lib_config/Config.dart';
import 'package:luck_pets/lib_net/dio_utils.dart';
import 'package:dio/dio.dart';
import 'package:luck_pets/lib_config/Config.dart';
/*
 * @author chengpenggao
 * @date 2019/11/2
 */

class FollowPager extends StatelessWidget {
  void _init() {
//    DioUtil.openDebug();
    BaseOptions options = HttpDioUtils.getOptions();
    options.baseUrl = Config.BASE_URL;
    HttpConfig config = new HttpConfig(options: options);
    HttpDioUtils.getInstance().setConfig(config);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          _init();
          HttpDioUtils.getInstance().request(Method.get, "");
        },
      ),
    );
  }
}
