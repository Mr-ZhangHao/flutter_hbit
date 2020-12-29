/*
* @message: AppBar相关组件
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-11 13:37:16
* @LastEditors: Jack
* @LastEditTime: 2020-08-17 19:34:30
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/common/appBar/index.dart
*/
import 'package:HBit/constants/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class AppBarLeading extends StatelessWidget {
  const AppBarLeading({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Routers.goBack(context),
      child: Icon(Icons.arrow_back_ios, size: sp(36), color: Colors.black),
    );
  }
}

class AppBarRightItem extends StatelessWidget {
  final Function onTab;
  final String title;
  const AppBarRightItem({
    Key key,
    this.onTab,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTab,
      child: Container(
        margin: EdgeInsets.only(right: width(20)),
        alignment: Alignment.center,
        child: Text(title,
            style: TextStyle(color: Colors.white, fontSize: sp(30))),
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  final String titie;
  final String subTitle;
  const AppBarTitle({
    Key key,
    this.titie,
    this.subTitle = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(titie, style: TextStyle(fontSize: sp(36))),
          Text(subTitle, style: TextStyle(fontSize: sp(30)))
        ],
      ),
    );
  }
}

class BottomLine extends StatelessWidget {
  final double marginLR;
  final Color color;
  const BottomLine({Key key, this.marginLR: 80, this.color = kDividerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
          alignment: Alignment.centerRight,
          width: MediaQuery.of(context).size.width - width(marginLR),
          height: height(1),
          color: color),
    );
  }
}
