class RateModel {
  String symbol;
  String maker;
  String taker;

  RateModel({this.symbol, this.maker, this.taker});

  RateModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    maker = json['maker'];
    taker = json['taker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['maker'] = this.maker;
    data['taker'] = this.taker;
    return data;
  }
}

class FeeModel {
  String name;
  String tip;
  num fee;
  num min;
  num singleMax;
  num dayMax;

  FeeModel({this.name, this.tip, this.fee, this.min, this.singleMax, this.dayMax});

  FeeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    tip = json['tip'];
    fee = json['fee'];
    min = json['min'];
    singleMax = json['single_max'];
    dayMax = json['day_max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['tip'] = this.tip;
    data['fee'] = this.fee;
    data['min'] = this.min;
    data['single_max'] = this.singleMax;
    data['day_max'] = this.dayMax;
    return data;
  }
}
