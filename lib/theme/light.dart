/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-15 21:41:39
* @LastEditors: Jack
* @LastEditTime: 2020-08-22 11:12:50
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/theme/light.dart
*/
import 'package:HBit/constants/index.dart';
import 'package:flutter/material.dart';

/// 亮色时候的App bar Theme
AppBarTheme lightAppBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      actionsIconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      ));
}

CardTheme lightCardTheme() {
  return CardTheme(color: Colors.white, elevation: 10);
}

TextTheme lightTextTheme() {
  return TextTheme(
      headline6: TextStyle(color: Colors.red),
      bodyText1: TextStyle(color: kPrimaryColor), // body文字颜色
      bodyText2: TextStyle(color: Colors.black),
      subtitle1: TextStyle(color: Colors.red) // 子标题
      );
}

BottomAppBarTheme lightBottomAppBarTheme() {
  return BottomAppBarTheme(color: Colors.white, elevation: 0);
}
