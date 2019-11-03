import 'package:flutter/material.dart';
import 'lib_mian_ui/user/user_login.dart';
import 'lib_mian_ui/user/main_route.dart';
import 'package:luck_pets/lib_utils/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //初始化路由
      routes: {'partner': (context) => MainRoute()},
      title: 'LuckPet',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: LoginPager(),
    );
  }
}
