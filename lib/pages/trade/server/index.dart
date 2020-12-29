/*
* @message: 文件描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-19 12:47:11
* @LastEditors: Roy
* @LastEditTime: 2020-09-14 19:47:14
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/server/index.dart
*/



import 'package:HBit/core/network/http.dart';
import 'package:HBit/pages/trade/server/url.dart';

class TradeServer {
  /// 行情列表
  static Future marketList({id}) async {
    var response = await http
        .get(TradeApi.getMarketList, queryParameters: {"symbol": id});
    return response.data;
  }

  /// 当前委托
  /// 订单状态：0-未完全成交，1-完全成交，2-已撤销 (我的挂单，status为0)
  static Future orderRecord(int page,String symbol,{status:0,perPage:10,side=""}) async {
    var response = await http.get(TradeApi.orderEntrust,queryParameters:{"symbol":symbol,"page":page,"status":status,"per_page":perPage,"side":side});
      return response.data['data'];
  }

  /// 历史委托
  static Future getOrderHistoryList(int page) async {
    var response = await http.get(TradeApi.orderHistory,queryParameters:{"page":page,});
      return response.data['data'];
  }

  /// 自选
  static Future getOptionList() async {
    var response = await http.get(TradeApi.optionList);
      return response.data;
  }
  //自选
  static Future requestOption(Map map) async {
    var response = await http.post(TradeApi.getOption, data: map);
    return response.data;
  }


  /// 币种余额
  static Future getAccountBalance(symbol) async {
    var response = await http.get(TradeApi.accountBalance,queryParameters: {"coin_name": symbol});
      return response.data['data'];
  }

  /// 单个币种详情
  static Future getMarketDetail(symbol) async {
    var response =
        await http.get(TradeApi.marketDetail, queryParameters: {"symbol": symbol});
    return response.data;
  }

  /// 成交历史
  static Future getTradeHistory(symbol) async {
    var response =
        await http.get(TradeApi.tradeHistory, queryParameters: {"symbol": symbol});
    return response.data;
  }

  /// 汇率
  static Future getRateCNY() async {
    var response =
        await http.get(TradeApi.rateCNY);
    return response.data;
  }

  /// 撤销挂单
  static Future requestCancelOrder(int id) async {
    var response = await http.delete(TradeApi.cancelOrder+id.toString());
    return response.data;
  }

  

  /// 行情列表  3-委托中 4-已撤销 1-已平仓
  static Future normalRecord(String status) async {
    var response = await http
        .get('ContractApi.normalRecord', queryParameters: {"status": status});
    return response.data;
  }

  /// 深度
  static Future depth(id,{size:5}) async {
    var response =
        await http.get(TradeApi.orderDepth, queryParameters: {"symbol": id,"size":size});
    return response.data;
  }

  /// 买卖挂单
  static Future requestOrderPlace(Map map) async {
    var response = await http.post(TradeApi.orderPlace, data: map);
    return response.data;
  }

  ///平仓
  static Future settleOrder(int orderId) async {
    var response = await http
        .get('ContractApi.settleOrder', queryParameters: {"order_id": orderId});
    return response.data;
  }
  
  ///撤单
  static Future cancelOrder(int orderId) async {
    var response = await http
        .get('ContractApi.cancelOrder', queryParameters: {"order_id": orderId});
    return response.data;
  }

  ///设置止盈止损价
  static Future setPrice(int orderId, String winPrice, String losePrice) async {
    var response = await http.post(
      'ContractApi.setPrice',
      data: {
        "order_id": orderId,
        'win_price': winPrice,
        'lose_price': losePrice
      },
    );
    return response.data;
  }
}
