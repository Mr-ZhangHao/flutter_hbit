class OrderHistoryListModel {
  int id;
  int orderNo;
  String side;
  String symbol;
  int status;
  String price;
  String number;
  String fee;
  String remark;
  String createdAt;
  int limitPayTime;
  Object paymentAt;
  int limitFinishTime;
  int cancelType;
  OtherInfo otherInfo;
  List<PaymentAccount> paymentAccount;

  OrderHistoryListModel(
      {this.id,
        this.orderNo,
        this.side,
        this.symbol,
        this.status,
        this.price,
        this.number,
        this.fee,
        this.remark,
        this.createdAt,
        this.limitPayTime,
        this.paymentAt,
        this.limitFinishTime,
        this.cancelType,
        this.otherInfo,
        this.paymentAccount});

  OrderHistoryListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    side = json['side'];
    symbol = json['symbol'];
    status = json['status'];
    price = json['price'];
    number = json['number'];
    fee = json['fee'];
    remark = json['remark'];
    createdAt = json['created_at'];
    limitPayTime = json['limit_pay_time'];
    paymentAt = json['payment_at'];
    limitFinishTime = json['limit_finish_time'];
    cancelType = json['cancel_type'];
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
    data['id'] = this.id;
    data['order_no'] = this.orderNo;
    data['side'] = this.side;
    data['symbol'] = this.symbol;
    data['status'] = this.status;
    data['price'] = this.price;
    data['number'] = this.number;
    data['fee'] = this.fee;
    data['remark'] = this.remark;
    data['created_at'] = this.createdAt;
    data['limit_pay_time'] = this.limitPayTime;
    data['payment_at'] = this.paymentAt;
    data['limit_finish_time'] = this.limitFinishTime;
    data['cancel_type'] = this.cancelType;
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

class OtherInfo {
  int userId;
  String username;
  String name;
  String createdAt;
  int kycStatus;
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
  String qrCode;

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