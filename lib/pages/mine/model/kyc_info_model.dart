class KycInfoModel {
  int kycStatus;
  KycInfo kycInfo;

  KycInfoModel({this.kycStatus, this.kycInfo});

  KycInfoModel.fromJson(Map<String, dynamic> json) {
    kycStatus = json['kyc_status'];
    kycInfo = json['kyc_info'] != null ? new KycInfo.fromJson(json['kyc_info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kyc_status'] = this.kycStatus;
    if (this.kycInfo != null) {
      data['kyc_info'] = this.kycInfo.toJson();
    }
    return data;
  }
}

class KycInfo {
  String country;
  String name;
  String passportId;

  KycInfo({this.country, this.name, this.passportId});

  KycInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    name = json['name'];
    passportId = json['passport_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['name'] = this.name;
    data['passport_id'] = this.passportId;
    return data;
  }
}
