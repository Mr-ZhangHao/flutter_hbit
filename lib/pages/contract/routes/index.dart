/*
* @message: 主页路由控制
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-02-27 20:08:46
* @LastEditors: Roy
* @LastEditTime: 2020-09-14 17:14:26
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/routes/index.dart
*/
import 'package:HBit/pages/contract/views/Kline.dart';
import 'package:HBit/pages/contract/views/clinch_detail.dart';
import 'package:HBit/pages/contract/views/contract_record.dart';
import 'package:fluro/fluro.dart';
import 'package:HBit/routes/router_init.dart';

class ContractRouter implements IRouterProvider {
  //记录
  static String contractRecord = '/contractRecord';

  //成交明细
  static String clinchDetailPage = '/clinchDetailPage';

  //k线图
  static String kline = '/kline1';

  @override
  void initRouter(FluroRouter router) {
    // example
    router.define(contractRecord, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return ContractRecordPage();
    }));

     router.define(clinchDetailPage, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return ClinchDetailPage();
    }));

    router.define(kline, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String coinName = params['coinName'].first;
      String coinID = params['coinID'].first;
      String tabBarType = params['type'].first;
      return Kline(coinName: coinName, coinID: coinID,tabBarType: tabBarType,);
    }));
    
  }
}
