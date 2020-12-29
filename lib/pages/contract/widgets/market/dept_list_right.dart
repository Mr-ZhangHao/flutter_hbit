/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-24 18:04:25
* @LastEditors: Roy
* @LastEditTime: 2020-09-10 18:59:08
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/widgets/market/dept_list_right.dart
*/

import 'package:HBit/constants/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';

class DeptListRight extends StatefulWidget {
  DeptListRight({Key key, this.list}) : super(key: key);
  final List list;
  @override
  _DeptListRightState createState() => _DeptListRightState();
}

class _DeptListRightState extends State<DeptListRight> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff061439),
      child: Column(
        children: _listView(),
      ),
    );
  }

  List<Widget> _listView() {
    return widget.list != null
        ? widget.list.asMap().keys.map((index) {
            List map = widget.list[index];
            return Container(
              height: height(80),
              // width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      map.first == '-' ? '-' : Utils.cutZero(map.first),
                      style: TextStyle(
                        color: kRedColor,
                        fontSize: sp(24),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      map.last == '-' ? '-' : Utils.formatNum(map.last),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: sp(24),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Container(
                    width: width(60),
                    alignment: Alignment.center,
                    child: Text((index + 1).toString(), style: TextStyle(color: Color(0xff707D9F), fontSize: sp(24))),
                  ),
                ],
              ),
            );
          }).toList()
        : [];
  }
}
