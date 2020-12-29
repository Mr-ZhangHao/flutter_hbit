/*
* @message: 登录
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Jack
* @LastEditTime: 2020-08-13 16:52:53
* @Deprecated: 否
* @FilePath: /archimedes/lib/pages/mine/views/account.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/common/verivication/vertify_form.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/pages/wallet/provider/index.dart';
import 'package:HBit/pages/wallet/server/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/constants/index.dart';
import 'package:provider/provider.dart';

class VerificationPage extends StatefulWidget {
  VerificationPage({Key key}) : super(key: key);

  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<VerificationPage> {
  final _pswCtr = TextEditingController();
  final FocusNode _pswFocus = FocusNode();

  final _codeCtr = TextEditingController();
  final FocusNode _codeFocus = FocusNode();

  final _ecodeCtr = TextEditingController();
  final FocusNode _ecodeFocus = FocusNode();

  final _gcodeCtr = TextEditingController();
  final FocusNode _gcodeFocus = FocusNode();

  String errorText = '';

  bool isError = false;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.center,
            child: Image.asset('images/mine/back@2x.png', width: width(22), height: height(36)),
          ),
        ),
        brightness: Brightness.light,
        title: Text(
          '${Tr.of(context).assetsafetyverification}',
          style: TextStyle(color: kTextColor3, fontSize: sp(36)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(top: height(18)),
        decoration: BoxDecoration(border: Border(top: BorderSide(color: kLineColor1, width: width(1)))),
        child: Consumer<WallerProvider>(
          builder: (BuildContext context, WallerProvider model, Widget child) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: width(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BuildVertifyForm(
                      tfaType: model.withdrawField.tfaType ?? 0,
                      context: context,
                      codeFocus: _codeFocus,
                      codeCtr: _codeCtr,
                      ecodeFocus: _ecodeFocus,
                      ecodeCtr: _ecodeCtr,
                      gcodeFocus: _gcodeFocus,
                      gcodeCtr: _gcodeCtr),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('${Tr.of(context).Confirm}',
                              style:
                                  TextStyle(color: Color(0xff323232), fontSize: sp(28), fontWeight: FontWeight.bold)),
                        ),
                        FocusWidget(
                          focusNode: _pswFocus,
                          child: InputWidget(
                            maxHeight: 100,
                            obscureText: true,
                            focusNode: _pswFocus,
                            hintText: '${Tr.of(context).moneyPassword}',
                            hintStyle: TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                            controller: _pswCtr,
                          ),
                        ),
                        SizedBox(height: width(60))
                      ],
                    ),
                  ),
                  Visibility(visible: isError, child: Text(errorText, style: TextStyle(color: Color(0xffFF3838)))),
                  Container(
                    child: MyButton(
                      text: '${Tr.of(context).Confirm}',
                      onPressed: _confirm,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      )),
    );
  }

  void _confirm() async {
    WallerProvider model = Provider.of<WallerProvider>(context, listen: false);
    int tfaType = model.withdrawField.tfaType;
    if ((tfaType == 1 || tfaType == 3 || tfaType == 5 || tfaType == 6) && _codeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = '${Tr.of(context).PhoneCodeHint}';
      });
    } else if ((tfaType == 2 || tfaType == 4 || tfaType == 5 || tfaType == 6) && _ecodeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = '${Tr.of(context).EmailCodeHint}';
      });
    } else if ((tfaType == 3 || tfaType == 4 || tfaType == 5 || tfaType == 7) && _gcodeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = '${Tr.of(context).GoogleCodeHint}';
      });
    } else if (_pswCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = '${Tr.of(context).moneypwdEmptyHint}';
      });
    } else {
      setState(() {
        isLoading = false;
        isError = false;
        errorText = '';
      });
      Toast.showLoading('loading...');
      try {
        var data = {
          "coin_id": model.withdrawField.coinId,
          "chain_name": model.withdrawField.chainName,
          "address": model.withdrawField.address,
          "number": model.withdrawField.number,
          "pay_password": _pswCtr.text,
          "sms_code": _codeCtr.text,
          "google_code": _gcodeCtr.text,
          "email_code": _ecodeCtr.text
        };
        WalletServer.whitdraw(data).then((data) {
          print("---api-request--->url--> $data");
          _ecodeCtr.text = '';
          _codeCtr.text = '';
          _gcodeCtr.text = '';
          _pswCtr.text = '';
          Toast.showSuccess('${Tr.of(context).assetSuccessfulwithdrawal}');
          Provider.of<WallerProvider>(context, listen: false)
            ..getCoinList()
            ..setCurrentCoin(model.withdrawField.chainName);
        });
      } catch (e) {
        print(e);
      }
    }
  }
}
