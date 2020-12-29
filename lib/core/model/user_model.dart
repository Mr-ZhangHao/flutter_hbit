/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-06 14:34:33
* @LastEditors: Jack
* @LastEditTime: 2020-08-06 23:59:24
* @Deprecated: 否
* @FilePath: /ETF/lib/core/model/user_model.dart
*/
class UserModel {
  int id;
  String loginName;
  String code;
  int level;
  String createTime;

  UserModel({this.id, this.loginName, this.code, this.level, this.createTime});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loginName = json['loginName'];
    code = json['code'];
    level = json['level'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['loginName'] = this.loginName;
    data['code'] = this.code;
    data['level'] = this.level;
    data['createTime'] = this.createTime;
    return data;
  }
}
