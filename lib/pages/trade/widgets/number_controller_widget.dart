/*
* @message: 描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-18 15:57:17
* @LastEditors: Jack
* @LastEditTime: 2020-08-20 12:43:33
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/widgets/number_controller_widget.dart
*/
import 'dart:math';

import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class NumberControllerWidget extends StatefulWidget {
  //高度
  final double height;
  //输入框的宽度 总体宽度为自适应
  final double width;
  //按钮的宽度
  final double iconWidth;
  //默认输入框显示的数量
  final double numText;
  //点击加号回调 数量
  final ValueChanged addValueChanged;
  //点击减号回调 数量
  final ValueChanged removeValueChanged;
  //点击减号任意一个回调 数量
  final ValueChanged updateValueChanged;

  final FocusNode textFocus;

  final TextEditingController textController;

  NumberControllerWidget({
    this.height = 60,
    this.width = 40,
    this.iconWidth = 60,
    this.numText,
    this.addValueChanged,
    this.removeValueChanged,
    this.updateValueChanged,
    this.textFocus,
    this.textController,
  });
  @override
  _NumberControllerWidgetState createState() => _NumberControllerWidgetState();
}

class _NumberControllerWidgetState extends State<NumberControllerWidget> {
  // TextEditingController textController = new TextEditingController();
  // final FocusNode textFocus = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height(widget.height),
        minHeight: height(widget.height),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
              offset: Offset(-1, -2),
              color: Color(0xffEDEDED),
              blurRadius: 1,
              spreadRadius: 1),
          BoxShadow(
              offset: Offset(1, 1),
              color: Color(0xffEDEDED),
              blurRadius: 0.1,
              spreadRadius: 0.1),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //输入框
          Expanded(
            child: Container(
              width: widget.width,
              constraints: BoxConstraints(
                maxHeight: height(widget.height),
                minHeight: height(widget.height),
              ),
              alignment: Alignment.center,
              child: FocusWidget(
                focusNode: widget.textFocus,
                child: TextField(
                  enabled: true,
                  focusNode: widget.textFocus,
                  controller: widget.textController,
                  style: TextStyle(color: Color(0xff323232), fontSize: sp(28)),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  textAlign: TextAlign.left,
                  enableInteractiveSelection: false,
                  decoration: InputDecoration(
                    hintText: '${Tr.of(context).TradrPriceHint}',
                    hintStyle: TextStyle(fontSize: sp(24)),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: width(10), vertical: height(0)),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    ),
                    border: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //加号
          coustomIconButton(icon: Icons.remove, isAdd: false),
          coustomIconButton(icon: Icons.add, isAdd: true),
          //减号
        ],
      ),
    );
  }

  Widget coustomIconButton({IconData icon, bool isAdd}) {
    return Container(
      width: width(widget.iconWidth),
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(
                  width: 0.5, color: isAdd ? kTransprant : kTxtColor))),
      child: GestureDetector(
        onLongPress: () => {print('onLongPress')},
        onLongPressUp: () => {print('onLongPressUp')},
        onLongPressStart: (LongPressStartDetails details) =>
            {print(details.localPosition)},
        child: IconButton(
          splashColor: kTransprant,
          highlightColor: kTransprant,
          padding: EdgeInsets.all(0),
          icon: Icon(icon, color: kTxtColor),
          enableFeedback: false,
          onPressed: () {
            if (widget.textController.text.isEmpty) {
              Toast.showText('${Tr.of(context).TradrPriceHint}');
              return;
            } else {
              num number = num.parse(widget.textController.text ?? 0);
              _addSubAction(isAdd, number);
            }
          },
          // onPressed: () {
          //   var number = double.parse(widget.textController.text ?? 0);
          //   if (!isAdd && number == 0) return;
          //   if (isAdd) {
          //     number++;
          //     if (widget.addValueChanged != null)
          //       widget.addValueChanged(number);
          //   } else {
          //     number--;
          //     if (widget.removeValueChanged != null)
          //       widget.removeValueChanged(number);
          //   }
          //   widget.textController.text = '$number';
          //   if (widget.updateValueChanged != null)
          //     widget.updateValueChanged(number);
          // },
        ),
      ),
    );
  }

  _addSubAction(isAdd, number) {
    if (!isAdd && number == 0) return;
    if (isAdd) {
      List<String> nArr = number.toString().split('.');
      number = number * pow(10, nArr.last.length) + 1;
      number = number / pow(10, nArr.last.length);
      if (widget.addValueChanged != null) widget.addValueChanged(number);
    } else {
      List<String> nArr = number.toString().split('.');
      number = number * pow(10, nArr.last.length) - 1;
      number = number / pow(10, nArr.last.length);
      // number--;
      if (widget.removeValueChanged != null) widget.removeValueChanged(number);
    }
    widget.textController.text = '$number';
    if (widget.updateValueChanged != null) widget.updateValueChanged(number);
  }
}
