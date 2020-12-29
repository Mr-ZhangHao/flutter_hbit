/*
* @message: 行情邮编深度列表
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-12 10:35:34
* @LastEditors: Roy
* @LastEditTime: 2020-09-15 18:20:24
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/widgets/market/contract_right.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/wrap/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/contract/provider/contract_common_provider.dart';
import 'package:HBit/pages/contract/provider/contract_provider.dart';
import 'package:HBit/pages/trade/trade_screen.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ContractRight extends StatefulWidget {
  ContractRight({Key key, this.model2, this.model1}) : super(key: key);
  final ContractOrderProvider model2;
  final ContractCommonProvider model1;
  @override
  _ContractRightState createState() => _ContractRightState();
}

class _ContractRightState extends State<ContractRight> {
  TextStyle styleSz20 = TextStyle(color: kTextColor9, fontSize: sp(20));
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: width(20), right: width(20), top: height(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${Tr.of(context).tradrPrice}', style: styleSz20),
                Text('${Tr.of(context).TradrQuantity}', style: styleSz20),
              ],
            ),
            SizedBox(height: height(12)),
            Container(
              width: double.infinity,
              child: Column(
                  verticalDirection: VerticalDirection.up, children: _buildItemList(widget.model2.sells, BuyType.sell)),
            ),
            SizedBox(height: height(14)),
            SizedBox(
              height: height(40),
              child: Row(
                children: <Widget>[
                  Text(
                    Utils.cutZero(widget?.model2?.marketListModel?.now ?? 0),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color:
                            double.parse(widget?.model2?.marketListModel?.rate ?? '0') >= 0 ? kGreenColor : kRedColor,
                        fontSize: sp(28),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: height(14)),
            Container(
              width: double.infinity,
              child: Column(children: _buildItemList(widget.model2.buys, BuyType.buy)),
            ),
            SizedBox(height: height(20)),
            // ButtonsItem(
            //   onActive: (value) {
            //     print('深度买卖按钮$value');
            //   },
            // )
          ],
        ),
      ),
    );
  }

  /// depth列表
  List<Widget> _buildItemList(List list, type) {
    TextStyle styleSz26 = TextStyle(color: kTextColor6, fontSize: sp(26));
    double maxWidth = 0.01;
    print(list.last.last);
    if (list.last.last != '-') {
      List<double> numList = list.map((e) => double.parse(e.last.toString())).toList();
      maxWidth = numList.reduce(max);
    }

    return list?.map<Widget>((item) {
          return GestureDetector(
            onTap: () {
              String price = item.first == '-' ? '-' : Utils.cutZero(item.first);
              if (null != price && '-' != price) {
                widget.model2.callBack(price);
              }
            },
            child: WrapWidgeForBgColor(
              width: Screen.width * ((item.first != '-' ? item.last : 0.01) / maxWidth),
              // width: width(100),
              beginColor: type == BuyType.sell ? Color(0xffFFF4F4) : Color(0xffFAFFFB),
              endColor: type == BuyType.sell ? Color(0xffFFE7E7) : Color(0xffD9FDE4),
              child: Container(
                height: height(40),
                margin: EdgeInsets.symmetric(vertical: height(1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(item.first == '-' ? '-' : Utils.cutZero(item.first),
                        style: TextStyle(color: type == BuyType.buy ? kGreenColor : kRedColor)),
                    Text(item.last == '-' ? '-' : Utils.formatNum(item.last), style: styleSz26),
                  ],
                ),
              ),
            ),
          );
        })?.toList() ??
        [];
  }
}

typedef buySellAllClick = void Function(int value);

class ButtonsItem extends StatefulWidget {
  const ButtonsItem({
    Key key,
    this.onActive,
  }) : super(key: key);
  final buySellAllClick onActive;

  @override
  _ButtonsItemState createState() => _ButtonsItemState();
}

class _ButtonsItemState extends State<ButtonsItem> {
  int active = 2; // 默认选中买卖盘
  List<Map<String, dynamic>> list = [
    {"text": "买盘", "type": 0},
    {"text": "卖盘", "type": 1},
    {"text": "买卖盘", "type": 2},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list.map((e) {
        return Expanded(
          child: Container(
            child: SmallButton(
              color: active == e['type'] && e['type'] == 0
                  ? kGreenColor // 买盘选中颜色
                  : active == e['type'] && e['type'] == 1
                      ? kRedColor // 卖盘选中颜色
                      : active == e['type'] && e['type'] == 2
                          ? kPrimaryColor // 买卖盘选中颜色
                          : kBorderColor,
              isBorder: false,
              borderWidth: width(0.5),
              fontSize: sp(24),
              textColor: active == e['type'] ? kTextColorF2 : kTextColorF2,
              height: height(46),
              borderRadius: BorderRadius.all(Radius.circular(5)),
              padding: EdgeInsets.symmetric(horizontal: width(4)),
              text: e['text'],
              onPressed: () {
                setState(() => active = e['type']);
                widget.onActive(e['type']);
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}
