/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-21 17:12:06
* @LastEditors: Roy
* @LastEditTime: 2020-09-14 19:46:38
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/server/url.dart
*/
class TradeApi {
  // 获取行情列表
  static String getMarketList = '/api/spot/tickers';
  // 深度
  static String orderDepth = "/api/spot/market/depth";

  // 单个币种详情
  static String marketDetail = "/api/spot/tickers";

  // 币种余额
  static String accountBalance = "/api/account";

  // 挂单
  static String orderPlace = "/api/spot/orders";

  //当前委托
  static String orderEntrust = "/api/spot/orders";

  //撤销挂单
  static String cancelOrder = "/api/spot/orders/";

  //历史委托
  static String orderHistory = "/api/v2/order/history";

  //历史成交
  static String tradeHistory = "/api/spot/market/trades";

  //自选
  static String optionList = "/api/spot/my_symbol";

  //自选
  static String getOption = "/api/spot/symbol";


  //汇率
  static String rateCNY =  "/api/home/cny";
}