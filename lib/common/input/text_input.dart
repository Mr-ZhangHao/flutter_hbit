/*
* @message: 公共输入框
* @Author: 徐士杰
* @Email: shijie10086@163.com
* @Github: shijie10086@163.com
* @Date: 2020-05-11 18:45:26
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/common/input/text_input.dart
*/
import 'dart:async';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:flutter/material.dart';
import 'package:HBit/utils/screen.dart';

class TextEditing extends StatefulWidget {
  const TextEditing({
    Key key,
    @required this.controller,
    @required this.focusNode,
    @required this.hintText,
    this.isPwd: false,
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
    this.contentPaddingH = 0,
    this.contentPaddingW = 0,
    this.maxLength,
    this.prefixStyle,
  }) : super(key: key);
  final controller;
  final focusNode;
  final keyboardType;
  final Widget icon;
  final String hintText;
  final String prefixText;
  final Widget suffixIcon;
  final bool isPwd;
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
  final double contentPaddingH;
  final double contentPaddingW;
  final TextStyle prefixStyle;

  @override
  _TextEditingState createState() => _TextEditingState();
}

class _TextEditingState extends State<TextEditing> {
  bool _isAvailableGetVCode = true; //是否可以获取验证码，默认为`false`
  String _verifyStr = '立即获取';

  /// 倒计时的计时器。
  Timer _timer;

  /// 当前倒计时的秒数。
  int _seconds;
  @override
  void initState() {
    super.initState();
    _seconds = widget.countdown;
  }

  /// 开始计时
  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _seconds--;
      _isAvailableGetVCode = false;
      // print(_seconds);
      _verifyStr = '已发送(${_seconds}s)';
      if (_seconds == 0) {
        _verifyStr = '重新获取';
        _isAvailableGetVCode = true;
        _seconds = widget.countdown;
        _cancelTimer();
      }
      setState(() {});
    });
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
    return Stack(
      alignment: Alignment.centerRight,
      fit: StackFit.passthrough,
      children: <Widget>[
        Expanded(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: height(widget.maxHeight)),
            child: TextField(
              controller: widget.controller,
              maxLength: widget.maxLength,
              focusNode: widget.focusNode,
              maxLines: widget.maxLine, //最大行数
              autofocus: widget.autofocus, //是否自动对焦
              cursorColor: Color(0xff999999),
              obscureText: widget.isPwd,
              style: TextStyle(fontSize: sp(30), color: Color(0xff333333)),
              keyboardType: widget.keyboardType,
              readOnly: widget.readOnly, //输入文本的样式
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: width(widget.contentPaddingW), vertical: height(widget.contentPaddingH)),
                  icon: widget.icon,
                  hintText: widget.hintText,
                  hintStyle: widget.hintStyle,
                  prefixText: widget.prefixText,
                  prefixStyle: widget.prefixStyle,
                  labelText: widget.labelText,
                  labelStyle: TextStyle(color: Color(0xff999999), fontSize: sp(28)),
                  suffixText: widget.suffixText,
                  suffixStyle: widget.suffixStyle,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  prefix: widget.prefix,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none),
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              enabled: widget.enabled,
            ),
          ),
        ),
        Offstage(
          offstage: widget.getVCode == null,
          child: Container(
              height: height(60),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(width(12)),
                  ),
                  border: Border.all(
                    color: _isAvailableGetVCode ? kPrimaryColor : kDividerColor,
                    width: 0.5,
                  )),
              child: FlatButton(
                // disabledColor: Color(0xFFCCCCCC),
                onPressed: _seconds == widget.countdown
                    ? () async {
                        Toast.showLoading('loading...');
                        if (await widget.getVCode()) {
                          Toast.close();
                          _startTimer();
                        }
                      }
                    : null,
                child: Text(
                  '$_verifyStr',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: sp(25),
                    color: _isAvailableGetVCode ? kPrimaryColor : kDividerColor,
                  ),
                ),
              )),
        )
      ],
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
