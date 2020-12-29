/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-09-14 11:15:14
* @LastEditors: Roy
* @LastEditTime: 2020-09-17 11:44:03
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/server/url.dart
*/
class ContractApi {
  // 获取合约列表
  static String getMarketList = '/api/market/list';
  //获取深度
  static String orderDepth = '/api/contract/depth';
  //单个币种详情
  static String getMarketDetail = '/api/market/ticker';
  //成交
  static String getMarketTrade = '/api/market/trade';
  //获取余额
  static String getBalance = '/api/account/balance';
  //普通下单
  static String getContractOrder = '/api/contract/order';
  //当前委托列表
  static String getOpenOrder = '/api/contract/openOrder';
  //取消委托
  static String getCancelOrder = '/api/contract/cancelOrder';
  //仓位列表
  static String getPosition = '/api/contract/position';
  //平仓
  static String getOrder = '/api/contract/settleOrder';
  //计划委托
  static String getPlanOrder = '/api/contract/planOrder';
  //当前计划
  static String getOpenPlanOrder = '/api/contract/openPlanOrder';
  //取消当前计划
  static String getCancelPlan = '/api/contract/cancelPlan';
  //历史计划
  static String getHistoryPlan = '/api/contract/historyPlan';
  //历史委托
  static String getHistoryOrder = '/api/contract/historyOrder';
}