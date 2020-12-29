/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-18 13:55:27
* @LastEditors: Roy
* @LastEditTime: 2020-09-15 10:47:35
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/login/views/reset_pssword.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/form/lable_input.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/core/model/tfa_type_model.dart';
import 'package:HBit/pages/login/server/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/routes/routes.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  final TfaTypeModel tfaType;
  ResetPasswordPage({Key key, this.tfaType}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

// 二次验证类型: 0:关闭 1:手机验证 2:邮箱验证 3:手机+谷歌 4:邮箱+谷歌 5:手机+邮箱+谷歌 6:手机+邮箱 7:谷歌
class _ResetPasswordPageState extends State<ResetPasswordPage> with SingleTickerProviderStateMixin {
  final _psw1Ctr = TextEditingController();
  final FocusNode _psw1Focus = FocusNode();
  final _psw2Ctr = TextEditingController();
  final FocusNode _psw2Focus = FocusNode();
  final _codeCtr = TextEditingController();
  final FocusNode _codeFocus = FocusNode();

  final _ecodeCtr = TextEditingController();
  final FocusNode _ecodeFocus = FocusNode();

  final _gcodeCtr = TextEditingController();
  final FocusNode _gcodeFocus = FocusNode();

  // 此账号未注册，请重新输入
  // 输入的账号有误，请重新输入
  String errorText = '';

  bool isError = false;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text( Tr.of(context).resetPassword),
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: width(46)),
          // height: MediaQuery.of(context).size.height - height(200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FocusWidget(
                focusNode: _psw1Focus,
                child: InputWidget(
                  obscureText: true,
                  controller: _psw1Ctr,
                  focusNode: _psw1Focus,
                  hintText:  Tr.of(context).loginPwdHint,
                  suffixIconConstraintsMaxWidth: 160,
                  suffixIconConstraintsMinWidth: 160,
                  suffixIconConstraintsMaxHeight: 60,
                  suffixIconConstraintsMinHeight: 60,
                  maxHeight: 100,
                ),
              ),
              FocusWidget(
                focusNode: _psw2Focus,
                child: InputWidget(
                  obscureText: true,
                  controller: _psw2Ctr,
                  focusNode: _psw2Focus,
                  hintText:  Tr.of(context).confirmPassword,
                  suffixIconConstraintsMaxWidth: 160,
                  suffixIconConstraintsMinWidth: 160,
                  suffixIconConstraintsMaxHeight: 60,
                  suffixIconConstraintsMinHeight: 60,
                  maxHeight: 100,
                ),
              ),
              SizedBox(height: height(20)),
              buildVertifyForm(),
              SizedBox(height: height(100)),
              MyButton(isLoading: isLoading, text:     Tr.of(context).Confirm, onPressed: confirm),
              SizedBox(height: height(20)),
              Visibility(visible: isError, child: Text(errorText, style: TextStyle(color: Color(0xffFF3838)))),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget buildVertifyForm() {
    if (widget.tfaType.tfaType == 1) {
      // 手机验证
      return LabelTipsInput(
        codeFocus: _codeFocus,
        codeCtr: _codeCtr,
        userName: widget.tfaType.mobile,
        isEmail: false,
      );
    } else if (widget.tfaType.tfaType == 2) {
      // 邮箱验证
      return LabelTipsInput(
        codeFocus: _ecodeFocus,
        codeCtr: _ecodeCtr,
        userName: widget.tfaType.email,
        isEmail: true,
      );
    } else if (widget.tfaType.tfaType == 3) {
      // 手机加谷歌
      return Column(
        children: <Widget>[
          LabelTipsInput(
            codeFocus: _codeFocus,
            codeCtr: _codeCtr,
            userName: widget.tfaType.mobile,
            isEmail: false,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                Tr.of(context).Googleverificationcode,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: sp(30), color: kTextColor3, fontWeight: FontWeight.bold),
              ),
              FocusWidget(
                focusNode: _gcodeFocus,
                child: InputWidget(
                  obscureText: false,
                  controller: _gcodeCtr,
                  focusNode: _gcodeFocus,
                  hintText:   Tr.of(context).GoogleVerificationCodeHint,
                  suffixIconConstraintsMaxWidth: 160,
                  suffixIconConstraintsMinWidth: 160,
                  suffixIconConstraintsMaxHeight: 60,
                  suffixIconConstraintsMinHeight: 60,
                  maxHeight: 100,
                ),
              )
            ],
          )
        ],
      );
    } else if (widget.tfaType.tfaType == 4) {
      // 邮箱加谷歌
      return Column(
        children: <Widget>[
          LabelTipsInput(
            codeFocus: _ecodeFocus,
            codeCtr: _ecodeCtr,
            userName: widget.tfaType.email,
            isEmail: true,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                Tr.of(context).Googleverificationcode,

                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: sp(30), color: kTextColor3, fontWeight: FontWeight.bold),
              ),
              FocusWidget(
                focusNode: _gcodeFocus,
                child: InputWidget(
                  obscureText: false,
                  controller: _gcodeCtr,
                  focusNode: _gcodeFocus,
                  hintText:             Tr.of(context).GoogleVerificationCodeHint,

                  suffixIconConstraintsMaxWidth: 160,
                  suffixIconConstraintsMinWidth: 160,
                  suffixIconConstraintsMaxHeight: 60,
                  suffixIconConstraintsMinHeight: 60,
                  maxHeight: 100,
                ),
              )
            ],
          )
        ],
      );
    } else if (widget.tfaType.tfaType == 5) {
      // 手机+邮箱+谷歌
      return Column(
        children: <Widget>[
          LabelTipsInput(
            codeFocus: _ecodeFocus,
            codeCtr: _ecodeCtr,
            userName: widget.tfaType.email,
            isEmail: true,
          ),
          LabelTipsInput(
            codeFocus: _codeFocus,
            codeCtr: _codeCtr,
            userName: widget.tfaType.mobile,
            isEmail: false,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                Tr.of(context).Googleverificationcode,

                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: sp(30), color: kTextColor3, fontWeight: FontWeight.bold),
              ),
              FocusWidget(
                focusNode: _gcodeFocus,
                child: InputWidget(
                  obscureText: false,
                  controller: _gcodeCtr,
                  focusNode: _gcodeFocus,
                  hintText:  Tr.of(context).GoogleVerificationCodeHint,
                  suffixIconConstraintsMaxWidth: 160,
                  suffixIconConstraintsMinWidth: 160,
                  suffixIconConstraintsMaxHeight: 60,
                  suffixIconConstraintsMinHeight: 60,
                  maxHeight: 100,
                ),
              )
            ],
          )
        ],
      );
    } else if (widget.tfaType.tfaType == 6) {
      // 手机+邮箱
      return Column(
        children: <Widget>[
          LabelTipsInput(
            codeFocus: _codeFocus,
            codeCtr: _codeCtr,
            userName: widget.tfaType.mobile,
            isEmail: false,
          ),
          LabelTipsInput(
            codeFocus: _ecodeFocus,
            codeCtr: _ecodeCtr,
            userName: widget.tfaType.email,
            isEmail: true,
          ),
        ],
      );
    } else if (widget.tfaType.tfaType == 7) {
      // 谷歌
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            Tr.of(context).Googleverificationcode,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: sp(30), color: kTextColor3, fontWeight: FontWeight.bold),
          ),
          FocusWidget(
            focusNode: _gcodeFocus,
            child: InputWidget(
              obscureText: false,
              controller: _gcodeCtr,
              focusNode: _gcodeFocus,
              hintText: Tr.of(context).GoogleVerificationCodeHint,
              suffixIconConstraintsMaxWidth: 160,
              suffixIconConstraintsMinWidth: 160,
              suffixIconConstraintsMaxHeight: 60,
              suffixIconConstraintsMinHeight: 60,
              maxHeight: 100,
            ),
          )
        ],
      );
    } else {
      return SizedBox();
    }
  }

  // 确认
  void confirm() async {
    if (_psw1Ctr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).PasswordEmptyHint;
      });
    } else if (_psw2Ctr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).confirmPasswordHint;
      });
    } else if (_psw1Ctr.text != _psw2Ctr.text) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).passwordHint2;
      });
    } else if ((widget.tfaType.tfaType == 1 ||
            widget.tfaType.tfaType == 3 ||
            widget.tfaType.tfaType == 5 ||
            widget.tfaType.tfaType == 6) &&
        _codeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).PhoneCodeHint;
      });
    } else if ((widget.tfaType.tfaType == 2 ||
            widget.tfaType.tfaType == 4 ||
            widget.tfaType.tfaType == 5 ||
            widget.tfaType.tfaType == 6) &&
        _ecodeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).EmailCodeHint;
      });
    } else if ((widget.tfaType.tfaType == 3 ||
            widget.tfaType.tfaType == 4 ||
            widget.tfaType.tfaType == 5 ||
            widget.tfaType.tfaType == 7) &&
        _gcodeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).Googleverificationcode;
      });
    } else {
      setState(() {
        isLoading = true;
        isError = false;
        errorText = '';
      });
      if ((widget.tfaType.tfaType == 1 ||
          widget.tfaType.tfaType == 3 ||
          widget.tfaType.tfaType == 5 ||
          widget.tfaType.tfaType == 6)) {
        // 手机必填
        Map data = {
          "mobile": widget.tfaType.mobile,
          "sms_code": _codeCtr.text,
          "login_password": _psw1Ctr.text,
          "email_code": _ecodeCtr.text,
          "google_code": _gcodeCtr.text
        };
        await LoginServer.resetPswbyMobile(data);
        Toast.showSuccess(Tr.of(context).Passwordreset);
        _codeCtr.text = '';
        _ecodeCtr.text = '';
        _gcodeCtr.text = '';
        _psw1Ctr.text = '';
        _psw2Ctr.text = '';
        setState(() {
          isLoading = false;
          isError = false;
          errorText = '';
        });
      } else {
        Map data = {
          "email": widget.tfaType.email,
          "sms_code": _codeCtr.text,
          "login_password": _psw1Ctr.text,
          "email_code": _ecodeCtr.text,
          "google_code": _gcodeCtr.text
        };
        await LoginServer.resetPswbyEmail(data);
        Toast.showSuccess(Tr.of(context).Passwordreset);
        _codeCtr.text = '';
        _ecodeCtr.text = '';
        _gcodeCtr.text = '';
        _psw1Ctr.text = '';
        _psw2Ctr.text = '';
        setState(() {
          isLoading = false;
          isError = false;
          errorText = '';
        });
      }
      Routers.push(context, Routes.login, clearStack: true, replace: true);
    }
  }
}
