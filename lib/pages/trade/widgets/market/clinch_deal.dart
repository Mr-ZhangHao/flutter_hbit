/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-24 16:52:03
* @LastEditors: Roy
* @LastEditTime: 2020-09-27 18:19:01
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/widgets/market/clinch_deal.dart
*/
import 'dart:async';

import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/trade/model/kline_trade_model.dart';
import 'package:HBit/pages/trade/provider/contract_provider.dart';
import 'package:HBit/providers/provider_widget.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';

class ClinchDeal extends StatefulWidget {
  final String coinName;
  const ClinchDeal({Key key, this.coinName}) : super(key: key);
  @override
  _ClinchDealState createState() => _ClinchDealState();
}

class _ClinchDealState extends State<ClinchDeal> {
  Timer timer;

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<OrderRecordProvider>(
        model: OrderRecordProvider(),
        onModelReady: (model) {
          if (GlobalConfig.isTimer) {
            timer = Timer.periodic(Duration(seconds: 2), (timer) {
              model.klineTradeList(widget.coinName);
            });
          } else {
            model.klineTradeList(widget.coinName);
          }
        },
        builder: (context, model, child) {
          return Container(
            color: Color(0xff061439),
            child: Column(
              children: <Widget>[
                _headerView(),
                Expanded(child: Column(children: _listView(model))),
              ],
            ),
          );
        });
  }

  Widget _headerView() {
    List coinList = widget.coinName.split('/');
    return Container(
      height: height(90),
      color: Color(0xff050E2F),
      padding: EdgeInsets.symmetric(horizontal: width(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              Tr.of(context).TradrTime,
              style: TextStyle(color: Color(0xff6374A3), fontSize: sp(24)),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Text(
              Tr.of(context).tradrDirection,
              style: TextStyle(color: Color(0xff6374A3), fontSize: sp(24)),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              '${Tr.of(context).tradrPrice}(${coinList.last.toString().toUpperCase()})',
              style: TextStyle(color: Color(0xff6374A3), fontSize: sp(24)),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              '${Tr.of(context).TradrQuantity}(${coinList.first.toString().toUpperCase()})',
              style: TextStyle(color: Color(0xff6374A3), fontSize: sp(24)),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  _listView(OrderRecordProvider model) {
    return model.tradeHistoryModelList.asMap().keys.map((index) {
      KLineTradeModel tradeHistory = model.tradeHistoryModelList[index];
      return Container(
        height: height(80),
        // width: double.infinity,

        padding: EdgeInsets.symmetric(horizontal: width(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                tradeHistory.createdAt == '-' ? tradeHistory.createdAt : tradeHistory.createdAt.split(' ').last,
                style: TextStyle(color: Colors.white, fontSize: sp(24)),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: Text(
                tradeHistory.side == '' ? '-' : tradeHistory.side == 'BUY' ? Tr.of(context).tradrBuy : Tr.of(context).tradrSell,
                style: TextStyle(color: tradeHistory.side == 'BUY' ? kRedColor : kGreenColor, fontSize: sp(24)),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                tradeHistory.price == '-' ? tradeHistory.price : Utils.cutZero(tradeHistory.price),
                style: TextStyle(color: Colors.white, fontSize: sp(24)),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                tradeHistory.number == '-'
                    ? tradeHistory.number
                    : Utils.conversionNum(double.parse(tradeHistory.number)),
                style: TextStyle(color: Colors.white, fontSize: sp(24)),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
