/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-09-16 17:22:50
* @LastEditors: Roy
* @LastEditTime: 2020-09-29 16:42:13
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/model/contract_plan_model.dart
*/
class ContractPlanModel {
  String symbol;
  String price;
  String triggerPrice;
  dynamic hand;
  int status;
  String type;
  int orderSn;
  String createdAt;
  int markType;
  int triggerType;
  int flash;

  ContractPlanModel(
      {this.symbol,
      this.price,
      this.triggerPrice,
      this.hand,
      this.status,
      this.type,
      this.orderSn,
      this.createdAt,
      this.markType,
      this.triggerType,
      this.flash});

  ContractPlanModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    price = json['price'];
    triggerPrice = json['trigger_price'];
    hand = json['hand'];
    status = json['status'];
    type = json['type'];
    orderSn = json['order_sn'];
    createdAt = json['created_at'];
    markType = json['mark_type'];
    triggerType = json['trigger_type'];
    flash = json['flash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['price'] = this.price;
    data['trigger_price'] = this.triggerPrice;
    data['hand'] = this.hand;
    data['status'] = this.status;
    data['type'] = this.type;
    data['order_sn'] = this.orderSn;
    data['created_at'] = this.createdAt;
    data['mark_type'] = this.markType;
    data['trigger_type'] = this.triggerType;
    data['flash'] = this.flash;
    return data;
  }
}
