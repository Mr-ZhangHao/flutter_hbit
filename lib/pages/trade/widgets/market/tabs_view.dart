/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-18 19:17:38
* @LastEditors: Jack
* @LastEditTime: 2020-08-18 19:20:47
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/widgets/market/tabs_view.dart
*/
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class TabsView extends StatelessWidget {
  TabsView(
      {Key key,
      @required this.tabIndex,
      @required this.firstTab,
      @required this.secondTab})
      : super(key: key);

  final int tabIndex;
  final Widget firstTab;
  final Widget secondTab;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          child: firstTab,
          width: Screen.width,
          padding:
              EdgeInsets.symmetric(horizontal: width(32), vertical: height(20)),
          transform: Matrix4.translationValues(
              tabIndex == 0 ? 0 : -Screen.width, 0, 0),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        ),
        AnimatedContainer(
          child: secondTab,
          width: Screen.width,
          padding:
              EdgeInsets.symmetric(horizontal: width(32), vertical: height(20)),
          transform:
              Matrix4.translationValues(tabIndex == 1 ? 0 : Screen.width, 0, 0),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        )
      ],
    );
  }
}
