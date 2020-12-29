/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-09-14 11:15:08
* @LastEditors: Roy
* @LastEditTime: 2020-09-17 11:44:23
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/server/index.dart
*/
import 'package:HBit/core/network/contract_http.dart';
import 'package:HBit/pages/contract/server/url.dart';

class ContractServer {
  /// 合约行情列表
  static Future marketList() async {
    var response = await http.get(ContractApi.getMarketList, queryParameters: {"type": 0});
    return response.data["data"];
  }

  // 深度
  static Future depth(id) async {
    var response = await http.get(ContractApi.orderDepth, queryParameters: {"symbol": id});
    return response.data;
  }

  // 单个币种详情
  static Future getMarketDetail(id) async {
    var response = await http.get(ContractApi.getMarketDetail, queryParameters: {"symbol": id});
    return response.data;
  }

  // 成交
  static Future getTradeHistory(id) async {
    var response = await http.get(ContractApi.getMarketTrade, queryParameters: {"symbol": id});
    return response.data;
  }

  // 获取余额
  static Future getTradeBalance() async {
    var response = await http.get(ContractApi.getBalance);
    return response.data['data'];
  }

  // 普通下单
  static Future requestContractOrder(Map map) async {
    var response = await http.post(ContractApi.getContractOrder, data: map);
    return response.data;
  }

  // 当前委托列表 分页
  static Future getOpenOrder(String symbol, int page) async {
    var response = await http.get(ContractApi.getOpenOrder, queryParameters: {"symbol": symbol, "page": page});
    return response.data['data'];
  }

  // 当前委托列表 不分页
  static Future getOpenOrderNoPage(String symbol) async {
    var response = await http.get('/api/contract/openOrderWithoutPage', queryParameters: {"symbol": symbol});
    return response.data['data']['list'];
  }

  // 当前仓位列表
  static Future getPosition(String symbol, {page = 1}) async {
    var response = await http.get(ContractApi.getPosition, queryParameters: {"symbol": symbol});
    return response.data['data'];
  }

  // 计划委托列表 分页
  static Future getOpenPlanOrder(String symbol, int page) async {
    var response = await http.get(ContractApi.getOpenPlanOrder, queryParameters: {"symbol": symbol, "page": page});
    return response.data['data'];
  }

  // 计划委托列表 不分页
  static Future getOpenPlanOrderNoPage(String symbol) async {
    var response = await http.get('/api/contract/openPlanOrderWithoutPage', queryParameters: {"symbol": symbol});
    return response.data['data']['list'];
  }

  // 取消委托
  static Future requestCancelOrder(int orderId) async {
    var response = await http.post(ContractApi.getCancelOrder, data: {"order_sn": orderId});
    return response.data;
  }

  // 平仓
  static Future requestSettleOrder(Map map) async {
    var response = await http.post(ContractApi.getOrder, data: map);
    return response.data;
  }

  // 计划委托
  static Future requestPlanOrder(Map map) async {
    var response = await http.post(ContractApi.getPlanOrder, data: map);
    return response.data;
  }

  // 平仓
  static Future requestCancelPlan(Map map) async {
    var response = await http.post(ContractApi.getCancelPlan, data: map);
    return response.data;
  }

  // 历史计划列表
  static Future getHistoryPlan(String symbol, int page) async {
    var response = await http.get(ContractApi.getHistoryPlan, queryParameters: {"symbol": symbol, "page": page});
    return response.data['data'];
  }

  // 历史委托列表
  static Future getHistoryOrder(String symbol, int page) async {
    var response = await http.get(ContractApi.getHistoryOrder, queryParameters: {"symbol": symbol, "page": page});
    return response.data['data'];
  }

  // 止盈止损
  static Future contractWin(String positionId, String price, String hand, String type) async {
    var response = await http
        .post('/api/contract/win', data: {"position_id": positionId, "price": price, "hand": hand, "type": type});
    return response.data['data'];
  }

  // 请求最后一条K线数据
  static Future getLastKline(coinId) async {
    var response = await http.get('/api/market/lastKline?symbol=$coinId&period=1min');
    return response.data;
  }
}
