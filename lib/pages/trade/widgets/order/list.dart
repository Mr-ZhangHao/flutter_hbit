/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-19 17:20:24
* @LastEditors: Roy
* @LastEditTime: 2020-09-10 17:39:16
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/widgets/order/list.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/pages/trade/model/order_model.dart';
import 'package:HBit/pages/trade/server/index.dart';
import 'package:HBit/pages/trade/widgets/market/order_item.dart';
import 'package:HBit/pages/trade/widgets/order/histtory_item.dart';
import 'package:flutter/material.dart';

import '../../../../common/refresh/page_list.dart';
import '../../../../utils/screen.dart';



class OrderList extends PageList {
  final String type;
  final String symbol;
  final String side;
  OrderList(this.type, this.symbol, this.side, {Key key}) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends PageListState<OrderModel, OrderList> {
  bool enablePullUp = true;
  @override
  void initState() {
    super.initState();
    loadData(1);
  }

  @override
  Widget build(BuildContext context) {
    return buildList(context);
  }

  @override
  buildItem(OrderModel model) {
    if ((widget as OrderList).type == 'current') {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: width(24)),
        child: OrderItemWidget(),
      );
    } else {}
    return HistoryItemWidget(model);
  }

  @override
  empty() {
    return Center(
      child: Column(
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
          Text('${Tr.of(context).homeNodata}', style: TextStyle(color: Color(0xffDBDBDB)))
        ],
      ),
    );
  }

  ///加载数据
  @override
  loadPage(
      {int page,
      Function(List<OrderModel>) onSuccess,
      Function onErr}) async {
    var response =
        await TradeServer.orderRecord(page, '', perPage: 10);
    onSuccess(response.map<OrderModel>((e) => OrderModel.fromJson(e)).toList());
  }

  refreshData() {
    loadData(1);
  }
}
