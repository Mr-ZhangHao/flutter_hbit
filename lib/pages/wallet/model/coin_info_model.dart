class CoinInfoModel {
  int id;
  int userId;
  int coinId;
  String available;
  String disabled;
  String address;
  String usdtErc20;
  String usdtTrc20;
  String tag;
  int version;
  String erc20RechargePrompt;
  String erc20WithdrawPrompt;
  String trc20RechargePrompt;
  String trc20WithdrawPrompt;
  Coin coin;
  String cny;
  String erc20WithdrawMin;

  String erc20WithdrawMax;

  String erc20WithdrawFee;

  String trc20WithdrawMin;

  String trc20WithdrawMax;

  String trc20WithdrawFee;

  CoinInfoModel(
      {this.id,
      this.userId,
      this.coinId,
      this.available,
      this.disabled,
      this.address,
      this.usdtErc20,
      this.usdtTrc20,
      this.tag,
      this.version,
      this.cny,
      this.coin,
      this.erc20RechargePrompt,
      this.erc20WithdrawPrompt,
      this.trc20RechargePrompt,
      this.trc20WithdrawPrompt,
      this.erc20WithdrawFee,
      this.erc20WithdrawMax,
      this.erc20WithdrawMin,
      this.trc20WithdrawFee,
      this.trc20WithdrawMax,
      this.trc20WithdrawMin});

  CoinInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    coinId = json['coin_id'];
    available = json['available'];
    disabled = json['disabled'];
    address = json['address'];
    usdtErc20 = json['usdt_erc20'];
    usdtTrc20 = json['usdt_trc20'];
    tag = json['tag'];
    version = json['version'];
    cny = json['cny'];
    erc20RechargePrompt = json['erc20_recharge_prompt'];
    erc20WithdrawPrompt = json['erc20_withdraw_prompt'];
    trc20RechargePrompt = json['trc20_recharge_prompt'];
    trc20WithdrawPrompt = json['trc20_withdraw_prompt'];

    erc20WithdrawFee = json['erc20_withdraw_fee'];
    erc20WithdrawMax = json['erc20_withdraw_max'];
    erc20WithdrawMin = json['erc20_withdraw_min'];
    trc20WithdrawFee = json['trc20_withdraw_fee'];
    trc20WithdrawMax = json['trc20_withdraw_max'];
    trc20WithdrawMin = json['trc20_withdraw_min'];

    coin = json['coin'] != null ? new Coin.fromJson(json['coin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['coin_id'] = this.coinId;
    data['available'] = this.available;
    data['disabled'] = this.disabled;
    data['address'] = this.address;
    data['usdt_erc20'] = this.usdtErc20;
    data['usdt_trc20'] = this.usdtTrc20;
    data['tag'] = this.tag;
    data['version'] = this.version;
    data['cny'] = this.cny;
    data['erc20_recharge_prompt'] = this.erc20RechargePrompt;
    data['erc20_withdraw_prompt'] = this.erc20WithdrawPrompt;
    data['trc20_recharge_prompt'] = this.trc20RechargePrompt;
    data['trc20_withdraw_prompt'] = this.trc20WithdrawPrompt;

    data['erc20_withdraw_fee'] = this.erc20WithdrawFee;
    data['erc20_withdraw_max'] = this.erc20WithdrawMax;
    data['erc20_withdraw_min'] = this.erc20WithdrawMin;
    data['trc20_withdraw_fee'] = this.trc20WithdrawFee;
    data['trc20_withdraw_max'] = this.trc20WithdrawMax;
    data['trc20_withdraw_min'] = this.trc20WithdrawMin;

    if (this.coin != null) {
      data['coin'] = this.coin.toJson();
    }
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
  String rechargeMin;

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
      this.rechargePrompt,
      this.rechargeMin});

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
    rechargeMin = json['recharge_min'];
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
    data['recharge_min'] = this.rechargeMin;
    return data;
  }
}
