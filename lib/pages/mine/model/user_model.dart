/*
* @message: 描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-15 12:24:08
* @LastEditors: Roy
* @LastEditTime: 2020-05-29 17:00:23
* @Deprecated: 否
* @FilePath: /KEMX_Flutter/lib/pages/user/model/user_model.dart
*/
class UserInfoModel {
  int id;
  String email;
  String area;
  String mobile;
  String avatar;
  String username;
  int kycStatus;
  int gaSecret;
  int payPassword;
  int status;
  int tfaType;
  int payPasswordType;
  String createdAt;
  String pid;
  String link;
  int vipLevel;
  int inviteNumber;
  int team;
  String helpUrl;
  int contractWwitch;
  String chatUrl;

  UserInfoModel(
      {this.id,
      this.email,
      this.area,
      this.mobile,
      this.avatar,
      this.username,
      this.kycStatus,
      this.gaSecret,
      this.payPassword,
      this.status,
      this.tfaType,
      this.payPasswordType,
      this.createdAt,
      this.pid,
      this.link,
      this.vipLevel,
      this.inviteNumber,
      this.team,
      this.contractWwitch,
      this.helpUrl,
      this.chatUrl});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    area = json['area'];
    mobile = json['mobile'];
    avatar = json['avatar'];
    username = json['username'];
    kycStatus = json['kyc_status'];
    gaSecret = json['ga_secret'];
    payPassword = json['pay_password'];
    status = json['status'];
    tfaType = json['tfa_type'];
    payPasswordType = json['pay_password_type'];
    createdAt = json['created_at'];
    pid = json['pid'];
    link = json['link'];
    vipLevel = json['vip_level'];
    inviteNumber = json['invite_number'];
    team = json['team'];
    helpUrl = json['help_url'];
    contractWwitch = json['contract_switch'];
    chatUrl = json['chat_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['area'] = this.area;
    data['mobile'] = this.mobile;
    data['avatar'] = this.avatar;
    data['username'] = this.username;
    data['kyc_status'] = this.kycStatus;
    data['ga_secret'] = this.gaSecret;
    data['pay_password'] = this.payPassword;
    data['status'] = this.status;
    data['tfa_type'] = this.tfaType;
    data['pay_password_type'] = this.payPasswordType;
    data['created_at'] = this.createdAt;
    data['pid'] = this.pid;
    data['link'] = this.link;
    data['vip_level'] = this.vipLevel;
    data['invite_number'] = this.inviteNumber;
    data['team'] = this.team;
    data['help_url'] = this.helpUrl;
    data['contract_switch'] = this.contractWwitch;
    data['chat_url'] = this.chatUrl;
    return data;
  }
}
