import 'package:flutter/material.dart';
import 'lib_mian_ui/user/user_login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LuckPets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPager(),
    );
  }
}
