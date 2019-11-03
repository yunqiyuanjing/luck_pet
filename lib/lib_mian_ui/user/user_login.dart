/*
 * @author chengpenggao
 * @date 2019/10/11
 */
import 'package:flutter/material.dart';
import 'package:luck_pets/lib_utils/Utils.dart';
import 'package:luck_pets/lib_mian_ui/widget/widgets.dart';
import 'package:luck_pets/lib_utils/styles.dart';
import 'package:luck_pets/lib_utils/colors.dart';
import 'package:luck_pets/lib_utils/NavigatorUtils.dart';


class LoginPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/imagers/ic_login_bg.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          LoginBody(),
        ],
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerName = new TextEditingController();
    TextEditingController _controllerPwd = new TextEditingController();

    void _userLogin() {
      String username = _controllerName.text;
      String password = _controllerPwd.text;
      if (username.isEmpty) {
        CommonUtils.showSnackBar(context, '请输入用户名');
        return;
      }
      if (password.isEmpty) {
        CommonUtils.showSnackBar(context, '请输入密码！');
        return;
      }
      CommonUtils.showSnackBar(context, '登录成功');
      NavigatorUtils.pushReplacement(context, 'partner');
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 15, right: 20),
            child: Column(
              children: <Widget>[
                LoginItem(
                  preIcon: Icons.person,
                  controller: _controllerName,
                  hitText: '请输入用户名',
                ),
                Gaps.hGaps30,
                LoginItem(
                  preIcon: Icons.lock,
                  controller: _controllerPwd,
                  hasSuffixIcon: true,
                  hitText: '请输入密码',
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child:
                        Text('忘记密码？', style: TextStyle(color: Colours.gray_66)),
                    onTap: () {
                      CommonUtils.showSnackBar(context, '请你联系管理员');
                    },
                  ),
                ),
                RoundBtn(
                  text: '登录',
                  margin: EdgeInsets.only(top: 20),
                  onPressed: () {
                    _userLogin();
                  },
                  bgColor: Colours.green_1,
                  radius: 20,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  height: 60,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
