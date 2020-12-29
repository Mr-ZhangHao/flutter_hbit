class BibiRecored {
  int id;
  int coinId;
  String coinName;
  int userId;
  String opName;
  String number;
  String createdAt;
  String status;
  String address;
  String chainName;
  String hash;

  BibiRecored(
      {this.id,
      this.coinId,
      this.coinName,
      this.userId,
      this.opName,
      this.number,
      this.createdAt,
      this.status,
      this.address,
      this.chainName,
      this.hash});

  BibiRecored.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coinId = json['coin_id'];
    coinName = json['coin_name'];
    userId = json['user_id'];
    opName = json['op_name'];
    number = json['number'];
    createdAt = json['created_at'];
    status = json['status'];
    address = json['address'];
    chainName = json['chain_name'];
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coin_id'] = this.coinId;
    data['coin_name'] = this.coinName;
    data['user_id'] = this.userId;
    data['op_name'] = this.opName;
    data['number'] = this.number;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    data['address'] = this.address;
    data['chain_name'] = this.chainName;
    data['hash'] = this.hash;
    return data;
  }
}
