import 'package:HBit/core/model/tfa_type_model.dart';
import 'package:HBit/core/network/http.dart';
import 'package:HBit/pages/login/model/country_model.dart';

class LoginServer {
  static Future sms(area, mobile) async {
    var query = {"area": area, "mobile": mobile};
    var res = await http.get('/api/common/sms', queryParameters: query);
    return res.data;
  }

  static Future email(email) async {
    var query = {"email": email};
    var res = await http.get('/api/common/email', queryParameters: query);
    return res.data;
  }

  static Future registerMobile(area, mobile, smsCode, loginPassword, parentId) async {
    var data = {
      "area": area,
      "mobile": mobile,
      "sms_code": smsCode,
      "login_password": loginPassword,
      "parent_id": parentId
    };
    var res = await http.post('/api/auth/register/mobile', data: data);
    return res.data;
  }

  static Future registerEmail(email, emailCode, loginPassword, parentId) async {
    var data = {"email": email, "email_code": emailCode, "login_password": loginPassword, "parent_id": parentId};
    var res = await http.post('/api/auth/register/email', data: data);
    return res.data;
  }

  static Future loginMobile(mobile, psw) async {
    var data = {"mobile": mobile, "login_password": psw};
    var res = await http.post('/api/auth/login/mobile', data: data);
    return res.data;
  }

  static Future loginEmail(email, psw) async {
    var data = {"email": email, "login_password": psw};
    var res = await http.post('/api/auth/login/email', data: data);
    return res.data;
  }

  static Future authLogin(token, type, code) async {
    var data;
    if (type == 1) {
      data = {"login_token": token, "tfa_type": type, "sms_code": code};
    } else if (type == 2) {
      data = {"login_token": token, "tfa_type": type, "google_code": code};
    } else {
      data = {"login_token": token, "tfa_type": type, "email_code": code};
    }

    var res = await http.post('/api/auth/tfa', data: data);
    return res.data;
  }

  static Future logout() async {
    var res = await http.get('/api/auth/logout');
    return res.data;
  }

  /// 二次验证类型: 0:关闭 1:手机验证 2:邮箱验证 3:手机+谷歌 4:邮箱+谷歌 5:手机+邮箱+谷歌 6:手机+邮箱 7:谷歌
  static Future<TfaTypeModel> getVertifyType(type, loginName) async {
    var data = {"type": type, "login_name": loginName};
    var res = await http.post('/api/auth/tfa_type', data: data);
    return TfaTypeModel.fromJson(res.data['data']);
  }

  static Future resetPswbyMobile(Map data) async {
    var res = await http.post('/api/auth/login_password/reset/mobile', data: data);
    return res.data;
  }

  static Future resetPswbyEmail(Map data) async {
    var res = await http.post('/api/auth/login_password/reset/email', data: data);
    return res.data;
  }


  static Future<List<CountryModel>> searchCountry(String countryName) async {
    var res = await http.get('/api/spot/currencies', queryParameters: {"coin_name": countryName});
    return (res.data['data'] as List).map((e) => CountryModel.fromJson(e)).toList();
  }

}
