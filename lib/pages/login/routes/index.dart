/*
* @message: 主页路由控制
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-02-27 20:08:46
* @LastEditors: Jack
* @LastEditTime: 2020-09-03 17:39:42
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/login/routes/index.dart
*/
import 'dart:convert';

import 'package:HBit/core/model/tfa_type_model.dart';
import 'package:HBit/pages/login/views/country.dart';
import 'package:HBit/pages/login/views/forgot.dart';
import 'package:HBit/pages/login/views/reset_pssword.dart';
import 'package:fluro/fluro.dart';
import 'package:HBit/routes/router_init.dart';
import '../views/register.dart';

class LoginRouter implements IRouterProvider {
  static String register = '/register';
  static String forgot = '/forgot';
  static String country = '/country';
  static String resetPassword = '/resetPassword';

  @override
  void initRouter(FluroRouter router) {
    // example
    router.define(register, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      // Map<String, dynamic> item = json.decode(params['param'].first);
      // NoticeModel noticeModel = NoticeModel.fromJson(item);
      return RegisterPage();
    }));

    router.define(forgot, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return ForgotPage();
    }));

    router.define(country, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return countryPage();
    }));


    router.define(resetPassword, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      Map<String, dynamic> item = json.decode(params['tfaType'].first);
      TfaTypeModel tfaType = TfaTypeModel.fromJson(item);
      return ResetPasswordPage(tfaType: tfaType);
    }));
  }
}
