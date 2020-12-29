/*
* @message: 常用色值和边距
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-07-30 20:10:25
* @LastEditors: Jack
* @LastEditTime: 2020-09-02 11:15:09
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/constants/index.dart
*
00%=FF（不透明） 
5%=F2 
10%=E5 
15%=D8 
20%=CC 
25%=BF 
30%=B2 
35%=A5 
40%=99 
45%=8c 
50%=7F 
55%=72 
60%=66 
65%=59 
70%=4c 
75%=3F 
80%=33 
85%=21 
90%=19 
95%=0c 
100%=00（全透明）
*
*
*/
import 'package:flutter/material.dart';

const imgHost = 'http://img.lxfy.cn/';

const kPrimaryColor = Color(0xFF126DFF);
const kbgColor = Color(0xffF6F6F6);
const kbackgroundColor = Color(0xFFF1EFF1);
const kBottomBarColor = Color(0xFF092525);
const kWhite = Colors.white;

const kRedBgColor = Color(0x4cDB0929);
const kRedColor = Color(0xffD45151);
const kBgColor = Color(0x66092526);
const kTextColor0 = Color(0xFFFFA131);
const kTextColor1 = Color(0xFF8C8C8C);
const kTextColor2 = Color(0xFFB6B6B6);
const kTextColor3 = Color(0xFF323232);
const kTextColor4 = Color(0xFFECEFF4);
const kTextColor5 = Color(0xFF444444);
const kTextColor6 = Color(0xFF666666);
const kTextColor7 = Color(0xFFCCCCCC);
const kTextColor8 = Color(0xFF007AFF);
const kTextColor9 = Color(0xFF999999);
const kLineColor1 = Color(0xFFE5E5E5);
const kLineColor2 = Color(0xFFC9C9C9);
const kLineColor3 = Color(0xFFEAEAEA);
const kBgColor1 = Color(0xFF126dff);
const kBgColor2 = Color(0xFFD9D9D9);
const kBgColor3 = Color(0xFFF7F7F7);
const kB4B4B4 = Color(0xFFB4B4B4);
const kTextColorF2 = Color(0xFFF2F2F2);
const kTextLightColor = Color(0xFF747474);
const kTransprant = Colors.transparent;
const kBlueColor = Color(0xFF40BAD5);

const kGreenColor = Color(0xff48BE70);
const kBorderColor = Color(0xff5F7779);
const kGreenHeaderColor = Color(0xff168f9b);
const kGreenIconColor = Color(0xff084443);
const kGreenLineColor = Color(0xff5F7779);
const kTxtColor = Color(0xffB0B0B0);

// TextStyle kappBarStyle = TextStyle(color: Colors.white, fontSize: sp(36));

/// 分隔线颜色
const kDividerColor = Color(0xffF4F4F4);
const kDefaultPadding = 20.0;
// default shadow
const kDefaultShadow = [
  BoxShadow(
    color: kTextColorF2, offset: Offset(1, 1),

    ///模糊阴影半径
    blurRadius: 5,
  ),
  BoxShadow(color: kTextColorF2, offset: Offset(-1, -1), blurRadius: 5),
  BoxShadow(color: kTextColorF2, offset: Offset(1, -1), blurRadius: 5),
  BoxShadow(color: kTextColorF2, offset: Offset(-1, 1), blurRadius: 5)
];

const BorderRadius kDefaultRadius = BorderRadius.all(Radius.circular(5));

const kDefaultOutLineBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kPrimaryColor, width: 0.5),
);
