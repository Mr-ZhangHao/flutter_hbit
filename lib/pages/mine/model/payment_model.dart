class PaymentModel {
  List<Bank> bank;
  List<Alipay> alipay;
  List<Wechat> wechat;

  PaymentModel({this.bank, this.alipay, this.wechat});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    if (json['bank'] != null) {
      bank = new List<Bank>();
      json['bank'].forEach((v) {
        bank.add(new Bank.fromJson(v));
      });
    }
    if (json['alipay'] != null) {
      alipay = new List<Alipay>();
      json['alipay'].forEach((v) {
        alipay.add(new Alipay.fromJson(v));
      });
    }
    if (json['wechat'] != null) {
      wechat = new List<Wechat>();
      json['wechat'].forEach((v) {
        wechat.add(new Wechat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bank != null) {
      data['bank'] = this.bank.map((v) => v.toJson()).toList();
    }
    if (this.alipay != null) {
      data['alipay'] = this.alipay.map((v) => v.toJson()).toList();
    }
    if (this.wechat != null) {
      data['wechat'] = this.wechat.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bank {
  int id;
  int userId;
  int type;
  int isOpen;
  int isDelete;
  String name;
  String account;
  String bankName;
  String branchName;
  Null qrCode;
  String createdAt;
  String updatedAt;
  Null deletedAt;

  Bank(
      {this.id,
        this.userId,
        this.type,
        this.isOpen,
        this.isDelete,
        this.name,
        this.account,
        this.bankName,
        this.branchName,
        this.qrCode,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Bank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    isOpen = json['is_open'];
    isDelete = json['is_delete'];
    name = json['name'];
    account = json['account'];
    bankName = json['bank_name'];
    branchName = json['branch_name'];
    qrCode = json['qr_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['is_open'] = this.isOpen;
    data['is_delete'] = this.isDelete;
    data['name'] = this.name;
    data['account'] = this.account;
    data['bank_name'] = this.bankName;
    data['branch_name'] = this.branchName;
    data['qr_code'] = this.qrCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Alipay {
  int id;
  int userId;
  int type;
  int isOpen;
  int isDelete;
  String name;
  String account;
  Null bankName;
  Null branchName;
  String qrCode;
  String createdAt;
  String updatedAt;
  Null deletedAt;

  Alipay(
      {this.id,
        this.userId,
        this.type,
        this.isOpen,
        this.isDelete,
        this.name,
        this.account,
        this.bankName,
        this.branchName,
        this.qrCode,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Alipay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    isOpen = json['is_open'];
    isDelete = json['is_delete'];
    name = json['name'];
    account = json['account'];
    bankName = json['bank_name'];
    branchName = json['branch_name'];
    qrCode = json['qr_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['is_open'] = this.isOpen;
    data['is_delete'] = this.isDelete;
    data['name'] = this.name;
    data['account'] = this.account;
    data['bank_name'] = this.bankName;
    data['branch_name'] = this.branchName;
    data['qr_code'] = this.qrCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
class Wechat {
  int id;
  int userId;
  int type;
  int isOpen;
  int isDelete;
  String name;
  String account;
  Null bankName;
  Null branchName;
  String qrCode;
  String createdAt;
  String updatedAt;
  Null deletedAt;

  Wechat(
      {this.id,
        this.userId,
        this.type,
        this.isOpen,
        this.isDelete,
        this.name,
        this.account,
        this.bankName,
        this.branchName,
        this.qrCode,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Wechat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    isOpen = json['is_open'];
    isDelete = json['is_delete'];
    name = json['name'];
    account = json['account'];
    bankName = json['bank_name'];
    branchName = json['branch_name'];
    qrCode = json['qr_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['is_open'] = this.isOpen;
    data['is_delete'] = this.isDelete;
    data['name'] = this.name;
    data['account'] = this.account;
    data['bank_name'] = this.bankName;
    data['branch_name'] = this.branchName;
    data['qr_code'] = this.qrCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}