/*
 * @author chengpenggao
 * @date 2019/10/15
 */

import 'package:flutter/material.dart';
import 'package:luck_pets/lib_utils/styles.dart';
import 'package:luck_pets/lib_utils/colors.dart';
import 'package:luck_pets/lib_config/Config.dart';

///登录 （用户/密码）
class LoginItem extends StatefulWidget {
  final IconData preIcon;
  final TextEditingController controller;
  final String hitText;
  final bool hasSuffixIcon;

  const LoginItem(
      {Key key,
      this.preIcon,
      this.controller,
      this.hitText,
      this.hasSuffixIcon = false})
      : super(key: key);

  @override
  _LoginItemState createState() => _LoginItemState();
}

class _LoginItemState extends State<LoginItem> {
  bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.hasSuffixIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          iconSize: 28,
          icon: new Icon(
            widget.preIcon,
            color: Colours.gray_33,
          ),
        ),
        Gaps.wGaps30,
        Expanded(
          child: TextField(
            obscureText: _obscureText,
            controller: widget.controller,
            style: TextStyle(color: Colours.gray_33, fontSize: 24),
            decoration: InputDecoration(
                hintText: widget.hitText,
                hintStyle: TextStyle(color: Colours.gray_f0, fontSize: 24),
                suffixIcon: widget.hasSuffixIcon
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colours.gray_33,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : null,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colours.green_de)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colours.green_de))),
          ),
        )
      ],
    );
  }
}

class RoundBtn extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final double radius;
  final Color bgColor;
  final Color splashColor;

  final Widget child;
  final String text;

  final TextStyle style;

  final VoidCallback onPressed;

  const RoundBtn(
      {Key key,
      this.width,
      this.height,
      this.margin,
      this.radius,
      this.bgColor,
      this.splashColor,
      this.text,
      this.style,
      this.onPressed,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _bgColor = bgColor ?? Theme.of(context).primaryColor;
    BorderRadius _bordeRadius = BorderRadius.circular(radius ?? (height / 2));
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: Material(
        borderRadius: _bordeRadius,
        color: _bgColor,
        child: InkWell(
          borderRadius: _bordeRadius,
          onTap: () => onPressed(),
          child: child ??
              Center(
                child: Text(
                  text,
                  style:
                      style ?? TextStyle(color: Colours.white_19, fontSize: 16),
                ),
              ),
        ),
      ),
    );
  }
}

class StatusViews extends StatelessWidget {
  const StatusViews(this.status, {Key key, this.onTap}) : super(key: key);
  final int status;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case LoadStatus.fail:
        return new Container(
          width: double.infinity,
          child: new Material(
            color: Colors.white,
            child: new InkWell(
              onTap: () {
                onTap();
              },
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "网络出问题了～ 请您查看网络设置",
                  ),
                  new Text(
                    "点击屏幕，重新加载",
                  ),
                ],
              ),
            ),
          ),
        );
        break;
      case LoadStatus.loading:
        return new Container(
          alignment: Alignment.center,
          color: Colours.gray_f0,
          child: new ProgressView(),
        );
        break;
      case LoadStatus.empty:
        return new Container(
          color: Colors.white,
          width: double.infinity,
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "空空如也～",
                ),
              ],
            ),
          ),
        );
        break;
      default:
        return Container();
        break;
    }
  }
}

class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new SizedBox(
        width: 24.0,
        height: 24.0,
        child: new CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
