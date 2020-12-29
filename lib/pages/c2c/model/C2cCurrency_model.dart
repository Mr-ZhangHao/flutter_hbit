class C2cCurrencyModel {
  int id;
  String currency;
  String chinese;
  String rate;
  int status;

  C2cCurrencyModel(
      {this.id, this.currency, this.chinese, this.rate, this.status});

  C2cCurrencyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currency = json['currency'];
    chinese = json['chinese'];
    rate = json['rate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['currency'] = this.currency;
    data['chinese'] = this.chinese;
    data['rate'] = this.rate;
    data['status'] = this.status;
    return data;
  }
}