class CKlineTradeModel {
  String symbol;
  String price;
  String number;
  String direction;
  String createdAt;

  CKlineTradeModel(
      {this.symbol, this.price, this.number, this.direction, this.createdAt});

  CKlineTradeModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    price = json['price'];
    number = json['number'];
    direction = json['direction'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['price'] = this.price;
    data['number'] = this.number;
    data['direction'] = this.direction;
    data['created_at'] = this.createdAt;
    return data;
  }
}
