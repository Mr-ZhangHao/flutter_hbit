/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-18 13:55:27
* @LastEditors: Jack
* @LastEditTime: 2020-09-04 17:38:45
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/login/views/forgot.dart
*/
import 'dart:convert';

import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/core/model/tfa_type_model.dart';
import 'package:HBit/pages/login/routes/index.dart';
import 'package:HBit/pages/login/server/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  ForgotPage({Key key}) : super(key: key);

  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> with SingleTickerProviderStateMixin {
  final _nameCtr = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  String name = '';

  @override
  void initState() {
    _nameCtr.addListener(() {
      setState(() {
        name = _nameCtr.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text(Tr.of(context).forgetPassword),
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: width(46)),
          child: Column(
            children: <Widget>[
              FocusWidget(
                focusNode: _nameFocus,
                child: InputWidget(
                  obscureText: false,
                  controller: _nameCtr,
                  focusNode: _nameFocus,
                  maxLength: 30,
                  hintText: Tr.of(context).loginAccountHint,
                  suffixIconConstraintsMaxWidth: 160,
                  suffixIconConstraintsMinWidth: 160,
                  suffixIconConstraintsMaxHeight: 60,
                  suffixIconConstraintsMinHeight: 60,
                  maxHeight: 100,
                ),
              ),
              SizedBox(height: height(100)),
              MyButton(
                text: Tr.of(context).Nextstep,
                onPressed: name.length > 0 ? () => next() : null,
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
    );
  }

  void next() async {
    Toast.showLoading('loading...');
    var name = _nameCtr.text;
    TfaTypeModel tfaType = await LoginServer.getVertifyType(1, name);

    Toast.close();
    String item = json.encode(tfaType);
    Routers.push(context, "${LoginRouter.resetPassword}?tfaType=$item");
  }
}
