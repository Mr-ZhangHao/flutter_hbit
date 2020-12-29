/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-09-02 11:06:12
* @LastEditors: Jack
* @LastEditTime: 2020-09-03 20:23:30
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/common/verivication/index.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/core/model/enum.dart';
import 'package:HBit/pages/login/server/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class SecurityVerificationWidget extends StatefulWidget {
  final VerificationType verificationType;
  final String account;
  final String area;
  final Function(String code) callBack;
  const SecurityVerificationWidget({
    Key key,
    this.verificationType,
    this.callBack,
    this.account,
    this.area,
  }) : super(key: key);

  @override
  _SecurityVerificationWidgetState createState() => _SecurityVerificationWidgetState();
}

class _SecurityVerificationWidgetState extends State<SecurityVerificationWidget> {
  final _codeCtr = TextEditingController();
  final FocusNode _codeFocus = FocusNode();
  String codeStr = '';
  @override
  void initState() {
    _codeCtr.addListener(() {
      setState(() {
        codeStr = _codeCtr.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: kTransprant,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: height(450),
              margin: EdgeInsets.only(top: height(200), left: width(50), right: width(50)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(width(16)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(height: height(23)),
                  Text(
                    '安全验证',
                    style: TextStyle(color: kTextColor3, fontWeight: FontWeight.bold, fontSize: sp(36)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: width(40)),
                    child: Text(
                        widget.verificationType == VerificationType.email
                            ? '邮箱验证'
                            : widget.verificationType == VerificationType.phone ? '手机验证' : '谷歌验证',
                        style: TextStyle(color: kTextColor3, fontWeight: FontWeight.bold, fontSize: sp(30))),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width(40)),
                    child: FocusWidget(
                      focusNode: _codeFocus,
                      child: InputWidget(
                        obscureText: false,
                        controller: _codeCtr,
                        focusNode: _codeFocus,
                        hintText: '请输入验证码',
                        getVCode: widget.verificationType == VerificationType.google ? null : getVcode,
                        suffixIconConstraintsMaxWidth: 160,
                        suffixIconConstraintsMinWidth: 160,
                        suffixIconConstraintsMaxHeight: 60,
                        suffixIconConstraintsMinHeight: 60,
                        maxHeight: 100,
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: codeStr.length > 0
                        ? () {
                            if (_codeCtr.text.isEmpty) {
                              Toast.showText('验证码不能为空');
                            } else {
                              widget.callBack(_codeCtr.text);
                              Navigator.pop(context);
                            }
                          }
                        : null,
                    disabledColor: kPrimaryColor,
                    disabledTextColor: kTextColor9,
                    child: Text('确定'),
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(width(16)), bottomRight: Radius.circular(width(16)))),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minWidth: double.infinity,
                    height: height(88),
                  )
                ],
              ),
            ),
            SizedBox(height: height(120)),
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () => Navigator.pop(context),
              child: Image.asset('images/login/guanbi.png', width: width(60), height: width(60), fit: BoxFit.fill),
            )
          ],
        ));
  }

  Future<bool> getVcode() async {
    Toast.showLoading('loading...');

    if (widget.account.isEmpty) {
      Toast.close();
      return Toast.showText(Tr.of(context).loginAccountHint);
    }
    try {
      if (widget.verificationType == VerificationType.phone) {
        await LoginServer.sms('', widget.account);
        Toast.close();
        return Future.value(true);
      } else {
        await LoginServer.email(widget.account);
        Toast.close();
        return Future.value(true);
      }
    } catch (e) {
      print(e);
      Toast.close();
      return Future.value(false);
    }
  }
}
