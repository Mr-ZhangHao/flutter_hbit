/*
* @message: 登录注册
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Roy
* @LastEditTime: 2020-09-15 10:49:35
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/login/views/register.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/login/model/country_model.dart';
import 'package:HBit/pages/login/routes/index.dart';
import 'package:HBit/pages/login/server/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/routes/routes.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/login/bg.png'), fit: BoxFit.fill)),
      child: Scaffold(
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
                    height: height(250),
                  ),
                ),
                SizedBox(height: height(50)),
                RegisterFromWidget(),
                GestureDetector(
                  onTap: () => Routers.push(context, Routes.login,
                      replace: true, clearStack: true),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: height(48)),
                    child: RichText(
                        text: TextSpan(
                            text: '${Tr.of(context).haveAccount}，',
                            style: TextStyle(color: Color(0xffA2A2A2)),
                            children: [
                          TextSpan(
                              text: Tr.of(context).GoLogin,
                              style: TextStyle(color: kPrimaryColor))
                        ])),
                  ),
                )
              ],
            ),
          ),
        ),
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}

class RegisterFromWidget extends StatefulWidget {
  const RegisterFromWidget({
    Key key,
  }) : super(key: key);

  @override
  _RegisterFromWidgetState createState() => _RegisterFromWidgetState();
}

class _RegisterFromWidgetState extends State<RegisterFromWidget>
    with SingleTickerProviderStateMixin {
  final _nameCtr = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final _codeCtr = TextEditingController();
  final FocusNode _codeFocus = FocusNode();
  final _psw1Ctr = TextEditingController();
  final FocusNode _psw1Focus = FocusNode();
  final _psw2Ctr = TextEditingController();
  final FocusNode _psw2Focus = FocusNode();
  final _inveteCodeCtr = TextEditingController();
  final FocusNode _inveteCodeFocus = FocusNode();

  bool isopen = false;
  bool checked = false;

  TabController _tabController;
  String area = '886';
  String area_name = '台湾';
  CountryModel result;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: width(70)),
      // shadowColor: Color(0xff7EB9F2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: height(24)),
          Text(
            Tr.of(context).WelcomeRegister,
            style: TextStyle(
                color: Colors.black,
                fontSize: sp(48),
                fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width(47)),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.grey[400]))),
            child: TabBar(
              labelColor: kPrimaryColor,
              unselectedLabelColor: kTextColor6,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.symmetric(vertical: width(20)),
              indicatorColor: kPrimaryColor,
              controller: _tabController,
              tabs: <Widget>[
                Text(Tr.of(context).phoneRegistration,
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text(Tr.of(context).emailRegistration,
                    style: TextStyle(fontWeight: FontWeight.w600))
              ],
            ),
          ),
          SizedBox(
            height: height(640),
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                // 手机注册
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: height(10),
                    ),
                    Container(
                      height: height(50),
                      margin: EdgeInsets.symmetric(horizontal: width(46)),
                      child: GestureDetector(
                        onTap: () {
                          ///  Routers.push(context, LoginRouter.country);
                          Navigator.pushNamed(context, LoginRouter.country)
                              .then(( value) {

                           setState(() {
                             List  myList =value;
                             area_name = myList[0];
                             area = myList[1];
                           });

                          });
                        },
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  area_name,
                                  style: TextStyle(
                                      color: Color(0xff126DFF),
                                      fontSize: sp(28)),
                                ),
                                SizedBox(
                                  width: width(10),
                                ),
                                Image(
                                  image: AssetImage(
                                    'images/login/icon_xia.png',
                                  ),
                                  width: width(14),
                                  height: height(10),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width(10), right: width(10)),
                                  child: Container(
                                      width: width(1),
                                      height: height(13),
                                      color: Color(0xffd8d8d8)),
                                ),
                                Text(
                                  '+${area}',
                                  style: TextStyle(
                                      color: Color(0xff323232),
                                      fontSize: sp(28)),
                                ),
                              ],
                            ),
                            /*       Expanded(
                            child: InputWidget(
                              prefixIconConstraintsMaxHeight: 28,
                              prefixIconConstraintsMaxWidth: 100,
                              prefixIconConstraintsMinHeight: 28,
                              prefixIconConstraintsMinWidth: 28,

                              //    prefixIcon: ImageIcon(AssetImage('images/login/zh.png'), color: Color(0xffBFBFBF)),
                              maxHeight: 100,
                              controller: _nameCtr,
                              focusNode: _nameFocus,
                              hintText: Tr.of(context).phoneInputHint,
                              contentPadding: EdgeInsets.symmetric(horizontal: width(10)),
                            ),
                            flex: 1,
                          )*/
                          ],
                        ),
                      ),
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
                          hintText: Tr.of(context).phoneInputHint,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: width(10)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width(46)),
                      child: FocusWidget(
                        focusNode: _codeFocus,
                        child: InputWidget(
                          obscureText: false,
                          controller: _codeCtr,
                          focusNode: _codeFocus,
                          hintText: Tr.of(context).codeInputHint,
                          getVCode: () async {
                            if (_nameCtr.text.isEmpty) {
                              return Toast.showText(Tr.of(context).loginAccountHint);
                            }else{
                              return await getVcode('sms');
                            }
                          },
                          prefixIconConstraintsMaxHeight: 30,
                          prefixIconConstraintsMaxWidth: 120,
                          prefixIconConstraintsMinHeight: 30,
                          prefixIconConstraintsMinWidth: 30,
                          suffixIconConstraintsMaxWidth: 160,
                          suffixIconConstraintsMinWidth: 160,
                          suffixIconConstraintsMaxHeight: 60,
                          suffixIconConstraintsMinHeight: 60,
                          prefixIcon: ImageIcon(
                              AssetImage('images/login/yzm.png'),
                              color: Color(0xffBFBFBF)),
                          maxHeight: 100,
                          contentPadding:
                              EdgeInsets.only(left: width(20), top: height(10)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width(46)),
                      child: FocusWidget(
                        focusNode: _psw1Focus,
                        child: InputWidget(
                          obscureText: !isopen,
                          controller: _psw1Ctr,
                          focusNode: _psw1Focus,
                          hintText: Tr.of(context).loginPwdHint,
                          prefixIconConstraintsMaxHeight: 28,
                          prefixIconConstraintsMaxWidth: 100,
                          prefixIconConstraintsMinHeight: 28,
                          prefixIconConstraintsMinWidth: 28,
                          prefixIcon: ImageIcon(
                              AssetImage('images/login/key.png'),
                              color: Color(0xffBFBFBF)),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              print('object');
                              setState(() => isopen = !isopen);
                            },
                            child: ImageIcon(
                                AssetImage(
                                    'images/login/${isopen ? 'open' : 'close'}.png'),
                                color:
                                    isopen ? kPrimaryColor : Color(0xffBFBFBF)),
                          ),
                          suffixIconConstraintsMaxWidth: 28,
                          suffixIconConstraintsMinWidth: 28,
                          suffixIconConstraintsMinHeight: 28,
                          maxHeight: 100,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: width(20)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width(46)),
                      child: FocusWidget(
                        focusNode: _psw2Focus,
                        child: InputWidget(
                          obscureText: !isopen,
                          controller: _psw2Ctr,
                          focusNode: _psw2Focus,
                          hintText: Tr.of(context).registrationConfirmPassword,
                          prefixIconConstraintsMaxHeight: 28,
                          prefixIconConstraintsMaxWidth: 100,
                          prefixIconConstraintsMinHeight: 28,
                          prefixIconConstraintsMinWidth: 28,
                          prefixIcon: ImageIcon(
                              AssetImage('images/login/key.png'),
                              color: Color(0xffBFBFBF)),
                          suffixIcon: GestureDetector(
                            onTap: () => {setState(() => isopen = !isopen)},
                            child: ImageIcon(
                                AssetImage(
                                    'images/login/${isopen ? 'open' : 'close'}.png'),
                                color:
                                    isopen ? kPrimaryColor : Color(0xffBFBFBF)),
                          ),
                          suffixIconConstraintsMaxWidth: 28,
                          suffixIconConstraintsMinWidth: 28,
                          suffixIconConstraintsMinHeight: 28,
                          maxHeight: 100,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: width(20)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width(46)),
                      child: FocusWidget(
                        focusNode: _inveteCodeFocus,
                        child: InputWidget(
                          prefixIconConstraintsMaxHeight: 28,
                          prefixIconConstraintsMaxWidth: 100,
                          prefixIconConstraintsMinHeight: 28,
                          prefixIconConstraintsMinWidth: 28,
                          prefixIcon: ImageIcon(
                              AssetImage('images/login/yqm.png'),
                              color: Color(0xffBFBFBF)),
                          maxHeight: 100,
                          controller: _inveteCodeCtr,
                          focusNode: _inveteCodeFocus,
                          hintText: Tr.of(context).invitationCodeInputHint,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width(26)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: checked,
                              onChanged: (value) =>
                                  setState(() => checked = value)),
                          Expanded(
                              child: Text(Tr.of(context).termsHint,
                                  style: TextStyle(
                                      fontSize: sp(24),
                                      color: Color(0xff323232))))
                        ],
                      ),
                    )
                  ],
                ),
                // 邮箱注册
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width(46)),
                      child: FocusWidget(
                        focusNode: _nameFocus,
                        child: InputWidget(
                          prefixIconConstraintsMaxHeight: 28,
                          prefixIconConstraintsMaxWidth: 100,
                          prefixIconConstraintsMinHeight: 28,
                          prefixIconConstraintsMinWidth: 28,
                          prefixIcon: ImageIcon(
                              AssetImage('images/login/zh.png'),
                              color: Color(0xffBFBFBF)),
                          maxHeight: 100,
                          controller: _nameCtr,
                          focusNode: _nameFocus,
                          hintText: Tr.of(context).emailInputHint,
                          hintStyle: TextStyle(fontSize: sp(28)),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: width(20)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width(46)),
                      child: FocusWidget(
                        focusNode: _codeFocus,
                        child: InputWidget(
                          obscureText: false,
                          controller: _codeCtr,
                          focusNode: _codeFocus,
                          hintText: Tr.of(context).codeInputHint,
                          getVCode: () async {

                            if (_nameCtr.text.isEmpty) {
                              return Toast.showText(Tr.of(context).loginAccountHint);
                            }else{
                              return await getVcode('email');
                            }

                          },
                          prefixIconConstraintsMaxHeight: 30,
                          prefixIconConstraintsMaxWidth: 120,
                          prefixIconConstraintsMinHeight: 30,
                          prefixIconConstraintsMinWidth: 30,
                          suffixIconConstraintsMaxWidth: 160,
                          suffixIconConstraintsMinWidth: 160,
                          suffixIconConstraintsMaxHeight: 60,
                          suffixIconConstraintsMinHeight: 60,
                          prefixIcon: ImageIcon(
                              AssetImage('images/login/yzm.png'),
                              color: Color(0xffBFBFBF)),
                          maxHeight: 100,
                          contentPadding:
                              EdgeInsets.only(left: width(20), top: height(10)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width(46)),
                      child: FocusWidget(
                        focusNode: _psw1Focus,
                        child: InputWidget(
                          obscureText: !isopen,
                          controller: _psw1Ctr,
                          focusNode: _psw1Focus,
                          hintText: Tr.of(context).loginPwdHint,
                          prefixIconConstraintsMaxHeight: 28,
                          prefixIconConstraintsMaxWidth: 100,
                          prefixIconConstraintsMinHeight: 28,
                          prefixIconConstraintsMinWidth: 28,
                          prefixIcon: ImageIcon(
                              AssetImage('images/login/key.png'),
                              color: Color(0xffBFBFBF)),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              print('object');
                              setState(() => isopen = !isopen);
                            },
                            child: ImageIcon(
                                AssetImage(
                                    'images/login/${isopen ? 'open' : 'close'}.png'),
                                color:
                                    isopen ? kPrimaryColor : Color(0xffBFBFBF)),
                          ),
                          suffixIconConstraintsMaxWidth: 28,
                          suffixIconConstraintsMinWidth: 28,
                          suffixIconConstraintsMinHeight: 28,
                          maxHeight: 100,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: width(20)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width(46)),
                      child: FocusWidget(
                        focusNode: _psw2Focus,
                        child: InputWidget(
                          obscureText: !isopen,
                          controller: _psw2Ctr,
                          focusNode: _psw2Focus,
                          hintText: Tr.of(context).registrationConfirmPassword,
                          prefixIconConstraintsMaxHeight: 28,
                          prefixIconConstraintsMaxWidth: 100,
                          prefixIconConstraintsMinHeight: 28,
                          prefixIconConstraintsMinWidth: 28,
                          prefixIcon: ImageIcon(
                              AssetImage('images/login/key.png'),
                              color: Color(0xffBFBFBF)),
                          suffixIcon: GestureDetector(
                            onTap: () => {setState(() => isopen = !isopen)},
                            child: ImageIcon(
                                AssetImage(
                                    'images/login/${isopen ? 'open' : 'close'}.png'),
                                color:
                                    isopen ? kPrimaryColor : Color(0xffBFBFBF)),
                          ),
                          suffixIconConstraintsMaxWidth: 28,
                          suffixIconConstraintsMinWidth: 28,
                          suffixIconConstraintsMinHeight: 28,
                          maxHeight: 100,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: width(20)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width(46)),
                      child: FocusWidget(
                        focusNode: _inveteCodeFocus,
                        child: InputWidget(
                          prefixIconConstraintsMaxHeight: 28,
                          prefixIconConstraintsMaxWidth: 100,
                          prefixIconConstraintsMinHeight: 28,
                          prefixIconConstraintsMinWidth: 28,
                          prefixIcon: ImageIcon(
                              AssetImage('images/login/yqm.png'),
                              color: Color(0xffBFBFBF)),
                          maxHeight: 100,
                          controller: _inveteCodeCtr,
                          focusNode: _inveteCodeFocus,
                          hintText: Tr.of(context).invitationCodeInputHint,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width(26)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: checked,
                              onChanged: (value) =>
                                  setState(() => checked = value)),
                          Expanded(
                              child: Text(Tr.of(context).termsHint,
                                  style: TextStyle(
                                      fontSize: sp(24),
                                      color: Color(0xff323232))))
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height(20)),
          InkWell(
            onTap: register,
            child: Container(
              width: double.infinity,
              height: height(88),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              alignment: Alignment.center,
              child: Text(Tr.of(context).loginRegister,
                  style: TextStyle(color: Colors.white, fontSize: sp(38))),
            ),
          )
        ],
      ),
    );
  }

  Future<bool> getVcode(type) async {
    if (_nameCtr.text.isEmpty) {
      Toast.showText(Tr.of(context).loginAccountHint);
      return Future.value(false);
    } else {
      try {
        if (type == 'sms') {
          await LoginServer.sms('${area}', _nameCtr.text);
          return Future.value(true);
        } else {
          await LoginServer.email(_nameCtr.text);
          return Future.value(true);
        }
      } catch (e) {
        print(e);
        return Future.value(false);
      }
    }
  }

  void register() async {
    if (_nameCtr.text.isEmpty) {
      Toast.showText(Tr.of(context).loginAccountHint);
    } else if (_codeCtr.text.isEmpty) {
      Toast.showText(Tr.of(context).codeInputHint);
    } else if (_psw1Ctr.text.isEmpty) {
      Toast.showText(Tr.of(context).PasswordEmptyHint);
    } else if (_psw2Ctr.text.isEmpty) {
      Toast.showText(Tr.of(context).confirmPasswordHint);
    } else if (_psw1Ctr.text != _psw2Ctr.text) {
      Toast.showText(Tr.of(context).passwordHint2);
    }  else if (_inveteCodeCtr.text .isEmpty) {
      Toast.showText(Tr.of(context).InvitationCodeHint);
    } else if (!checked) {
      Toast.showText(Tr.of(context).termsHint);
    } else {
      Toast.showLoading('loading');
      try {
        if (_tabController.index == 0) {
          await LoginServer.registerMobile('${area}', _nameCtr.text, _codeCtr.text,
              _psw1Ctr.text, _inveteCodeCtr.text);
        } else {
          await LoginServer.registerEmail(
              _nameCtr.text, _codeCtr.text, _psw1Ctr.text, _inveteCodeCtr.text);
        }
        _nameCtr.text = '';
        _codeCtr.text = '';
        _psw1Ctr.text = '';
        _psw2Ctr.text = '';
        _inveteCodeCtr.text = '';
        Toast.showSuccess(Tr.of(context).registrationSuccess);
        Routers.push(context, Routes.login, clearStack: true, replace: true);
      } catch (e) {
        print(1);
      }
    }
  }
}
