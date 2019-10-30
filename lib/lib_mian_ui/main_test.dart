import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
/*
 * @author chengpenggao
 * @date 2019/10/4
 */

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column();
  }
}

class Butt extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

class _Butt extends State<Butt> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(

    );
  }
}
