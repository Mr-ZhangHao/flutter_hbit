/*
* @message: 行情邮编深度列表
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-12 10:35:34
* @LastEditors: Roy
* @LastEditTime: 2020-09-15 12:38:37
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/widgets/market/market_right.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/wrap/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/trade/provider/contract_provider.dart';
import 'package:HBit/pages/trade/provider/market_provider.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../../trade_screen.dart';

class MarketRight extends StatefulWidget {
  MarketRight({Key key, this.model1, this.model2}) : super(key: key);
  final OrderRecordProvider model2;
  final MarketProvider model1;
  @override
  _MarketRightState createState() => _MarketRightState();
}

class _MarketRightState extends State<MarketRight> {
  TextStyle styleSz20 = TextStyle(color: kTextColor9, fontSize: sp(20));
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: width(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: height(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${Tr.of(context).tradrPrice}', style: styleSz20),
                Text('${Tr.of(context).TradrQuantity}', style: styleSz20),
              ],
            ),
            SizedBox(height: height(12)),
            Column(
                verticalDirection: VerticalDirection.up, children: _buildItemList(widget.model2.sells, BuyType.sell)),
            SizedBox(height: height(14)),
            Row(
              children: <Widget>[
                Text(
                  Utils.formatNum(widget.model2?.marketListModel?.close ?? '0', pos: 6),
                  textAlign: TextAlign.left,
                  style: TextStyle(color: kRedColor, fontSize: sp(28), fontWeight: FontWeight.w600),
                ),
                SizedBox(width: width(4)),
             /*   Text(
                  '≈${Utils.formatNum(double.parse(widget.model2?.marketListModel?.close ?? '0') * widget.model1.rateCNY, pos: 2)}CNY',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: sp(18)),
                ),*/
              ],
            ),
            SizedBox(height: height(14)),
            Column(children: _buildItemList(widget.model2.buys, BuyType.buy)),
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
  List<Widget> _buildItemList(List list, BuyType type) {
    TextStyle styleSz26 = TextStyle(color: Color(0xffc0c0c0), fontSize: sp(20));
    double maxWidth = 0.01;
    print(list.last.last);
    if (list.last.last != '-') {
      List<num> numList = list.map((e) => num.parse(e.last)).toList();
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
              width: Screen.width * (num.parse(item.last != '-' ? item.last : '0.01') / maxWidth),
              beginColor: type == BuyType.sell ? Color(0xffFFF4F4) : Color(0xffFAFFFB),
              endColor: type == BuyType.sell ? Color(0xffFFE7E7) : Color(0xffD9FDE4),
              child: Container(
                height: height(44),
                margin: EdgeInsets.symmetric(vertical: height(2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(item.first == '-' ? '-' : Utils.cutZero(item.first),
                        style: TextStyle(fontSize: sp(20), color: type == BuyType.buy ? kGreenColor : kRedColor)),
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
    list = [
      {"text": Tr.of(context).tradrBuyOrder, "type": 0},
      {"text": Tr.of(context).tradrSellOrder, "type": 1},
      {"text":Tr.of(context).tradrBuyAndSell, "type": 2},
    ];


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
