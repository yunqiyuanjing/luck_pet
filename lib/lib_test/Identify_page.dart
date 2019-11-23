/*
 * @author chengpenggao
 * @date 2019/11/22
 */

import 'package:flutter/material.dart';
import 'package:luck_pets/lib_utils/Utils.dart';

class Identify extends StatefulWidget {
  @override
  _IdentifyState createState() => _IdentifyState();
}

class _IdentifyState extends State<Identify> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
        Image.asset(
          'assets/main_ui/identify_head.png',
          height: 240,
          fit: BoxFit.fitWidth,
        ),
        Container(
          margin: EdgeInsets.only(right: 40),
          child: Text(
            '鉴定规则',
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.black26, fontSize: 18),
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Image.asset(
                'assets/main_ui/icon_identify.png',
                width: 50,
                height: 50,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              '选择品类',
              style: TextStyle(fontSize: 26, color: Colors.lightGreen),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(right: 290, top: 20, bottom: 20),
          child: Image.asset(
            'assets/main_ui/icon_progress_h.png',
            height: 50,
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 100, right: 20),
              child: Image.asset(
                'assets/main_ui/icon_camera.png',
                width: 50,
                height: 50,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              '上传细节',
              style: TextStyle(fontSize: 26, color: Colors.lightGreen),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(right: 290, top: 20, bottom: 20),
          child: Image.asset(
            'assets/main_ui/icon_progress_h.png',
            height: 50,
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 140, right: 20),
              child: Image.asset(
                'assets/main_ui/icon_process_w.png',
                width: 50,
                height: 50,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 20),
              child: Image.asset(
                'assets/main_ui/icon_identify_z.png',
                width: 50,
                height: 50,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              '发布鉴定',
              style: TextStyle(fontSize: 26, color: Colors.lightGreen),
            )
          ],
        ),
      ]),
    );
  }
}
