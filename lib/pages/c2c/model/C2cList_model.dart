class C2cListModel {
  int id;
  int userId;
  int coinId;
  String side;
  String symbol;
  Null avatar;
  String username;
  int orderCount;
  String finishPercent;
  String minCny;
  String maxCny;
  Object number;
  int priceType;
  String price;
  int bank;
  int alipay;
  int wechat;

  C2cListModel(
      {this.id,
        this.userId,
        this.coinId,
        this.side,
        this.symbol,
        this.avatar,
        this.username,
        this.orderCount,
        this.finishPercent,
        this.minCny,
        this.maxCny,
        this.number,
        this.priceType,
        this.price,
        this.bank,
        this.alipay,
        this.wechat});

  C2cListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    coinId = json['coin_id'];
    side = json['side'];
    symbol = json['symbol'];
    avatar = json['avatar'];
    username = json['username'];
    orderCount = json['order_count'];
    finishPercent = json['finish_percent'];
    minCny = json['min_cny'];
    maxCny = json['max_cny'];
    number = json['number'];
    priceType = json['price_type'];
    price = json['price'];
    bank = json['bank'];
    alipay = json['alipay'];
    wechat = json['wechat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['coin_id'] = this.coinId;
    data['side'] = this.side;
    data['symbol'] = this.symbol;
    data['avatar'] = this.avatar;
    data['username'] = this.username;
    data['order_count'] = this.orderCount;
    data['finish_percent'] = this.finishPercent;
    data['min_cny'] = this.minCny;
    data['max_cny'] = this.maxCny;
    data['number'] = this.number;
    data['price_type'] = this.priceType;
    data['price'] = this.price;
    data['bank'] = this.bank;
    data['alipay'] = this.alipay;
    data['wechat'] = this.wechat;
    return data;
  }
}