/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-15 21:41:39
* @LastEditors: Jack
* @LastEditTime: 2020-08-15 22:02:41
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/theme/dark.dart
*/
import 'package:HBit/constants/index.dart';
import 'package:flutter/material.dart';

/// 亮色时候的App bar Theme
AppBarTheme darkAppBarTheme() {
  return AppBarTheme(color: Color(0xff212537));
}

CardTheme darkCardTheme() {
  return CardTheme(color: Color(0xff212537), elevation: 10);
}

TextTheme darkTextTheme() {
  return TextTheme(
      headline1: TextStyle(color: Color(0xffffffff)), // appbar头部
      headline6: TextStyle(color: Color(0xffffffff)),
      bodyText1: TextStyle(color: Color(0xffffffff)), // body1
      bodyText2: TextStyle(color: Color(0xffCFCFCF)),
      subtitle1: TextStyle(color: Colors.white60) // subtitle1
      );
}

BottomAppBarTheme darkBottomAppBarTheme() {
  return BottomAppBarTheme(color: kBottomBarColor);
}
