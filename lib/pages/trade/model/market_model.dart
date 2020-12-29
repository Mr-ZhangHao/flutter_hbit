/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-05-27 16:01:11
* @LastEditors: Roy
* @LastEditTime: 2020-09-09 10:26:23
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/model/market_model.dart
*/
class MyMarketModel {
  int id;
  String symbol;
  String coinName;
  String marketName;
  String open;
  String close;
  String high;
  String low;
  Object number;
  Object total;
  String rate;

  MyMarketModel(
      {this.id,
      this.symbol,
      this.coinName,
      this.marketName,
      this.open,
      this.close,
      this.high,
      this.low,
      this.number,
      this.total,
      this.rate});

  MyMarketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    coinName = json['coin_name'];
    marketName = json['market_name'];
    open = json['open'];
    close = json['close'];
    high = json['high'];
    low = json['low'];
    number = json['number'];
    total = json['total'];
    rate = ((num.parse(json['close']) - num.parse(json['open'])) / num.parse(json['open'])).toString();
    // num.parse(json['close']) - num.parse(json['open']) / num.parse(json['open']
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['coin_name'] = this.coinName;
    data['market_name'] = this.marketName;
    data['open'] = this.open;
    data['close'] = this.close;
    data['high'] = this.high;
    data['low'] = this.low;
    data['number'] = this.number;
    data['total'] = this.total;
    data['rate'] = this.rate;
    return data;
  }
}
