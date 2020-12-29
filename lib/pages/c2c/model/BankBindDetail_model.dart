class BankBindDetailModel {
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
  String deletedAt;
  int currencyId;
  String currency;

  BankBindDetailModel(
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
        this.deletedAt,
        this.currencyId,
        this.currency});

  BankBindDetailModel.fromJson(Map<String, dynamic> json) {
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
    currencyId = json['currency_id'];
    currency = json['currency'];
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
    data['currency_id'] = this.currencyId;
    data['currency'] = this.currency;
    return data;
  }
}