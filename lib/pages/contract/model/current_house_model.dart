class CurrentHouseModel {
  String symbol;
  String openPrice;
  String type;
  dynamic multiple;
  String holdPrice;
  dynamic leftHand;
  String bond;
  dynamic hasProfit;
  dynamic futureProfit;
  num totalHand;
  String failPrice;
  String handNum;

  /// "mark_type": 1：开多 2：开空 3：平多 4：平空
  int markType;
  int positionId;

  CurrentHouseModel(
      {this.symbol,
      this.openPrice,
      this.type,
      this.multiple,
      this.holdPrice,
      this.leftHand,
      this.bond,
      this.hasProfit,
      this.futureProfit,
      this.totalHand,
      this.failPrice,
      this.markType,
      this.handNum,
      this.positionId});

  CurrentHouseModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    openPrice = json['open_price'];
    type = json['type'];
    multiple = json['multiple'];
    holdPrice = json['hold_price'];
    leftHand = json['left_hand'];
    bond = json['bond'];
    hasProfit = json['has_profit'];
    futureProfit = json['future_profit'];
    totalHand = json['total_hand'];
    failPrice = json['fail_price'];
    markType = json['mark_type'];
    handNum = json['hand_num'];
    positionId = json['position_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['open_price'] = this.openPrice;
    data['type'] = this.type;
    data['multiple'] = this.multiple;
    data['hold_price'] = this.holdPrice;
    data['left_hand'] = this.leftHand;
    data['bond'] = this.bond;
    data['has_profit'] = this.hasProfit;
    data['future_profit'] = this.futureProfit;
    data['total_hand'] = this.totalHand;
    data['fail_price'] = this.failPrice;
    data['mark_type'] = this.markType;
    data['hand_num'] = this.handNum;
    data['position_id'] = this.positionId;
    return data;
  }
}
