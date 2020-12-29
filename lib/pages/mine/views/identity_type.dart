/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 23:09:08
* @LastEditors: Jack
* @LastEditTime: 2020-09-04 18:05:10
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/views/identity_type.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/pages/mine/routes/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class IdentityTypePage extends StatefulWidget {
  IdentityTypePage({Key key}) : super(key: key);

  @override
  _IdentityTypePageState createState() => _IdentityTypePageState();
}

class _IdentityTypePageState extends State<IdentityTypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(Tr.of(context).authentication),
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
          padding: EdgeInsets.symmetric(horizontal: width(100)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: height(110)),
                child: Image.asset('images/mine/earth.png', width: width(248), height: width(224)),
              ),
              MyButton(
                text: Tr.of(context).authentication,
                onPressed: () => Routers.push(context, MineRouter.auth1),
              ),
     /*         SizedBox(height: height(40)),
              MyButton(
                disabledColor: Color(0x21a8a8a8),
                text: Tr.of(context).otherArea,
                disabledTextColor: Color(0xffa1a1a1),
                color: Color(0xffa1a1a1),
                // onPressed: () {
                //   Routers.push(context, MineRouter.vertifyStatus);
                // },
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
