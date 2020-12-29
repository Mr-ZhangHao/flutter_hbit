/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-09-03 18:11:41
* @LastEditors: Roy
* @LastEditTime: 2020-09-15 17:31:52
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/model/contract_warehouse_model.dart
*/
class WareHouseModel {
  String symbol;
  String price;
  dynamic hand;
  dynamic dealHand;
  String type;
  int orderSn;
  String createdAt;
  int markType;

  WareHouseModel(
      {this.symbol, this.price, this.hand, this.dealHand, this.type, this.orderSn, this.createdAt, this.markType});

  WareHouseModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    price = json['price'];
    hand = json['hand'];
    dealHand = json['deal_hand'];
    type = json['type'];
    orderSn = json['order_sn'];
    createdAt = json['created_at'];
    markType = json['mark_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['price'] = this.price;
    data['hand'] = this.hand;
    data['deal_hand'] = this.dealHand;
    data['type'] = this.type;
    data['order_sn'] = this.orderSn;
    data['created_at'] = this.createdAt;
    data['mark_type'] = this.markType;
    return data;
  }
}
