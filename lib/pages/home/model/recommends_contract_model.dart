import 'package:HBit/pages/home/model/recommend_market_model.dart';

class RecommendsContractModel {
  String symbol;
  String now;
  String high;
  String low;
  String rate;
  String open;
  String amount;
  String vol;
  String handNum;
  List<ChartData> line;

  RecommendsContractModel(
      {this.symbol,
      this.now,
      this.high,
      this.low,
      this.rate,
      this.open,
      this.amount,
      this.vol,
      this.handNum,
      this.line});

  RecommendsContractModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    now = json['now'];
    high = json['high'];
    low = json['low'];
    rate = json['rate'];
    open = json['open'];
    amount = json['amount'];
    vol = json['vol'];
    handNum = json['hand_num'];
    if (json['line'] != null) {
      line = new List<ChartData>();
      json['line'].forEach((v) {
        line.add(new ChartData.fromJson(v));
      });
    }
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
    if (this.line != null) {
      data['line'] = this.line.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
