class RecommendMarketModel {
  Object id;
  Object symbol;
  Object status;
  Object coinName;
  Object coinId;
  Object coinDecimals;
  Object marketName;
  Object marketId;
  Object marketDecimals;
  Object priceStep;
  Object numberMin;
  Object numberStep;
  Object totalMin;
  Object open;
  Object close;
  Object high;
  Object low;
  Object number;
  Object total;
  Object rate;
  List<ChartData> kline;

  RecommendMarketModel(
      {this.id,
      this.symbol,
      this.status,
      this.coinName,
      this.coinId,
      this.coinDecimals,
      this.marketName,
      this.marketId,
      this.marketDecimals,
      this.priceStep,
      this.numberMin,
      this.numberStep,
      this.totalMin,
      this.open,
      this.close,
      this.high,
      this.low,
      this.number,
      this.total,
      this.rate,
      this.kline});

  RecommendMarketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    status = json['status'];
    coinName = json['coin_name'];
    coinId = json['coin_id'];
    coinDecimals = json['coin_decimals'];
    marketName = json['market_name'];
    marketId = json['market_id'];
    marketDecimals = json['market_decimals'];
    priceStep = json['price_step'];
    numberMin = json['number_min'];
    numberStep = json['number_step'];
    totalMin = json['total_min'];
    open = json['open'];
    close = json['close'];
    high = json['high'];
    low = json['low'];
    number = json['number'];
    total = json['total'];
    rate = json['rate'];

    if (json['kline'] != null) {
      kline = new List<ChartData>();
      json['kline'].forEach((v) {
        kline.add(new ChartData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['status'] = this.status;
    data['coin_name'] = this.coinName;
    data['coin_id'] = this.coinId;
    data['coin_decimals'] = this.coinDecimals;
    data['market_name'] = this.marketName;
    data['market_id'] = this.marketId;
    data['market_decimals'] = this.marketDecimals;
    data['price_step'] = this.priceStep;
    data['number_min'] = this.numberMin;
    data['number_step'] = this.numberStep;
    data['total_min'] = this.totalMin;
    data['open'] = this.open;
    data['close'] = this.close;
    data['high'] = this.high;
    data['low'] = this.low;
    data['number'] = this.number;
    data['total'] = this.total;
    if (this.kline != null) {
      data['kline'] = this.kline.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChartData {
  Object time;
  Object close;
  ChartData({this.time, this.close});

  ChartData.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    close = json['close'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['close'] = this.close;

    return data;
  }
}
