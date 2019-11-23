/*
 * @author chengpenggao
 * @date 2019/11/22
 */
import 'package:flutter/material.dart';
import 'package:luck_pets/lib_utils/styles.dart';
class Locus_Page extends StatefulWidget {
  @override
  _Locus_PageState createState() => _Locus_PageState();
}

class _Locus_PageState extends State<Locus_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            width: 600,
            height: 200,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/main_ui/icon_locus_head.png')),
            ),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
               Container(
                 child: Text('进行中',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                 alignment: Alignment.centerLeft,
                 padding: EdgeInsets.only(left: 20),
                 margin: EdgeInsets.only(top: 50),
               ),
               Container(
                 margin: EdgeInsets.only(left: 20,top: 10),
                 width: 340,
                 height: 1,
                 color: Colors.black12,
               ),
               Row(
                 children: <Widget>[
                   Container(
                     child: Text('余杭区 阿里巴巴 0.1km',style: TextStyle(fontSize: 18,color: Colors.black26)),
                     alignment: Alignment.centerLeft,
                     padding: EdgeInsets.only(left: 40,top: 10),
                   ),
                   Container(
                     child:  Icon(Icons.chevron_right,color: Colors.black26,size: 28,),
                     alignment: Alignment.centerRight,
                     padding: EdgeInsets.only(left: 40,top: 10),
                   ),
                 ],
               ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
            child: Image.asset('assets/main_ui/icon_route_test.png'),
          )
        ],
      ),
    );
  }
}
