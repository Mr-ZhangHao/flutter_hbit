/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-09-07 16:37:39
* @LastEditors: Roy
* @LastEditTime: 2020-09-11 10:30:50
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/model/kline_trade_model.dart
*/
class KLineTradeModel {
  int id;
  String side;
  String price;
  String number;
  String createdAt;

  KLineTradeModel(
      {this.id, this.side, this.price, this.number, this.createdAt});

  KLineTradeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    side = json['side'];
    price = json['price'];
    number = json['number'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['side'] = this.side;
    data['price'] = this.price;
    data['number'] = this.number;
    data['created_at'] = this.createdAt;
    return data;
  }
}