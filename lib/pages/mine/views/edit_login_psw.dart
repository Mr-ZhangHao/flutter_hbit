/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 11:03:58
* @LastEditors: Roy
* @LastEditTime: 2020-09-15 10:55:17
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/views/edit_login_psw.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/common/verivication/vertify_form.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/core/model/tfa_type_model.dart';
import 'package:HBit/pages/login/provider/user_provider.dart';
import 'package:HBit/pages/login/server/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/pages/mine/server/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/sp_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditLoginPswPage extends StatefulWidget {
  final TfaTypeModel tfaType;
  EditLoginPswPage({
    Key key,
    this.tfaType,
  }) : super(key: key);

  @override
  _EditLoginPswPageState createState() => _EditLoginPswPageState();
}

class _EditLoginPswPageState extends State<EditLoginPswPage> {
  final _oldPswCtr = TextEditingController();
  final FocusNode _oldPswFocus = FocusNode();
  final _newPsw1Ctr = TextEditingController();
  final FocusNode _newPsw1Focus = FocusNode();
  final _newPsw2Ctr = TextEditingController();
  final FocusNode _newPsw2Focus = FocusNode();

  final _codeCtr = TextEditingController();
  final FocusNode _codeFocus = FocusNode();

  final _ecodeCtr = TextEditingController();
  final FocusNode _ecodeFocus = FocusNode();

  final _gcodeCtr = TextEditingController();
  final FocusNode _gcodeFocus = FocusNode();

  String errorText = '';

  bool isError = false;

  bool isLoading = false;
  TfaTypeModel tfaType;
  @override
  void initState() {
    super.initState();
    LoginServer.getVertifyType(100, Provider.of<MineProvider>(context, listen: false).userInfo.username)
        .then((res) => setState(() => tfaType = res));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text(Tr.of(context).modifyLoginPassword),
        centerTitle: true,
        elevation: 1,
        leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Routers.goBack(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png', width: width(22), height: height(36)),
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: width(40)),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: height(8), horizontal: width(10)),
                margin: EdgeInsets.symmetric(vertical: height(28)),
                decoration: BoxDecoration(color: Color(0xffF6F9FB), borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.info, color: Color(0xffCAD3E1), size: sp(30)),
                    SizedBox(width: width(10)),
                    Expanded(child: Text(Tr.of(context).modifyLoginPasswordHint, style: TextStyle(fontSize: sp(23))))
                  ],
                ),
              ),
              SizedBox(height: height(30)),
              FocusWidget(
                focusNode: _oldPswFocus,
                child: InputWidget(
                  focusNode: _oldPswFocus,
                  controller: _oldPswCtr,
                  maxHeight: 100,
                  obscureText: true,
                  hintText: Tr.of(context).loginPwdHint,
                  prefixIconConstraintsMaxWidth: 200,
                  prefixIconConstraintsMinWidth: 160,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  contentPadding: EdgeInsets.only(bottom: height(12)),
                  hintStyle: TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text('${Tr.of(context).originalLoginPassword}：', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              FocusWidget(
                focusNode: _newPsw1Focus,
                child: InputWidget(
                  focusNode: _newPsw1Focus,
                  controller: _newPsw1Ctr,
                  maxHeight: 100,
                  obscureText: true,
                  hintText: Tr.of(context).LoginPasswordhint,

                  prefixIconConstraintsMaxWidth: 200,
                  prefixIconConstraintsMinWidth: 160,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  contentPadding: EdgeInsets.only(bottom: height(12)),
                  hintStyle: TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text('${Tr.of(context).Newloginpassword}：', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              FocusWidget(
                focusNode: _newPsw2Focus,
                child: InputWidget(
                  controller: _newPsw2Ctr,
                  focusNode: _newPsw2Focus,
                  maxHeight: 100,
                  obscureText: true,
                  hintText: Tr.of(context).RepeatPassword,
                  prefixIconConstraintsMaxWidth: 200,
                  prefixIconConstraintsMinWidth: 160,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  contentPadding: EdgeInsets.only(bottom: height(12)),
                  hintStyle: TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text('${Tr.of(context).ConfirmNewPassword}：', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              BuildVertifyForm(
                  tfaType: tfaType?.tfaType ?? 0,
                  context: context,
                  codeFocus: _codeFocus,
                  codeCtr: _codeCtr,
                  ecodeFocus: _ecodeFocus,
                  ecodeCtr: _ecodeCtr,
                  gcodeFocus: _gcodeFocus,
                  gcodeCtr: _gcodeCtr),
              SizedBox(height: height(30)),
              Visibility(visible: isError, child: Text(errorText, style: TextStyle(color: Color(0xffFF3838)))),
              SizedBox(height: height(50)),
              Consumer<MineProvider>(
                builder: (BuildContext context, MineProvider model, Widget child) {
                  return MyButton(text: Tr.of(context).submit, onPressed: _confirm);
                },
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
    );
  }

  void _confirm() async {
    int tfaType = this.tfaType?.tfaType;
    if (_oldPswCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).oldpasswordEmptyHint;
      });
    } else if (_newPsw1Ctr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).PasswordEmptyHint;
      });
    } else if (_newPsw2Ctr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).confirmPasswordHint;
      });
    } else if (_newPsw1Ctr.text != _newPsw2Ctr.text) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).passwordHint2;
      });
    } else if ((tfaType == 1 || tfaType == 3 || tfaType == 5 || tfaType == 6) && _codeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).PhoneCodeHint;
      });
    } else if ((tfaType == 2 || tfaType == 4 ) && _ecodeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).EmailCodeHint;
      });
    } else if ((tfaType == 7 ) && _gcodeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).GoogleCodeHint;
      });
    }  else {
      setState(() {
        isLoading = false;
        isError = false;
        errorText = '';
      });
      Toast.showLoading('loading...');
      try {
        await MineServer.editLoginPsw(_oldPswCtr.text, _newPsw1Ctr.text, _ecodeCtr.text, _codeCtr.text, _gcodeCtr.text);
        _codeCtr.text = '';
        _gcodeCtr.text = '';
        _oldPswCtr.text = '';
        _newPsw1Ctr.text = '';
        _newPsw2Ctr.text = '';
        _ecodeCtr.text = '';

        Toast.showText(Tr.of(context).Passwordchanged);
        Provider.of<UserProvider>(context, listen: false).setIsLogin(false);
        await SpUtils.sp.clear();
        Routers.push(context, '/login', replace: true, clearStack: true);
      } catch (e) {
        print(e);
      }
    }
  }
}
