/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-09-07 16:27:43
* @LastEditors: Roy
* @LastEditTime: 2020-09-07 16:28:46
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/model/coin_detail_mdoel.dart
*/
class CoinDetailModel{
  String symbol;
  String amount;
  String number;
  String open;
  String close;
  String low;
  String high;
  String rate;
  int sort;

  CoinDetailModel(
      {this.symbol,
      this.amount,
      this.number,
      this.open,
      this.close,
      this.low,
      this.high,
      this.rate,
      this.sort});

  CoinDetailModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    amount = json['amount'];
    number = json['number'];
    open = json['open'];
    close = json['close'];
    low = json['low'];
    high = json['high'];
    rate = json['rate'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['amount'] = this.amount;
    data['number'] = this.number;
    data['open'] = this.open;
    data['close'] = this.close;
    data['low'] = this.low;
    data['high'] = this.high;
    data['rate'] = this.rate;
    data['sort'] = this.sort;
    return data;
  }
}