/*
 * @author chengpenggao
 * @date 2019/10/11
 */
import 'package:flutter/material.dart';
import 'package:luck_pets/lib_utils/Utils.dart';
import 'package:luck_pets/lib_mian_ui/widget/widgets.dart';
import 'package:luck_pets/lib_utils/styles.dart';
import 'package:luck_pets/lib_utils/colors.dart';

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
        CommonUtils.showSnackBar(context, '请输入用户！');
        return;
      }
      if (password.isEmpty) {
        CommonUtils.showSnackBar(context, '请输入密码！');
      }
    }

    return Column(
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
            child: Text('忘记密码？', style: TextStyle(color: Colours.gray_66)),
            onTap: () {
              CommonUtils.showSnackBar(context, '请你联系管理员');
            },
          ),
        ),
        RoundBtn(
          text: '登录',
          margin: EdgeInsets.only(top: 20),
          onPressed: _userLogin,
          radius: 20,
          height: 60,
        )
      ],
    );
  }
}
