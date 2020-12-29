/*
* @message: 背景包裹组件
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-11 12:48:27
* @LastEditors: Jack
* @LastEditTime: 2020-08-15 20:47:47
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/common/wrap/index.dart
*/
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

/// 全局背景图片或者背景色包裹组件
class WrapContainer extends StatelessWidget {
  final Widget child;
  const WrapContainer({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('images/home/bg.png'), fit: BoxFit.fill)),
      child: child,
    );
  }
}

class WrapWidgeForBgColor extends StatelessWidget {
  final Widget child;
  final double width;
  final Color beginColor;
  final Color endColor;
  const WrapWidgeForBgColor({Key key, this.child, this.width, this.beginColor, this.endColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Container(
          height: height(40),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [beginColor, endColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )),
          constraints: BoxConstraints(
            maxWidth: width,
            minWidth: width,
          ),
        ),
        child,
      ],
    );
  }
}

class SliverEmpty extends StatelessWidget {
  const SliverEmpty({
    Key key,
    this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: height(40)),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Image.asset(
            'images/contract/no_record.png',
            width: width(230),
            height: width(230),
            fit: BoxFit.contain,
          ),
          SizedBox(height: height(20)),
          Text(
            text,
            style: TextStyle(fontSize: sp(28), color: Color(0xffc0c0c0)),
          )
        ],
      ),
    ));
  }
}
