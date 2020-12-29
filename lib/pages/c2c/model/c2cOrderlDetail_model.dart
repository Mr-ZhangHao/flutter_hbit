class c2cOrderlDetailModel {
  OrderInfo orderInfo;
  OtherInfo otherInfo;
  List<PaymentAccount> paymentAccount;

  c2cOrderlDetailModel({this.orderInfo, this.otherInfo, this.paymentAccount});

  c2cOrderlDetailModel.fromJson(Map<String, dynamic> json) {
    orderInfo = json['order_info'] != null
        ? new OrderInfo.fromJson(json['order_info'])
        : null;
    otherInfo = json['other_info'] != null
        ? new OtherInfo.fromJson(json['other_info'])
        : null;
    if (json['payment_account'] != null) {
      paymentAccount = new List<PaymentAccount>();
      json['payment_account'].forEach((v) {
        paymentAccount.add(new PaymentAccount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderInfo != null) {
      data['order_info'] = this.orderInfo.toJson();
    }
    if (this.otherInfo != null) {
      data['other_info'] = this.otherInfo.toJson();
    }
    if (this.paymentAccount != null) {
      data['payment_account'] =
          this.paymentAccount.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderInfo {
  int id;
  int orderNo;
  String side;
  String symbol;
  int coinId;
  int status;
  String number;
  String price;
  String fee;
  String remark;
  String createdAt;
  int limitPayTime;
  Object paymentAt;
  int limitFinishTime;
  Object paymentMethod;
  Object paymentBank;
  Object paymentAccount;
  Object paymentName;
  Object complainAt;
  Object finishAt;
  Object cancelAt;
  int cancelType;

  OrderInfo(
      {this.id,
        this.orderNo,
        this.side,
        this.symbol,
        this.coinId,
        this.status,
        this.number,
        this.price,
        this.fee,
        this.remark,
        this.createdAt,
        this.limitPayTime,
        this.paymentAt,
        this.limitFinishTime,
        this.paymentMethod,
        this.paymentBank,
        this.paymentAccount,
        this.paymentName,
        this.complainAt,
        this.finishAt,
        this.cancelAt,
        this.cancelType});

  OrderInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    side = json['side'];
    symbol = json['symbol'];
    coinId = json['coin_id'];
    status = json['status'];
    number = json['number'];
    price = json['price'];
    fee = json['fee'];
    remark = json['remark'];
    createdAt = json['created_at'];
    limitPayTime = json['limit_pay_time'];
    paymentAt = json['payment_at'];
    limitFinishTime = json['limit_finish_time'];
    paymentMethod = json['payment_method'];
    paymentBank = json['payment_bank'];
    paymentAccount = json['payment_account'];
    paymentName = json['payment_name'];
    complainAt = json['complain_at'];
    finishAt = json['finish_at'];
    cancelAt = json['cancel_at'];
    cancelType = json['cancel_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_no'] = this.orderNo;
    data['side'] = this.side;
    data['symbol'] = this.symbol;
    data['coin_id'] = this.coinId;
    data['status'] = this.status;
    data['number'] = this.number;
    data['price'] = this.price;
    data['fee'] = this.fee;
    data['remark'] = this.remark;
    data['created_at'] = this.createdAt;
    data['limit_pay_time'] = this.limitPayTime;
    data['payment_at'] = this.paymentAt;
    data['limit_finish_time'] = this.limitFinishTime;
    data['payment_method'] = this.paymentMethod;
    data['payment_bank'] = this.paymentBank;
    data['payment_account'] = this.paymentAccount;
    data['payment_name'] = this.paymentName;
    data['complain_at'] = this.complainAt;
    data['finish_at'] = this.finishAt;
    data['cancel_at'] = this.cancelAt;
    data['cancel_type'] = this.cancelType;
    return data;
  }
}

class OtherInfo {
  int userId;
  String username;
  String name;
  String createdAt;
  int kycStatus;
  int isStar;
  int isBlack;
  int orderCount;
  String finishPercent;
  int avgPaymentTime;
  int avgConfirmTime;

  OtherInfo(
      {this.userId,
        this.username,
        this.name,
        this.createdAt,
        this.kycStatus,
        this.isStar,
        this.isBlack,
        this.orderCount,
        this.finishPercent,
        this.avgPaymentTime,
        this.avgConfirmTime});

  OtherInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    name = json['name'];
    createdAt = json['created_at'];
    kycStatus = json['kyc_status'];
    isStar = json['is_star'];
    isBlack = json['is_black'];
    orderCount = json['order_count'];
    finishPercent = json['finish_percent'];
    avgPaymentTime = json['avg_payment_time'];
    avgConfirmTime = json['avg_confirm_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['kyc_status'] = this.kycStatus;
    data['is_star'] = this.isStar;
    data['is_black'] = this.isBlack;
    data['order_count'] = this.orderCount;
    data['finish_percent'] = this.finishPercent;
    data['avg_payment_time'] = this.avgPaymentTime;
    data['avg_confirm_time'] = this.avgConfirmTime;
    return data;
  }
}
class PaymentAccount {
  int paymentMethod;
  String paymentBank;
  String paymentAccount;
  String paymentName;
  Null qrCode;

  PaymentAccount(
      {this.paymentMethod,
        this.paymentBank,
        this.paymentAccount,
        this.paymentName,
        this.qrCode});

  PaymentAccount.fromJson(Map<String, dynamic> json) {
    paymentMethod = json['payment_method'];
    paymentBank = json['payment_bank'];
    paymentAccount = json['payment_account'];
    paymentName = json['payment_name'];
    qrCode = json['qr_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_method'] = this.paymentMethod;
    data['payment_bank'] = this.paymentBank;
    data['payment_account'] = this.paymentAccount;
    data['payment_name'] = this.paymentName;
    data['qr_code'] = this.qrCode;
    return data;
  }
}
