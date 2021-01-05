/*
* @message: 公共输入框
* @Author: 徐士杰
* @Email: shijie10086@163.com
* @Github: shijie10086@163.com
* @Date: 2020-05-11 18:45:26
* @LastEditors: Roy
* @LastEditTime: 2020-09-04 18:28:24
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/login/widgets/text_input.dart
*/
import 'dart:async';
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/main.dart';
import 'package:flutter/material.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    Key key,
    @required this.controller,
    @required this.focusNode,
    @required this.hintText,
    this.obscureText: false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.getVCode,
    this.countdown: 60,
    this.onChanged,
    this.onSubmitted,
    this.prefixText,
    this.labelText,
    this.suffixText,
    this.icon,
    this.prefix,
    this.autofocus = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLine = 1,
    this.hintStyle = const TextStyle(fontSize: 12, color: kTextColor9),
    this.suffixStyle,
    this.maxHeight = 70,
    this.maxLength,
    this.contentPadding,
    this.suffixIconConstraintsMinWidth = 0,
    this.suffixIconConstraintsMaxWidth = 0,
    this.suffixIconConstraintsMinHeight = 0,
    this.suffixIconConstraintsMaxHeight = 0,
    this.prefixIconConstraintsMinWidth = 0,
    this.prefixIconConstraintsMaxWidth = 0,
    this.prefixIconConstraintsMinHeight = 0,
    this.prefixIconConstraintsMaxHeight = 0,
    this.textAlign = TextAlign.left,
    this.onTab,
    this.border = const UnderlineInputBorder(borderSide: BorderSide(width: 0.2, color: Colors.grey)),
    this.style = const TextStyle(fontSize: 15, color: Color(0xff323232)),
    this.inputFormatters,
  }) : super(key: key);
  final controller;
  final focusNode;
  final TextInputType keyboardType;
  final Widget icon;
  final String hintText;
  final String prefixText;
  final Widget suffixIcon;
  final bool obscureText;
  final Widget prefixIcon;
  final Future<bool> Function() getVCode;
  final Function onChanged;
  final Function onSubmitted;
  final String labelText;
  final String suffixText;
  final Widget prefix;
  final bool autofocus;
  final bool enabled;
  final bool readOnly;
  final TextStyle hintStyle;
  final TextStyle suffixStyle;
  final int maxLength;

  /// 倒计时的秒数，默认60秒。
  final int countdown;
  final int maxLine;
  final double maxHeight;
  final EdgeInsetsGeometry contentPadding;
  final double suffixIconConstraintsMinWidth;
  final double suffixIconConstraintsMaxWidth;
  final double suffixIconConstraintsMinHeight;
  final double suffixIconConstraintsMaxHeight;

  final double prefixIconConstraintsMinWidth;
  final double prefixIconConstraintsMaxWidth;
  final double prefixIconConstraintsMinHeight;
  final double prefixIconConstraintsMaxHeight;
  final TextAlign textAlign;
  final Function onTab;
  final TextStyle style;
  final UnderlineInputBorder border;
  final List<TextInputFormatter> inputFormatters;

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool _isAvailableGetVCode = true; //是否可以获取验证码，默认为`false`
  String _verifyStr ="Send";

  /// 倒计时的计时器。
  Timer _timer;

  /// 开始计时
  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _seconds--;
      _isAvailableGetVCode = false;
      // print(_seconds);
      _verifyStr = '${Tr.of(context).sent} ${_seconds}s';
      if (_seconds == 0) {
        _verifyStr = Tr.of(context).Reacquire;
        _isAvailableGetVCode = true;
        _seconds = widget.countdown;
        _cancelTimer();
      }
      setState(() {});
    });
  }

  /// 当前倒计时的秒数。
  int _seconds;
  @override
  void initState() {
    super.initState();
    _seconds = widget.countdown;
  }


  /// 取消倒计时的计时器。
  void _cancelTimer() {
    // 计时器（`Timer`）组件的取消（`cancel`）方法，取消计时器。
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: height(widget.maxHeight),
        minHeight: height(widget.maxHeight),
      ),
      child: TextField(
        onTap: widget.onTab,
        controller: widget.controller,
        maxLength: widget.maxLength,
        textAlign: widget.textAlign,
        focusNode: widget.focusNode,
        maxLines: widget.maxLine, //最大行数
        autofocus: widget.autofocus, //是否自动对焦
        cursorColor: Color(0xffBFBFBF),
        obscureText: widget.obscureText,
        style: widget.style,
        keyboardType: widget.keyboardType,
        readOnly: widget.readOnly, //输入文本的样式
        inputFormatters: widget.inputFormatters,
        // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-z]"))],
        decoration: InputDecoration(
          counterText: '',
          prefixStyle: TextStyle(color: Colors.black),
          contentPadding: widget.contentPadding,
          icon: widget.icon,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          prefix: widget.prefix,
          prefixText: widget.prefixText,
          labelText: widget.labelText,
          suffixText: widget.suffixText,
          suffixStyle: widget.suffixStyle,
          prefixIcon: widget.prefixIcon,
          prefixIconConstraints: BoxConstraints(
              minWidth: width(widget.prefixIconConstraintsMinWidth),
              maxWidth: width(widget.prefixIconConstraintsMaxWidth),
              maxHeight: width(widget.prefixIconConstraintsMaxHeight),
              minHeight: width(widget.prefixIconConstraintsMinHeight)),
          suffixIconConstraints: BoxConstraints(
              minWidth: width(widget.suffixIconConstraintsMinWidth),
              maxWidth: width(widget.suffixIconConstraintsMaxWidth),
              maxHeight: width(widget.suffixIconConstraintsMinHeight),
              minHeight: width(widget.suffixIconConstraintsMinHeight)),
          suffixIcon: widget.getVCode == null
              ? widget.suffixIcon
              : SmallButton(
                  borderWidth: 0.5,
                  width: width(160),
                  height: height(widget.maxHeight * 0.6),
                  fontSize: sp(24),
                  isBorder: false,
                  borderColor: _isAvailableGetVCode ? kPrimaryColor : kDividerColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(width(12)),
                  ),
                  textColor: _isAvailableGetVCode ? kPrimaryColor : kDividerColor,
                  onPressed: _seconds == widget.countdown
                      ? () async {
                  Toast.showLoading('loading...');
                    if (await widget.getVCode()) {
                   Toast.close();
                      _startTimer();
                    }
                        }
                      : null,
                  text: _verifyStr,
                ),
          enabledBorder: widget.border,
          disabledBorder: widget.border,
          focusedBorder: widget.border,
          border: widget.border,
          // suffixIcon: widget.suffixIcon,
        ),
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        enabled: widget.enabled,
      ),
    );
  }
}

// InkWell(
// onTap: () {},
// child: Container(
//   height: ScreenUtil().setHeight(58),
//   width: width(140),
//   alignment: Alignment.center,
//   margin: EdgeInsets.only(right: width(20)),
//   decoration: BoxDecoration(
//     //设置四周圆角 角度
//     borderRadius: BorderRadius.all(Radius.circular(4.0)),
//     //设置四周边框
//     border: Border.all(width: 1, color: Color(0xff999999)),
//   ),
//   child: Text('获取验证码'),
// ),
// )
