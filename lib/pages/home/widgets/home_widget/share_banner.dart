/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-17 15:54:04
* @LastEditors: Roy
* @LastEditTime: 2020-10-26 15:50:36
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/widgets/home_widget/share_banner.dart
*/
import 'package:HBit/pages/mine/routes/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class ShareBanner extends StatelessWidget {
  final double h;
  const ShareBanner({
    Key key,
    this.h,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: width(10), color: Color(0x80DFDFDF)),
            top: BorderSide(width: width(10), color: Color(0x80DFDFDF)),
          )),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Routers.push(context, MineRouter.share),
        child: Container(
          margin: EdgeInsets.only(left: width(40), right: width(40)),
          height: h,
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage('images/home/share.png'), fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
