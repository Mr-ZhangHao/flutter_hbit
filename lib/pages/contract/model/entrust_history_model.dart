/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-09-04 15:04:04
* @LastEditors: Roy
* @LastEditTime: 2020-09-17 11:47:12
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/model/entrust_history_model.dart
*/
class EntrustHistoryModel {
  String symbol;
  String price;
  String tradePrice;
  dynamic hand;
  dynamic dealHand;
  String type;
  int result;
  String fee;
  dynamic profit;
  int status;
  int orderType;
  String createdAt;
  int markType;

  EntrustHistoryModel(
      {this.symbol,
      this.price,
      this.tradePrice,
      this.hand,
      this.dealHand,
      this.type,
      this.result,
      this.fee,
      this.profit,
      this.status,
      this.orderType,
      this.createdAt,
      this.markType});

  EntrustHistoryModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    price = json['price'];
    tradePrice = json['trade_price'];
    hand = json['hand'];
    dealHand = json['deal_hand'];
    type = json['type'];
    result = json['result'];
    fee = json['fee'];
    profit = json['profit'];
    status = json['status'];
    orderType = json['order_type'];
    createdAt = json['created_at'];
    markType = json['mark_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['price'] = this.price;
    data['trade_price'] = this.tradePrice;
    data['hand'] = this.hand;
    data['deal_hand'] = this.dealHand;
    data['type'] = this.type;
    data['result'] = this.result;
    data['fee'] = this.fee;
    data['profit'] = this.profit;
    data['status'] = this.status;
    data['order_type'] = this.orderType;
    data['created_at'] = this.createdAt;
    data['mark_type'] = this.markType;
    return data;
  }
}
