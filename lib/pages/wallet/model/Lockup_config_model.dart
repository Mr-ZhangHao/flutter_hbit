class LockupConfigModel {
  int id;
  int coinId;
  int day;
  int proportion;
  Object number;
  String createdAt;
  String updatedAt;
  String balance;
  String coin;


  LockupConfigModel(
       {this.id,
        this.coinId,
        this.day,
        this.proportion,
        this.number,
        this.createdAt,
        this.updatedAt,
        this.coin,
       });

  LockupConfigModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coinId = json['coin_id'];
    day = json['day'];
    proportion = json['proportion'];
    number = json['number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    balance = json['balance'];
    coin = json['coin'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coin_id'] = this.coinId;
    data['coin_name'] = this.day;
    data['proportion'] = this.proportion;
    data['number'] = this.number;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['balance'] = this.balance;
    data['coin'] = this.coin;
    return data;
  }
}