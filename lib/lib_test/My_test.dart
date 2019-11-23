/*
 * @author chengpenggao
 * @date 2019/11/23
 */
import 'package:flutter/material.dart';
import 'package:luck_pets/lib_utils/colors.dart';

class My_Page extends StatefulWidget {
  @override
  _My_PageState createState() => _My_PageState();
}

class _My_PageState extends State<My_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            width: 500,
            height: 240,
            margin: EdgeInsets.only(left: 16,right: 16,top: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/main_ui/icon_locus_head.png'),
                  fit: BoxFit.fill),
            ),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    '逗比奴隶狗',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(top: 20),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colours.green_1, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: 80,
                  height: 20,
                  margin: EdgeInsets.only(left: 16, top: 10),
                  padding: EdgeInsets.only(left: 6),
                  child: Text('ID:008008'),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: Text('认证信息：终级铲屎官',
                          style:
                              TextStyle(fontSize: 14, color: Colors.black26)),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 16, top: 8),
                    ),
                    Container(
                      child: Text('个人描述：团子最忠实的奴隶狗',
                          style:
                              TextStyle(fontSize: 14, color: Colors.black26)),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 16, top: 8),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.only(left: 16, top: 8),
                          decoration: ShapeDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://gaoye.oss-cn-beijing.aliyuncs.com/test/u%3D3929871212%2C506092936%26fm%3D26%26gp%3D0.jpg'),
                                  fit: BoxFit.fill),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)))),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.only(left: 16, top: 8),
                          decoration: ShapeDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://gaoye.oss-cn-beijing.aliyuncs.com/test/u%3D3929871212%2C506092936%26fm%3D26%26gp%3D0.jpg'),
                                  fit: BoxFit.fill),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)))),
                        )
                      ],
                    ),
                  ],
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          Container(
            width: 500,
            height: 380,
            margin: EdgeInsets.only(left: 16,right: 16,top: 0),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/main_ui/icon_my_head.png'),
                  fit: BoxFit.fill),
            ),
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }
}
