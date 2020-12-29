/*
* @message: 登录注册
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Jack
* @LastEditTime: 2020-09-03 20:27:03
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/login/login_screen.dart
*/
import 'dart:async';

import 'package:HBit/common/captcha/block_puzzle_captcha.dart';
import 'package:HBit/common/captcha/click_word_captcha.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/dialog_util.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/common/verivication/index.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/core/model/enum.dart';
import 'package:HBit/pages/login/provider/user_provider.dart';
import 'package:HBit/pages/login/routes/index.dart';
import 'package:HBit/pages/login/server/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/routes/routes.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/sp_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_geetest_plugin/flutter_geetest_plugin.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _LoginScreenState extends State<LoginScreen> {
  // 测试数据
  // List<SalesData> dataSource = <SalesData>[
  //   SalesData('周一', 1.1),
  //   SalesData('周二', 1.2),
  //   SalesData('周三', 1.3),
  //   SalesData('周四', 2.4),
  //   SalesData('周五', 2.5),
  //   SalesData('周六', 3.1),
  //   SalesData('周日', 4.9)
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/login/bg.png'), fit: BoxFit.fill)),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: kTransprant,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kTransprant,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'images/login/logo.png',
                    fit: BoxFit.contain,
                    width: width(250),
                    height: width(250),
                  ),
                ),
                SizedBox(height: height(130)),
                LoginFromWidget(),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

class LoginFromWidget extends StatefulWidget {
  const LoginFromWidget({
    Key key,
  }) : super(key: key);

  @override
  _LoginFromWidgetState createState() => _LoginFromWidgetState();
}

class _LoginFromWidgetState extends State<LoginFromWidget> {
  final _nameCtr = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final _pswCtr = TextEditingController();
  final FocusNode _pswFocus = FocusNode();

  Timer timer;
  String _platformVersion = 'Unknown';

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

//   Future<void> initPlatformState() async {
//     String platformVersion;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       platformVersion = await FlutterGeetestPlugin.platformVersion;
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _platformVersion = platformVersion;
//     });
//   }

//   Future<void> getGeetest() async {
//     String result;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       result = await FlutterGeetestPlugin.getGeetest(
//           'https://www.geetest.com/demo/gt/register-slide', 'https://www.geetest.com/demo/gt/validate-slide');
//     } on Exception {
// //      platformVersion = 'Failed to get platform version.';
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _platformVersion = result;
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: width(70), vertical: height(20)),
      elevation: 5,
      shadowColor: Color(0xff7EB9F2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: <Widget>[
          // Text('$_platformVersion\n'),
          // RaisedButton(
          //   onPressed: getGeetest,
          //   child: Text("geetest"),
          // ),
          SizedBox(height: height(54)),
          Text(
           Tr.of(context).welcomeLogin,
            style: TextStyle(color: Colors.black, fontSize: sp(48), fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width(46)),
            child: FocusWidget(
              focusNode: _nameFocus,
              child: InputWidget(
                prefixIconConstraintsMaxHeight: 28,
                prefixIconConstraintsMaxWidth: 100,
                prefixIconConstraintsMinHeight: 28,
                prefixIconConstraintsMinWidth: 28,
                prefixIcon: ImageIcon(AssetImage('images/login/zh.png'), color: Color(0xffBFBFBF)),
                maxHeight: 100,
                controller: _nameCtr,
                focusNode: _nameFocus,
                hintText:  Tr.of(context).loginAccountHint,
                contentPadding: EdgeInsets.symmetric(horizontal: width(20)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width(46)),
            child: FocusWidget(
              focusNode: _pswFocus,
              child: InputWidget(
                prefixIconConstraintsMaxHeight: 28,
                prefixIconConstraintsMaxWidth: 100,
                prefixIconConstraintsMinHeight: 28,
                prefixIconConstraintsMinWidth: 28,
                suffixIconConstraintsMaxWidth: 160,
                suffixIconConstraintsMinWidth: 160,
                suffixIconConstraintsMaxHeight: 60,
                suffixIconConstraintsMinHeight: 60,
                prefixIcon: ImageIcon(AssetImage('images/login/key.png'), color: Color(0xffBFBFBF)),
                maxHeight: 100,
                obscureText: true,
                controller: _pswCtr,
                focusNode: _pswFocus,
                hintText:  Tr.of(context).loginPwdHint,
                contentPadding: EdgeInsets.only(left: width(20), top: width(10)),
              ),
            ),
          ),
          SizedBox(height: height(30)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(46)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Routers.push(context, LoginRouter.register, replace: true, clearStack: true),
                  child: Text( Tr.of(context).loginRegister, style: TextStyle(color: kPrimaryColor)),
                ),
                GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => Routers.push(context, LoginRouter.forgot),
                    child: Text( Tr.of(context).forgetPassword, style: TextStyle(color: kPrimaryColor))),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              _login();
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: height(36)),
              height: height(88),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12))),
              alignment: Alignment.center,
              child: Text(
                Tr.of(context).login,
                style: TextStyle(color: Colors.white, fontSize: sp(38)),
              ),
            ),
          )
        ],
      ),
    );
  }

  _login() async {
    if (_nameCtr.text.isEmpty) {
      Toast.showText( Tr.of(context).loginAccountHint);
    } else if (_pswCtr.text.isEmpty) {
      Toast.showText( Tr.of(context).loginPwdHint);
    } else {
      //文字验证
      // loadingBlockPuzzle(_scaffoldKey.currentContext);
      var loginData;
      if (_nameCtr.text.contains('@')) {
        Toast.showLoading('loading...');
        try {
          loginData = await LoginServer.loginEmail(_nameCtr.text, _pswCtr.text);
        } catch (e) {
          print(e);
        }
      } else {
        Toast.showLoading('loading...');
        try {
          loginData = await LoginServer.loginMobile(_nameCtr.text, _pswCtr.text);
        } catch (e) {
          print(e);
        }
      }
      Toast.close();
      _confirm('code', loginData['data']);

      /*
        //验证码 验证登录
        var accountType = loginData['data']['tfa_type'];
      VerificationType type = accountType == 1
          ? VerificationType.phone
          : accountType == 2 ? VerificationType.google : VerificationType.email;

      showCenterDialog(
          _scaffoldKey.currentContext,
          SecurityVerificationWidget(
              verificationType: type,
              account: _nameCtr.text,
              callBack: (code) async {
                _confirm(code, loginData['data']);
              }));*/
     // loadingClickWord(_scaffoldKey.currentContext);
    }
  }

  _confirm(code, loginData) async {
    Toast.close();
    try {
      Toast.showLoading('loading');
      var data = await LoginServer.authLogin(loginData['login_token'], loginData['tfa_type'], code);
      await SpUtils.sp.setString('token', data['data']['token']);
      Provider.of<UserProvider>(context, listen: false).setIsLogin(true);
      Routers.push(context, Routes.home, replace: true, clearStack: true);
      Toast.showSuccess('${Tr.of(context).loginSuccessful}');
    } catch (e) {
      GlobalConfig.errorTips(e);
      print(e);
    }
  }

  void loadingClickWord(BuildContext context, {barrierDismissible = true}) {
    showDialog<Null>(
      context: _scaffoldKey.currentContext,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return ClickWordCaptcha(
          onSuccess: (v) async {
            var loginData;
            if (_nameCtr.text.contains('@')) {
              Toast.showLoading('loading...');
              try {
                loginData = await LoginServer.loginEmail(_nameCtr.text, _pswCtr.text);
              } catch (e) {
                print(e);
              }
            } else {
              Toast.showLoading('loading...');
              try {
                loginData = await LoginServer.loginMobile(_nameCtr.text, _pswCtr.text);
              } catch (e) {
                print(e);
              }
            }
            Toast.close();
            var accountType = loginData['data']['tfa_type'];
            VerificationType type = accountType == 1
                ? VerificationType.phone
                : accountType == 2 ? VerificationType.google : VerificationType.email;

            showCenterDialog(
                _scaffoldKey.currentContext,
                SecurityVerificationWidget(
                    verificationType: type,
                    account: _nameCtr.text,
                    callBack: (code) async {
                      _confirm(code, loginData['data']);
                    }));
          },
          onFail: () {
            print('失败');
          },
        );
      },
    );
  }

  void loadingBlockPuzzle(BuildContext context, {barrierDismissible = true}) {
    showDialog<Null>(
      context: _scaffoldKey.currentContext,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return BlockPuzzleCaptchaPage(
          onSuccess: (v) async {
            var loginData;
            if (_nameCtr.text.contains('@')) {
              Toast.showLoading('loading...');
              try {
                loginData = await LoginServer.loginEmail(_nameCtr.text, _pswCtr.text);
              } catch (e) {
                print(e);
              }
            } else {
              Toast.showLoading('loading...');
              try {
                loginData = await LoginServer.loginMobile(_nameCtr.text, _pswCtr.text);
              } catch (e) {
                print(e);
              }
            }
            Toast.close();
            var accountType = loginData['data']['tfa_type'];
            VerificationType type = accountType == 1
                ? VerificationType.phone
                : accountType == 2 ? VerificationType.google : VerificationType.email;

            showCenterDialog(
                _scaffoldKey.currentContext,
                SecurityVerificationWidget(
                    verificationType: type,
                    account: _nameCtr.text,
                    callBack: (code) async {
                      _confirm(code, loginData['data']);
                    }));
          },
          onFail: () {
            print('失败');
          },
        );
      },
    );
  }
}
