class C2cCoinsModel {
  int id;
  String name;
  String otcFee;
  Object otcNumDecimals;
  Object otcDeposit;
  Object otcFloatRange;
  Object marketPrice;
  Object changePercent;

  C2cCoinsModel(
      {this.id,
        this.name,
        this.otcFee,
        this.otcNumDecimals,
        this.otcDeposit,
        this.otcFloatRange,
        this.marketPrice,
        this.changePercent});

  C2cCoinsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    otcFee = json['otc_fee'];
    otcNumDecimals = json['otc_num_decimals'];
    otcDeposit = json['otc_deposit'];
    otcFloatRange = json['otc_float_range'];
    marketPrice = json['market_price'];
    changePercent = json['change_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['otc_fee'] = this.otcFee;
    data['otc_num_decimals'] = this.otcNumDecimals;
    data['otc_deposit'] = this.otcDeposit;
    data['otc_float_range'] = this.otcFloatRange;
    data['market_price'] = this.marketPrice;
    data['change_percent'] = this.changePercent;
    return data;
  }
}