import 'package:flutter/material.dart';
import 'package:luck_pets/lib_config/Config.dart';
import 'package:luck_pets/lib_net/dio_utils.dart';
import 'package:dio/dio.dart';
import 'package:luck_pets/lib_net/base_response.dart';
/*
 * @author chengpenggao
 * @date 2019/11/2
 */

class FollowPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          HttpDioUtils.getInstance().request<List>(Method.get, "");
        },
      ),
    );
  }
}
