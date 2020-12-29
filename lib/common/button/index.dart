/*
* @message: 描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-14 11:12:58
* @LastEditors: Jack
* @LastEditTime: 2020-09-04 15:32:31
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/common/button/index.dart
*/
import 'package:HBit/constants/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HBit/utils/screen.dart';

class MyButton extends StatelessWidget {
  final text;
  final Function onPressed;
  final bool isLoading;
  final Color bgColor;
  final Color color;
  final Color disabledColor;
  final Color disabledTextColor;
  const MyButton(
      {Key key,
      this.text,
      this.onPressed,
      this.bgColor,
      this.color = Colors.white,
      this.isLoading = false,
      this.disabledColor = const Color(0x7f126DFF),
      this.disabledTextColor = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        elevation: 0,
        onPressed: onPressed,
        child: isLoading ? CupertinoActivityIndicator() : Text(text, style: TextStyle(fontSize: sp(34), color: color)),
        minWidth: double.infinity,
        height: width(88),
        color: bgColor ?? kPrimaryColor,
        disabledColor: disabledColor,
        disabledTextColor: disabledTextColor,
        textColor: Colors.white,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  const SmallButton({
    Key key,
    this.onPressed,
    this.text,
    this.color,
    this.textColor,
    this.isBorder = false,
    this.borderColor,
    this.width,
    this.padding,
    this.btnPadding,
    this.height,
    this.borderRadius,
    this.fontSize,
    this.borderWidth = 1,
    this.minWidth = 40,
  }) : super(key: key);
  final Function onPressed;
  final String text;

  /// 按钮颜色
  final Color color;

  /// 文字颜色
  final Color textColor;
  final bool isBorder;
  final Color borderColor;
  final double borderWidth;
  final BorderRadius borderRadius;
  final double width;
  final EdgeInsets padding;
  final EdgeInsets btnPadding;
  final double height;
  final double fontSize;
  final double minWidth;
  // final Color dis;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        color: color,
        highlightElevation: 0,
        disabledColor: Color(0xffC1C1C1),
        disabledTextColor: Colors.white,
        height: height,
        elevation: 0,
        highlightColor: kTransprant,
        splashColor: kTransprant,
        shape: RoundedRectangleBorder(
            side: isBorder ? BorderSide(color: borderColor, width: borderWidth) : BorderSide.none,
            borderRadius: borderRadius),
        textColor: textColor,
        onPressed: onPressed,
        padding: btnPadding ?? EdgeInsets.zero,
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, color: textColor ?? Theme.of(context).buttonColor),
        ),
      ),
    );
  }
}

class LinearGradientButton extends StatefulWidget {
  final double height; // 宽高
  final double width;
  final String text; // 按钮文字
  final double marginLeft; // 左右外边框
  final double marginRight;
  final Color beginColor; // 左右渐变的颜色
  final Color endColor;
  final double borderRadius; // 边框圆角
  final Color shadowColor; // 阴影颜色
  final double offsetX; // x、y轴阴影大小
  final double offsetY;
  final double blurRadius; // 阴影的虚化效果大小
  final double paddingLeft; // 上下左右的内边框
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final Color textColor; // 按钮文字颜色
  final double textSize; // 按钮文字大小
  final Function onPressed;
  final Alignment begin;
  final Alignment end;
  final bool isBorder;
  final Color borderColor;
  final double borderWidth;

  LinearGradientButton({
    // 默认值
    this.height = 50.0,
    this.width = 100.0,
    this.text = "登录",
    this.marginLeft = 20.0,
    this.marginRight = 20.0,
    this.beginColor = const Color.fromRGBO(73, 72, 255, 1.0),
    this.endColor = const Color.fromRGBO(67, 150, 200, 1.0),
    this.borderRadius = 90.0,
    this.shadowColor = const Color.fromRGBO(128, 128, 128, 1.0),
    this.offsetX = 2.0,
    this.offsetY = 2.0,
    this.blurRadius = 4.0,
    this.paddingLeft = 0.0,
    this.paddingTop = 13.0,
    this.paddingRight = 0.0,
    this.paddingBottom = 13.0,
    this.textColor = const Color.fromRGBO(255, 255, 255, 1.0),
    this.textSize = 16.0,
    this.onPressed,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
    this.isBorder = true,
    this.borderColor = kTransprant,
    this.borderWidth = 1,
  });

  @override
  _LinearGradientButtonState createState() => _LinearGradientButtonState();
}

class _LinearGradientButtonState extends State<LinearGradientButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        width: widget.width,
        // 两端的间隔 marginLeft、marginRight
        margin: EdgeInsets.fromLTRB(widget.marginLeft, 0.0, widget.marginRight, 0.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: widget.begin,
                end: widget.end,
                colors: [
                  // 渐变颜色 beginColor、endColor
                  widget.beginColor,
                  widget.endColor
                ],
              ), // 背景渐变
              // borderRadius 圆角的大小
              borderRadius: BorderRadius.circular(widget.borderRadius), // 90.0像素圆角
              boxShadow: [
                // 阴影
                BoxShadow(
                  // 阴影颜色 shadowColor
                  color: widget.shadowColor,
                  // 阴影的大小 offsetX、offsetY
                  offset: Offset(widget.offsetX, widget.offsetY),
                  // 阴影的虚化效果大小
                  blurRadius: widget.blurRadius,
                ),
              ],
              border:
                  widget.isBorder ? Border.all(width: widget.borderWidth, color: widget.borderColor) : BorderSide.none),
          child: Padding(
            // paddingTop、paddingBottom、paddingLeft、paddingRight
            padding: EdgeInsets.fromLTRB(
              widget.paddingLeft,
              widget.paddingTop,
              widget.paddingRight,
              widget.paddingBottom,
            ),
            child: Center(
              child: Text(
                // 字体内容 text
                widget.text,
                style: TextStyle(
                  // 字体颜色 textColor
                  color: widget.textColor,
                  // 字体大小 textSize
                  fontSize: widget.textSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
