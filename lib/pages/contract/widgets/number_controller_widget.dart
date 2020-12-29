/*
* @message: 描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-18 15:57:17
* @LastEditors: Jack
* @LastEditTime: 2020-08-14 16:29:10
* @Deprecated: 否
* @FilePath: /ETF/lib/pages/trade/widgets/number_controller_widget.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
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
    this.height = 74,
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
          borderRadius: BorderRadius.circular(2),
          border: Border.all(width: 0.5, color: kDividerColor)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //减号
          coustomIconButton(icon: Icons.remove, isAdd: false),
          //输入框
          Expanded(
            child: Container(
              width: widget.width,
              constraints: BoxConstraints(
                maxHeight: height(widget.height),
                minHeight: height(widget.height),
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(width: 0.5, color: kDividerColor),
                      right: BorderSide(width: 0.5, color: kDividerColor))),
              child: FocusWidget(
                focusNode: widget.textFocus,
                child: TextField(
                  enabled: true,
                  focusNode: widget.textFocus,
                  controller: widget.textController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  enableInteractiveSelection: false,
                  decoration: InputDecoration(
                    hintText: '${Tr.of(context).TradrPriceHint}',
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 0, vertical: height(18)),
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
          coustomIconButton(icon: Icons.add, isAdd: true),
        ],
      ),
    );
  }

  Widget coustomIconButton({IconData icon, bool isAdd}) {
    return Container(
      width: width(widget.iconWidth),
      child: GestureDetector(
        onLongPress: () => {print('onLongPress')},
        onLongPressUp: () => {print('onLongPressUp')},
        onLongPressStart: (LongPressStartDetails details) =>
            {print(details.localPosition)},
        child: IconButton(
          splashColor: kTransprant,
          highlightColor: kTransprant,
          padding: EdgeInsets.all(0),
          icon: Icon(icon, color: kDividerColor),
          enableFeedback: false,
          onPressed: () {
            // print('object');
            var number = double.parse(widget.textController.text ?? 0);
            // print(number);
            // List<String> nArr = number.toString().split('.');
            // print('==================${nArr.last.length}');
            // print(number * (nArr.last.length + ));

            if (!isAdd && number == 0) return;
            if (isAdd) {
              number++;
              if (widget.addValueChanged != null)
                widget.addValueChanged(number);
            } else {
              number--;
              if (widget.removeValueChanged != null)
                widget.removeValueChanged(number);
            }
            widget.textController.text = '$number';
            if (widget.updateValueChanged != null)
              widget.updateValueChanged(number);
          },
        ),
      ),
    );
  }
}
