/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-09-27 18:09:46
* @LastEditors: Roy
* @LastEditTime: 2020-09-29 16:49:51
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/model/plan_history_model.dart
*/
class PlanHistoryModel {
  String symbol;
  String price;
  String triggerPrice;
  dynamic hand;
  int status;
  String type;
  int orderSn;
  String mark;
  String createdAt;
  String updatedAt;
  dynamic hasHand;
  int markType;
  int flash;

  PlanHistoryModel(
      {this.symbol,
      this.price,
      this.triggerPrice,
      this.hand,
      this.status,
      this.type,
      this.orderSn,
      this.mark,
      this.createdAt,
      this.updatedAt,
      this.hasHand,
      this.markType,
      this.flash});

  PlanHistoryModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    price = json['price'];
    triggerPrice = json['trigger_price'];
    hand = json['hand'];
    status = json['status'];
    type = json['type'];
    orderSn = json['order_sn'];
    mark = json['mark'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hasHand = json['has_hand'];
    markType = json['mark_type'];
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
    data['mark'] = this.mark;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['has_hand'] = this.hasHand;
    data['mark_type'] = this.markType;
    data['flash'] = this.flash;
    return data;
  }
}
