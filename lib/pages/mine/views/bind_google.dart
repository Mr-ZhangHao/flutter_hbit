/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 11:03:58
* @LastEditors: Jack
* @LastEditTime: 2020-09-04 16:17:49
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/views/bind_google.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/common/verivication/vertify_form.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/core/model/tfa_type_model.dart';
import 'package:HBit/pages/login/server/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/pages/mine/server/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BindGooglePage extends StatefulWidget {
  final String userName;
  BindGooglePage({Key key, this.userName}) : super(key: key);

  @override
  _BindGooglePageState createState() => _BindGooglePageState();
}

class _BindGooglePageState extends State<BindGooglePage> {
  final _phoneCtr = TextEditingController();
  final FocusNode _phoneFocus = FocusNode();

  final _codeCtr = TextEditingController();
  final FocusNode _codeFocus = FocusNode();

  final _ecodeCtr = TextEditingController();
  final FocusNode _ecodeFocus = FocusNode();

  final _gcodeCtr = TextEditingController();
  final FocusNode _gcodeFocus = FocusNode();

  String errorText = '';

  bool isError = false;

  bool isLoading = false;

  final TextStyle style1 = TextStyle(color: Color(0xff6E7581), fontSize: sp(24), fontWeight: FontWeight.normal);

  final TextStyle style2 = TextStyle(color: Color(0xff323232), fontSize: sp(24), fontWeight: FontWeight.bold);
  TfaTypeModel tfaType;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((mag) {
      Provider.of<MineProvider>(context, listen: false).getSecret();
      LoginServer.getVertifyType(100, Provider.of<MineProvider>(context, listen: false).userInfo.username)
          .then((res) => setState(() => tfaType = res));
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey _globalKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.of(context).bindGoogle),
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
          padding: EdgeInsets.symmetric(horizontal: width(40)),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(height: height(20)),
              Container(
                child: Text(
                  Tr.of(context).bindGoogleHint,
                  style: TextStyle(color: Color(0xff6E7581), fontSize: sp(24)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: height(30)),
                child: RepaintBoundary(
                  key: _globalKey,
                  child: Consumer<MineProvider>(
                    builder: (context, model, child) {
                      if (model.isBusy) {
                        return Container(
                          width: width(310),
                          height: width(310),
                          child: CupertinoActivityIndicator(),
                        );
                      } else if (model.isIdle) {
                        return QrImage(
                          data: model.googleSecret,
                          size: width(310),
                        );
                      } else {
                        return Container(
                          width: width(310),
                          height: width(310),
                          child: CupertinoActivityIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
              FocusWidget(
                focusNode: _phoneFocus,
                child: Consumer<MineProvider>(
                  builder: (context, model, child) {
                    return InputWidget(
                      maxHeight: 100,
                      enabled: true,
                      readOnly: true,
                      // onTab: () {
                      //   print('1');
                      //   Clipboard.setData(ClipboardData(text: model.googleSecret));
                      //   Toast.showSuccess('复制成功');
                      // },
                      focusNode: _phoneFocus,
                      hintText: '${Tr.of(context).Key}+：${model.googleSecret ?? ''}',
                      controller: _phoneCtr,
                      contentPadding: EdgeInsets.only(top: height(13)),
                      hintStyle: TextStyle(color: Color(0xff323232), fontSize: sp(28)),
                      suffixIconConstraintsMaxHeight: 60,
                      suffixIconConstraintsMinHeight: 60,
                      suffixIconConstraintsMinWidth: 160,
                      suffixIconConstraintsMaxWidth: 160,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          print('1');
                          Clipboard.setData(ClipboardData(text: model.googleSecret));
                          Toast.showSuccess(Tr.of(context).copySuccessfully);
                        },
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(Tr.of(context).copy, style: TextStyle(color: kPrimaryColor, fontSize: sp(28)))),
                      ),
                    );
                  },
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
              FocusWidget(
                focusNode: _gcodeFocus,
                child: InputWidget(
                  maxHeight: 100,
                  focusNode: _gcodeFocus,
                  hintText: Tr.of(context).GoogleVerificationCodeHint,
                  hintStyle: TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  controller: _gcodeCtr,
                ),
              ),
              Visibility(visible: isError, child: Text(errorText, style: TextStyle(color: Color(0xffFF3838)))),
              SizedBox(height: height(30)),
              MyButton(text: Tr.of(context).determine, onPressed: _confirm),
              SizedBox(height: height(40)),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: width(30), vertical: height(30)),
                  decoration: BoxDecoration(color: Color(0xffF6F9FB), borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text('${Tr.of(context).bindGoogle1}'),
                      ),
                      SizedBox(height: height(30)),
                      RichText(
                        text: TextSpan(
                            text: '${Tr.of(context).bindGoogle2}',
                            style: style1,
                            children: [TextSpan(text: '${Tr.of(context).bindGoogle3}。', style: style2)]),
                      ),
                      RichText(
                        text: TextSpan(text: '${Tr.of(context).bindGoogle4}', style: style1, children: [
                          TextSpan(text: '+', style: style2),
                          TextSpan(text: '”，${Tr.of(context).bindGoogle5}。', style: style1)
                        ]),
                      ),
                      RichText(
                        text: TextSpan(text: '${Tr.of(context).bindGoogle6}', style: style1, children: [
                          TextSpan(text: '${Provider.of<MineProvider>(context).googleSecret ?? '---'}', style: style2),
                          TextSpan(text: '${Tr.of(context).bindGoogle7}。')
                        ]),
                      ),
                      RichText(
                        text: TextSpan(text: '${Tr.of(context).bindGoogle8} ', style: style1, children: [
                          TextSpan(text: '✔', style: style2),
                          TextSpan(text: '“${Tr.of(context).bindGoogle9}。', style: style1),
                        ]),
                      ),
                      RichText(
                        text: TextSpan(text: '${Tr.of(context).bindGoogle10}', style: style1, children: [
                          TextSpan(text: Tr.of(context).submitBinding, style: style2),
                          TextSpan(text: '”。', style: style1),
                        ]),
                      ),
                    ],
                  )),
              SizedBox(height: height(80)),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
    );
  }

  void _confirm() async {
    MineProvider model = Provider.of<MineProvider>(context, listen: false);
    int tfaType = model.userInfo.tfaType;
    String googleSecret = model.googleSecret;
     if ((tfaType == 1 || tfaType == 3 || tfaType == 5 || tfaType == 6) && _codeCtr.text.isEmpty) {
    setState(() {
    isError = true;
    errorText = Tr.of(context).PhoneCodeHint;
    });
    } else if ((tfaType == 2 || tfaType == 4 ) && _ecodeCtr.text.isEmpty) {
    setState(() {
    isError = true;
    errorText = Tr.of(context).EmailCodeHint;
    });
    } else if (_gcodeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).GoogleCodeHint;
      });
    } else {
      setState(() {
        isLoading = false;
        isError = false;
        errorText = '';
      });
      Toast.showLoading('loading...');
      try {
        await MineServer.bindGoogle(googleSecret, _ecodeCtr.text, _codeCtr.text, _gcodeCtr.text);
        Toast.showText(Tr.of(context).BindingSubmitte);
        _ecodeCtr.text = '';
        _codeCtr.text = '';
        _gcodeCtr.text = '';
        Provider.of<MineProvider>(context, listen: false).getUserInfo();
        Routers.goBack(context);

      } catch (e) {
        print(e);
      }
    }
  }
}
