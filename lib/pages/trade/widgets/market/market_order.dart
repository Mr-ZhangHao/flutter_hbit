/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-12 15:35:56
* @LastEditors: Roy
* @LastEditTime: 2020-09-10 17:54:43
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/widgets/market/market_order.dart
*/
import 'package:HBit/common/event/TrderCoinListEvent.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/trade/model/order_model.dart';
import 'package:HBit/pages/trade/provider/contract_provider.dart';
import 'package:HBit/pages/trade/routes/index.dart';
import 'package:HBit/pages/trade/server/index.dart';
import 'package:HBit/routes/application.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'order_header.dart';
import 'order_item.dart';

class MarketOrder extends StatefulWidget {
  MarketOrder({Key key, this.pushResult, this.model, this.clearTimer}) : super(key: key);
  final Function pushResult;
  final ContractProvider model;
  final Function clearTimer;
  @override
  _MarketOrderState createState() => _MarketOrderState();
}

class _MarketOrderState extends State<MarketOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kWhite,
      padding: EdgeInsets.symmetric(horizontal: width(24)),
      child: Column(
        children: <Widget>[
          OrderListHeader(onTab: () {
            widget.clearTimer();
            Routers.pushResult(context, TradeRouter.orderList, (result) {
              widget.pushResult();
            });
          }),
          widget.model.list.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/contract/no_record.png',
                      width: width(230),
                      height: width(230),
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: height(20)),
                    Text(Tr.of(context).tradrNoEntrust, style: TextStyle(color: Color(0xffDBDBDB)))
                  ],
                )
              : Column(
                  children: listView(),
                ),
        ],
      ),
    );
  }

  List listView() {
    return widget.model.list.map<Widget>((item) {
      return OrderItemWidget(
          model: item,
          onTab: (v) {
            cancelOrder(v);
          });
    }).toList();
  }

  void cancelOrder(OrderModel model) {
    showAlertDialog(BackButtonBehavior.none, context: context, message: '${Tr.of(context).tradrCancelHint}?', cancel: () {}, confirm: () async {
      Toast.showLoading('loading');
      TradeServer.requestCancelOrder(model.id).then((value) {
        Toast.showSuccess(Tr.of(context).tradrCancelSuccess);

        Application.eventBus
            .fire(TrderCoinListEvent());
      }).catchError((e) {});
    });
  }
}
