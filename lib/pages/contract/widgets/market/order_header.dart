/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-12 17:07:57
* @LastEditors: Jack
* @LastEditTime: 2020-08-12 17:08:50
* @Deprecated: 否
* @FilePath: /ETF/lib/pages/market/widgets/market/order_header.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
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
    TextStyle st = TextStyle(color: kTextColor9);
    return Column(
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTab,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: width(10), vertical: height(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text('${Tr.of(context).tradrCurrentEntrust}'), Text('${Tr.of(context).tradrAll} >')],
            ),
          ),
        ),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: width(10), vertical: height(5)),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(child: Text('${Tr.of(context).contractMarket}', style: st)),
                      ),
                      Expanded(child: Container(child: Text('${Tr.of(context).tradrPrice}', style: st))),
                      Expanded(
                          child: Container(child: Text('${Tr.of(context).TradrVolume}/${Tr.of(context).TradrQuantity}', style: st))),
                    ],
                  ),
                ),
              ),
              Container(
                  width: width(100),
                  alignment: Alignment.centerRight,
                  child: Text('${Tr.of(context).contractOperation}', style: st))
            ],
          ),
        ),
      ],
    );
  }
}
