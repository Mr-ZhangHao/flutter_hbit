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
import 'package:HBit/common/i18n/i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/constants/index.dart';

class WithdrawPage extends StatefulWidget {
  WithdrawPage({Key key}) : super(key: key);

  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<WithdrawPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          '${Tr.of(context).assetChoosecurrency}',
          style: TextStyle(color: kTextColor3, fontSize: sp(36)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
          child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: width(40)),
        child: Column(
          children: <Widget>[
            Container(
              width: width(670),
              height: height(74),
              padding: EdgeInsets.symmetric(horizontal: width(24)),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: kBgColor3, borderRadius: BorderRadius.all(Radius.circular(4))),
              child: TextField(
                  cursorColor: kBgColor1,
                  cursorWidth: width(4),
                  style: TextStyle(color: kLineColor2, fontSize: sp(28), height: 1.1),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: '${Tr.of(context).assetSearch}',
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: height(54)),
              padding: EdgeInsets.symmetric(horizontal: width(4)),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, height(52)),
                    child: Text('BTC', style: TextStyle(color: kTextColor3, fontSize: sp(28), height: 1.1)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, height(52)),
                    child: Text('ETH', style: TextStyle(color: kTextColor3, fontSize: sp(28), height: 1.1)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, height(52)),
                    child: Text('TRX', style: TextStyle(color: kTextColor3, fontSize: sp(28), height: 1.1)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, height(52)),
                    child: Text('USDT', style: TextStyle(color: kTextColor3, fontSize: sp(28), height: 1.1)),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
