class BuyDetailModel {
  OrderBook orderBook;
  SellInfo sellInfo;

  BuyDetailModel({this.orderBook, this.sellInfo});

  BuyDetailModel.fromJson(Map<String, dynamic> json) {
    orderBook = json['order_book'] != null
        ? new OrderBook.fromJson(json['order_book'])
        : null;
    sellInfo = json['sell_info'] != null
        ? new SellInfo.fromJson(json['sell_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderBook != null) {
      data['order_book'] = this.orderBook.toJson();
    }
    if (this.sellInfo != null) {
      data['sell_info'] = this.sellInfo.toJson();
    }
    return data;
  }
}

class OrderBook {
  int orderNo;
  int coinId;
  String symbol;
  int bank;
  String bankName;
  int alipay;
  int wechat;
  String price;
  int number;
  String minCny;
  String maxCny;

  OrderBook(
      {this.orderNo,
        this.coinId,
        this.symbol,
        this.bank,
        this.bankName,
        this.alipay,
        this.wechat,
        this.price,
        this.number,
        this.minCny,
        this.maxCny});

  OrderBook.fromJson(Map<String, dynamic> json) {
    orderNo = json['order_no'];
    coinId = json['coin_id'];
    symbol = json['symbol'];
    bank = json['bank'];
    bankName = json['bank_name'];
    alipay = json['alipay'];
    wechat = json['wechat'];
    price = json['price'];
    number = json['number'];
    minCny = json['min_cny'];
    maxCny = json['max_cny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_no'] = this.orderNo;
    data['coin_id'] = this.coinId;
    data['symbol'] = this.symbol;
    data['bank'] = this.bank;
    data['bank_name'] = this.bankName;
    data['alipay'] = this.alipay;
    data['wechat'] = this.wechat;
    data['price'] = this.price;
    data['number'] = this.number;
    data['min_cny'] = this.minCny;
    data['max_cny'] = this.maxCny;
    return data;
  }
}

class SellInfo {
  String username;
  String createdAt;
  int kycStatus;
  int orderCount;
  String finishPercent;
  int avgConfirmTime;

  SellInfo(
      {this.username,
        this.createdAt,
        this.kycStatus,
        this.orderCount,
        this.finishPercent,
        this.avgConfirmTime});

  SellInfo.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    createdAt = json['created_at'];
    kycStatus = json['kyc_status'];
    orderCount = json['order_count'];
    finishPercent = json['finish_percent'];
    avgConfirmTime = json['avg_confirm_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['created_at'] = this.createdAt;
    data['kyc_status'] = this.kycStatus;
    data['order_count'] = this.orderCount;
    data['finish_percent'] = this.finishPercent;
    data['avg_confirm_time'] = this.avgConfirmTime;
    return data;
  }
}