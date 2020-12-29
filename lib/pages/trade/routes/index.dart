/*
* @message: 主页路由控制
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-02-27 20:08:46
* @LastEditors: Roy
* @LastEditTime: 2020-09-10 18:07:39
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/routes/index.dart
*/

import 'package:HBit/pages/trade/views/Kline.dart';
import 'package:HBit/pages/trade/views/order_list.dart';
import 'package:fluro/fluro.dart';
import 'package:HBit/routes/router_init.dart';
import '../widgets/others/qq_chat_list.dart';

class TradeRouter implements IRouterProvider {
  /// k线图
  static String kline = '/kline';
  static String qqchart = '/qqchart';
  static String orderList = '/orderList';

  @override
  void initRouter(FluroRouter router) {
    print(router);
          print("++++++++");
    router.define(kline, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
          
      String coinName = params['coinName'].first;
      String coinID = params['coinID'].first;
      String tabBarType = params['type'].first;
      return Kline(coinName: coinName, coinID: coinID,tabBarType: tabBarType,);
    }));

    // test
    router.define(qqchart, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return QQChatList();
    }));

    // test
    router.define(orderList, handler:
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return OrderListPage();
    }));
  }
}
