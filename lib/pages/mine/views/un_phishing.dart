/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 11:03:58
* @LastEditors: Jack
* @LastEditTime: 2020-08-19 13:39:00
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/views/un_phishing.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class UnPhishingpage extends StatefulWidget {
  UnPhishingpage({Key key}) : super(key: key);

  @override
  _UnPhishingpageState createState() => _UnPhishingpageState();
}

class _UnPhishingpageState extends State<UnPhishingpage> {
  final _codeCtr = TextEditingController();
  final FocusNode _codeFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.of(context).SetCode),
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: width(35)),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: height(8), horizontal: width(10)),
                margin: EdgeInsets.symmetric(vertical: height(28)),
                decoration: BoxDecoration(
                    color: Color(0xffF6F9FB),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.info, color: Color(0xffCAD3E1), size: sp(30)),
                    SizedBox(width: width(10)),
                    Expanded(
                      child: Text(
                        Tr.of(context).SetCodeHint,
                        maxLines: 2,
                        style: TextStyle(fontSize: sp(24)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: height(30)),
              FocusWidget(
                focusNode: _codeFocus,
                child: InputWidget(
                  maxHeight: 100,
                  focusNode: _codeFocus,
                  hintText: Tr.of(context).SetCodeHint2,
                  controller: _codeCtr,
                  prefixIconConstraintsMaxWidth: 200,
                  prefixIconConstraintsMinWidth: 160,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  contentPadding: EdgeInsets.only(bottom: height(12)),
                  hintStyle:
                      TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text(
                      '${Tr.of(context).AntiPhishingCode}：',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height(100)),
              MyButton(
                text: Tr.of(context).submit,
                // onPressed: () {},
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
    );
  }
}
