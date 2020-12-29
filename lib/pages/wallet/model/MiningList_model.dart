class MiningListModel{
  int id;
  int user_id;
  Object coin;
  Object day;
  Object number;
  Object profit;
  Object star_time;
  Object end_time;
  int status;
  Object updated_at;
  int coin_id;


  MiningListModel(
      {this.id,
        this.user_id,
        this.coin,
        this.day,
        this.number,
        this.profit,
        this.star_time,
        this.end_time,
        this.status,
        this.updated_at,
        this.coin_id,
      });

  MiningListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    coin = json['coin'];
    day = json['day'];
    number = json['number'];
    profit = json['profit'];
    star_time = json['star_time'];
    end_time = json['end_time'];
    status = json['status'];
    updated_at = json['updated_at'];
    coin_id = json['coin_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    data['coin'] = this.coin;
    data['day'] = this.day;
    data['number'] = this.number;
    data['profit'] = this.profit;
    data['star_time'] = this.star_time;
    data['end_time'] = this.end_time;
    data['status'] = this.status;
    data['updated_at'] = this.updated_at;
    data['coin_id'] = this.coin_id;
    return data;
  }
}