import 'dart:convert';

import 'package:HBit/config/global_config.dart';
import 'package:HBit/main.dart';
import 'package:HBit/pages/login/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/core/network/logger.dart';
import 'package:HBit/utils/sp_utils.dart';
import 'api.dart';

final ContractHttp http = ContractHttp();

class ContractHttp extends BaseHttp {
  @override
  void init() {
    options.baseUrl = GlobalConfig.apiHost2;
    interceptors..add(ApiInterceptor())..add(DioLogger());
  }
}

class ApiInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    String token = await SpUtils.getToken() ?? '';
    if (token != null) {
      options.headers['Authorization'] = 'Bearer' + ' ' + token;
    }
    debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}' +
        ' data: ${options.data}');
    debugPrint('---api-request--->data--->${options.data}');
    return options;
  }

  @override
  onResponse(Response response) {
    debugPrint('---api-response--->resp----->${json.encode(response.data)}');

    if (response.statusCode == 200) {
      Toast.close();
      ResponseData respData = ResponseData.fromJson(response.data);
      if (respData.success) {
        return http.resolve(response);
      } else {
        if (response.data['code'] == 9002) {
          Toast.close();
          SpUtils.sp.clear();
          navigatorKey.currentState
              .pushAndRemoveUntil(MaterialPageRoute(builder: (_) => LoginScreen()), (route) => route == null);
        } else {
          Toast.close();
          Toast.showText(response.data['msg']);
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

class ResponseData extends BaseResponseData {
  bool get success => code == 0;

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] ?? null;
  }
}
