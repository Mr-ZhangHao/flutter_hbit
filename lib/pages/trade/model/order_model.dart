/*
* @message: 文件描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-29 18:34:45
* @LastEditors: Roy
* @LastEditTime: 2020-09-09 16:06:40
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/model/order_model.dart
*/
class OrderModel {
  int id;
  String symbol;
  String side;
  String type;
  String price;
  String number;
  String dealNumber;
  String total;
  int status;
  String createdAt;
  String fee;

  OrderModel(
      {this.id,
      this.symbol,
      this.side,
      this.type,
      this.price,
      this.number,
      this.dealNumber,
      this.total,
      this.status,
      this.fee,
      this.createdAt});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    side = json['side'];
    type = json['type'];
    price = json['price'];
    number = json['number'];
    dealNumber = json['deal_number'];
    total = json['total'];
    status = json['status'];
    createdAt = json['created_at'];
    fee = json['fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['side'] = this.side;
    data['type'] = this.type;
    data['price'] = this.price;
    data['number'] = this.number;
    data['deal_number'] = this.dealNumber;
    data['total'] = this.total;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['fee'] = this.fee;
    return data;
  }
}