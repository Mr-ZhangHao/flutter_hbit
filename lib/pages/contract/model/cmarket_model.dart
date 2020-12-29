/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-09-14 14:10:29
* @LastEditors: Roy
* @LastEditTime: 2020-09-15 16:13:31
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/model/cmarket_model.dart
*/
class CMarketModel {
  String symbol;
  String now;
  String high;
  String low;
  String rate;
  String open;
  String amount;
  String vol;
  String handNum;

  CMarketModel(
      {this.symbol,
      this.now,
      this.high,
      this.low,
      this.rate,
      this.open,
      this.amount,
      this.vol,
      this.handNum});

  CMarketModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    now = json['now'];
    high = json['high'];
    low = json['low'];
    rate = json['rate'];
    open = json['open'];
    amount = json['amount'];
    vol = json['vol'];
    handNum = json['hand_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['now'] = this.now;
    data['high'] = this.high;
    data['low'] = this.low;
    data['rate'] = this.rate;
    data['open'] = this.open;
    data['amount'] = this.amount;
    data['vol'] = this.vol;
    data['hand_num'] = this.handNum;
    return data;
  }
}