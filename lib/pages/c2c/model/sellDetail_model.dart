class SellDetailModel {
  OrderBook orderBook;
  BuyInfo buyInfo;

  SellDetailModel({this.orderBook, this.buyInfo});

  SellDetailModel.fromJson(Map<String, dynamic> json) {
    orderBook = json['order_book'] != null
        ? new OrderBook.fromJson(json['order_book'])
        : null;
    buyInfo = json['buy_info'] != null
        ? new BuyInfo.fromJson(json['buy_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderBook != null) {
      data['order_book'] = this.orderBook.toJson();
    }
    if (this.buyInfo != null) {
      data['buy_info'] = this.buyInfo.toJson();
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

class BuyInfo {
  String username;
  String createdAt;
  int kycStatus;
  int orderCount;
  String finishPercent;
  int avgPaymentTime;

  BuyInfo(
      {this.username,
        this.createdAt,
        this.kycStatus,
        this.orderCount,
        this.finishPercent,
        this.avgPaymentTime});

  BuyInfo.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    createdAt = json['created_at'];
    kycStatus = json['kyc_status'];
    orderCount = json['order_count'];
    finishPercent = json['finish_percent'];
    avgPaymentTime = json['avg_payment_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['created_at'] = this.createdAt;
    data['kyc_status'] = this.kycStatus;
    data['order_count'] = this.orderCount;
    data['finish_percent'] = this.finishPercent;
    data['avg_payment_time'] = this.avgPaymentTime;
    return data;
  }
}