/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-12 17:07:57
* @LastEditors: Jack
* @LastEditTime: 2020-08-22 13:24:24
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/widgets/market/order_header.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class OrderListHeader extends StatelessWidget {
  final Function onTab;
  const OrderListHeader({
    Key key,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTab,
          child: Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: Color(0xffEaeaea)))),
            margin: EdgeInsets.only(bottom: height(10)),
            padding: EdgeInsets.symmetric(horizontal: width(10), vertical: height(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(Tr.of(context).tradrCurrentEntrust),
                SizedBox(width: width(10)),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(Tr.of(context).tradrAllEntrust, style: TextStyle(color: Color(0xffc0c0c0))),
                      SizedBox(width: width(10)),
                      Image.asset('images/trade/more@3x.png', fit: BoxFit.fill, width: width(24), height: height(33)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
