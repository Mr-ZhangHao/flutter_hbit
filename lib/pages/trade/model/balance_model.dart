/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-22 14:50:12
* @LastEditors: Roy
* @LastEditTime: 2020-09-09 12:01:57
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/model/balance_model.dart
*/
class BalanceModel {
  int id;
  int userId;
  int coinId;
  String available;
  String disabled;
  dynamic address;
  dynamic tag;
  dynamic version;
  // Coin coin;

  BalanceModel(
      {this.id,
      this.userId,
      this.coinId,
      this.available,
      this.disabled,
      this.address,
      this.tag,
      this.version,
      // this.coin
      });

  BalanceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    coinId = json['coin_id'];
    available = json['available'];
    disabled = json['disabled'];
    address = json['address'];
    tag = json['tag'];
    version = json['version'];
    // coin = json['coin'] != null ? new Coin.fromJson(json['coin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['coin_id'] = this.coinId;
    data['available'] = this.available;
    data['disabled'] = this.disabled;
    data['address'] = this.address;
    data['tag'] = this.tag;
    data['version'] = this.version;
    // if (this.coin != null) {
    //   data['coin'] = this.coin.toJson();
    // }
    return data;
  }
}

class Coin {
  int id;
  String name;
  String chainType;
  int canRecharge;
  int canWithdraw;
  String withdrawMin;
  String withdrawMax;
  String withdrawFee;
  int isOtc;
  String otcFee;
  int otcNumDecimals;
  String otcDeposit;
  int otcFloatRange;
  int isSpot;
  int isTag;
  String withdrawPrompt;
  String rechargePrompt;

  Coin(
      {this.id,
      this.name,
      this.chainType,
      this.canRecharge,
      this.canWithdraw,
      this.withdrawMin,
      this.withdrawMax,
      this.withdrawFee,
      this.isOtc,
      this.otcFee,
      this.otcNumDecimals,
      this.otcDeposit,
      this.otcFloatRange,
      this.isSpot,
      this.isTag,
      this.withdrawPrompt,
      this.rechargePrompt});

  Coin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    chainType = json['chain_type'];
    canRecharge = json['can_recharge'];
    canWithdraw = json['can_withdraw'];
    withdrawMin = json['withdraw_min'];
    withdrawMax = json['withdraw_max'];
    withdrawFee = json['withdraw_fee'];
    isOtc = json['is_otc'];
    otcFee = json['otc_fee'];
    otcNumDecimals = json['otc_num_decimals'];
    otcDeposit = json['otc_deposit'];
    otcFloatRange = json['otc_float_range'];
    isSpot = json['is_spot'];
    isTag = json['is_tag'];
    withdrawPrompt = json['withdraw_prompt'];
    rechargePrompt = json['recharge_prompt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['chain_type'] = this.chainType;
    data['can_recharge'] = this.canRecharge;
    data['can_withdraw'] = this.canWithdraw;
    data['withdraw_min'] = this.withdrawMin;
    data['withdraw_max'] = this.withdrawMax;
    data['withdraw_fee'] = this.withdrawFee;
    data['is_otc'] = this.isOtc;
    data['otc_fee'] = this.otcFee;
    data['otc_num_decimals'] = this.otcNumDecimals;
    data['otc_deposit'] = this.otcDeposit;
    data['otc_float_range'] = this.otcFloatRange;
    data['is_spot'] = this.isSpot;
    data['is_tag'] = this.isTag;
    data['withdraw_prompt'] = this.withdrawPrompt;
    data['recharge_prompt'] = this.rechargePrompt;
    return data;
  }
}