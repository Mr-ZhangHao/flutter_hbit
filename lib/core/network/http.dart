import 'dart:convert';

import 'package:HBit/config/global_config.dart';
import 'package:HBit/main.dart';
import 'package:HBit/pages/login/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/utils/sp_utils.dart';
import 'api.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = GlobalConfig.apiHost1;
    interceptors..add(ApiInterceptor())..add(LogInterceptor(responseBody: false));
  }
}

class ApiInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    String token = await SpUtils.getToken() ?? '';
    if (token != null) {
      options.headers['Authorization'] = 'Bearer' + ' ' + token;
    }
    return options;
  }

  @override
  onResponse(Response response) {
    if (response.statusCode == 200) {
      Toast.close();
      ResponseData respData = ResponseData.fromJson(response.data);
      if (respData.success) {
        return http.resolve(response);
      } else {
        if (response.data['code'] == 401 || response.data['code'] == '401') {
          Toast.close();
          SpUtils.sp.clear();
          navigatorKey.currentState
              .pushAndRemoveUntil(MaterialPageRoute(builder: (_) => LoginScreen()), (route) => route == null);
        } else {
          Toast.close();
          Toast.showText(response.data['message']);
        }
        throw NotSuccessException.fromRespData(respData);
      }
    } else {
      Toast.close();
      Toast.showText('请检查网络状态');
      throw Exception();
    }
  }
}

/// 响应数据类
class ResponseData extends BaseResponseData {
  bool get success => code == 200;

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] ?? null;
  }
}
