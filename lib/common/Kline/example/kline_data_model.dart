/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2019-12-12 23:21:36
* @LastEditors: Roy
* @LastEditTime: 2020-06-01 14:37:44
* @Deprecated: 否
* @FilePath: /KEMX_Flutter/lib/common/Kline/example/kline_data_model.dart
*/
class MarketData {
  int time;
  Object open;
  Object high;
  Object low;
  Object close;
  Object volume;

  MarketData(
      {this.time, this.open, this.high, this.low, this.close, this.volume});

  MarketData.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];
    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['open'] = this.open;
    data['high'] = this.high;
    data['low'] = this.low;
    data['close'] = this.close;
    data['volume'] = this.volume;
    return data;
  }
}