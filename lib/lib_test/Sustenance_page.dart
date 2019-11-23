import 'package:flutter/material.dart';

class HomeHotWidget extends StatefulWidget {
  @override
  _HomeHotWidgetState createState() => _HomeHotWidgetState();
}

class _HomeHotWidgetState extends State<HomeHotWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var images = [
      'https://gaoye.oss-cn-beijing.aliyuncs.com/test/u%3D3929871212%2C506092936%26fm%3D26%26gp%3D0.jpg',
      'https://gaoye.oss-cn-beijing.aliyuncs.com/test/u%3D3929871212%2C506092936%26fm%3D26%26gp%3D0.jpg',
      'https://gaoye.oss-cn-beijing.aliyuncs.com/test/u%3D3929871212%2C506092936%26fm%3D26%26gp%3D0.jpg',
      'https://gaoye.oss-cn-beijing.aliyuncs.com/test/u%3D3929871212%2C506092936%26fm%3D26%26gp%3D0.jpg',
      'https://gaoye.oss-cn-beijing.aliyuncs.com/test/u%3D3929871212%2C506092936%26fm%3D26%26gp%3D0.jpg',
      'https://gaoye.oss-cn-beijing.aliyuncs.com/test/u%3D3929871212%2C506092936%26fm%3D26%26gp%3D0.jpg',
      'https://gaoye.oss-cn-beijing.aliyuncs.com/test/u%3D3929871212%2C506092936%26fm%3D26%26gp%3D0.jpg',
    ];
    var titles = [
      '全国宠物托运 专业托运 春节国庆节假日 猫咪狗狗小宠',
      '全国宠物托运 专业托运 春节国庆节假日 猫咪狗狗小宠',
      '全国宠物托运 专业托运 春节国庆节假日 猫咪狗狗小宠',
      '全国宠物托运 专业托运 春节国庆节假日 猫咪狗狗小宠',
      '全国宠物托运 专业托运 春节国庆节假日 猫咪狗狗小宠',
      '全国宠物托运 专业托运 春节国庆节假日 猫咪狗狗小宠',
      '全国宠物托运 专业托运 春节国庆节假日 猫咪狗狗小宠',
    ];
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 7,
        itemBuilder: (BuildContext context, int position) {
          if (position == 0) {
            var _textEditController = TextEditingController();
            return Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                color: Colors.black12,
              ),
              height: 40.0,
//                  color: Colors.yellow,
              child: TextField(
                controller: _textEditController,
                style: TextStyle(
                  decorationColor: Colors.black,
                  color: Colors.black,
                ),
//                    keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.black26,
                  prefixStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  //去掉下划线
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                  hintText: '搜索爱宠托运',
                  hintStyle: TextStyle(color: Colors.black26),
//                labelText: '左上角',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black26,
                  ),
                ),
              ),
            );
          } else {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 111.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.black12,
                    height: 0.5,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                child: Image.network(
                                  images[position - 1],
                                  height: 90,
                                  width: 100,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                  bottom: 5.0,
                                  right: 5.0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 90.0,
                                    height: 25.0,
                                    child: Text(
                                      '全国宠物托运',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                  )),
                            ],
                          )),
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
//                          height: 95.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 180,
//                                height: 40.0,
                                child: Text(
                                  titles[position - 1],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
//                                  softWrap: false,//
                                ),
                              ),
                              position == 100
                                  ? Container(
                                      alignment: Alignment.center,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3.0)),
                                      ),
                                      child: Text(
                                        '8万点赞',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.white),
//                                  softWrap: true,
                                      ),
                                    )
                                  : Container(),
                              Container(
                                width: 180,
//                                color: Colors.blue,
                                child: Text(
                                  '🌟🌟🌟🌟🌟',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black45),
//                                  softWrap: true,
                                ),
                              ),
                              Container(
                                  width: 180,
//                                color: Colors.blue,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        '￥180',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.redAccent),
//                                  softWrap: true,
                                      ),
                                      Text(
                                        '10人托运 杭州',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black26),
                                      ),
                                    ],
                                  ))
                            ],
                          )),
                    ],
                  )
                ],
              ),
            );
          }
        });
  }
}
