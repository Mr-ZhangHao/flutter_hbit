/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-12 16:43:19
* @LastEditors: Roy
* @LastEditTime: 2020-09-10 10:09:39
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/widgets/market/order_item.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/trade/model/order_model.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';

typedef cancelButton = void Function(int value);

class OrderItemWidget extends StatelessWidget {
  final Function(OrderModel models) onTab;
  final OrderModel model;
  const OrderItemWidget({
    Key key,
    this.onTab,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle st = TextStyle(color: Color(0xffc0c0c0), fontSize: sp(30));
    TextStyle st2 = TextStyle(
        color: Color(0xFF646464),
        fontSize: sp(30),
        letterSpacing: -1,
        fontWeight: FontWeight.w500);
    return Container(
        padding:
            EdgeInsets.symmetric(horizontal: width(10), vertical: height(24)),
        alignment: Alignment.center,
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                  text: TextSpan(
                      text:model.side == 'BUY'?'${Tr.of(context).tradrBuy} ':'${Tr.of(context).tradrSell} ',
                      style: TextStyle(color:model.side == 'BUY'? kGreenColor : kRedColor, fontSize: sp(36)),
                      children: [
                    TextSpan(
                        text: model.createdAt,
                        style: TextStyle(
                            color: Color(0xffc0c0c0), fontSize: sp(24)))
                  ])),
              Container(
                width: width(120),
                alignment: Alignment.centerRight,
                child: SmallButton(
                  color: Color(0x193A7EFD),
                  isBorder: false,
                  fontSize: sp(24),
                  textColor: kPrimaryColor,
                  height: height(60),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  padding: EdgeInsets.symmetric(horizontal: width(4)),
                  text: '${Tr.of(context).TradrRevoke}',
                  onPressed: () => onTab(model), // 可传参到父组件
                ),
              )
            ],
          ),
          SizedBox(height: height(20)),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(child: Text("${Tr.of(context).tradrPrice}(${model.symbol.split('/').last})", style: st)),
                      ),
                      Expanded(
                          child: Container(child: Text('${Tr.of(context).TradrQuantity}(${model.symbol.split('/').first})', style: st))),
                      Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              // color: Colors.blue,
                              child: Text('${Tr.of(context).tradrActualTransaction}(${model.symbol.split('/').first})',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: st))),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height(30)),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            child: Text(Utils.cutZero(model.price),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: st2)),
                      ),
                      Expanded(
                          child: Container(
                              child: Text(Utils.conversionNum(double.parse(model.number)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: st2))),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(Utils.conversionNum(double.parse(model.dealNumber)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: st2))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
