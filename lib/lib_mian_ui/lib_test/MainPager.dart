/*
 * @author chengpenggao
 * @date 2019/10/10
 */

import 'package:flutter/material.dart';

import '../main_test.dart';

class MainPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainPage'),
      ),
      body: Center(
        child: SelectBtn(),
      ),
    );
  }
}

class SelectBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigaAndDisPaly(context);
      },
      child: Text('Pick!'),
    );
  }
  _navigaAndDisPaly(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyScaffold()));


  }

}
