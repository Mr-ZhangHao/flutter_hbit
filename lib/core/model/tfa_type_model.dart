class TfaTypeModel {
  int tfaType;
  String area;
  String mobile;
  String email;

  TfaTypeModel({this.tfaType, this.area, this.mobile, this.email});

  TfaTypeModel.fromJson(Map<String, dynamic> json) {
    tfaType = json['tfa_type'];
    area = json['area'];
    mobile = json['mobile'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tfa_type'] = this.tfaType;
    // data['tfa_type'] = 7;
    data['area'] = this.area;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    return data;
  }
}
