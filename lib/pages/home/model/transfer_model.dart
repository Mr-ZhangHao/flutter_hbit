/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-08 20:15:21
* @LastEditors: Jack
* @LastEditTime: 2020-08-13 11:51:40
* @Deprecated: 否
* @FilePath: /ETF/lib/pages/home/model/transfer_model.dart
*/
class TransferModel {
  int id;
  int coinId;
  int userId;
  int dealId;
  double number;
  double interest;
  int type;
  String createTime;
  int deep;
  int awardType;
  double rate;
  String coinName;

  TransferModel(
      {this.id,
      this.coinId,
      this.userId,
      this.dealId,
      this.number,
      this.interest,
      this.type,
      this.createTime,
      this.deep,
      this.awardType,
      this.rate,
      this.coinName});

  TransferModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coinId = json['coinId'];
    userId = json['userId'];
    dealId = json['dealId'];
    number = json['number'];
    interest = json['interest'];
    type = json['type'];
    createTime = json['createTime'];
    deep = json['deep'];
    awardType = json['awardType'];
    rate = json['rate'];
    coinName = json['coinName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coinId'] = this.coinId;
    data['userId'] = this.userId;
    data['dealId'] = this.dealId;
    data['number'] = this.number;
    data['interest'] = this.interest;
    data['type'] = this.type;
    data['createTime'] = this.createTime;
    data['deep'] = this.deep;
    data['awardType'] = this.awardType;
    data['rate'] = this.rate;
    data['coinName'] = this.coinName;
    return data;
  }
}
