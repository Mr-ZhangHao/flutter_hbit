/*
* @message: 文件描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-19 12:47:11
* @LastEditors: Roy
* @LastEditTime: 2020-09-07 16:38:53
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/server/index1.dart
*/

import 'package:HBit/core/network/http.dart';

class TradeServer1 {
  /// 行情列表
  static Future marketList({id}) async {
    var response = await http
        .get('ContractApi.marketList', queryParameters: {"market_id": id});
    return response.data;
  }

  /// 行情列表
  static Future orderRecord(id) async {
    if (id == 0) {
      var response = await http.get('ContractApi.orderRecord');
      return response.data;
    } else {
      var response = await http.get('ContractApi.orderRecord',
          queryParameters: {"market_id": id.toString()});
      return response.data;
    }
  }

  /// 行情列表  3-委托中 4-已撤销 1-已平仓
  static Future normalRecord(String status) async {
    var response = await http
        .get('ContractApi.normalRecord', queryParameters: {"status": status});
    return response.data;
  }

  /// 深度
  static Future depth(id) async {
    var response =
        await http.get('ContractApi.depth', queryParameters: {"market_id": id});
    return response.data;
  }

  /// 买卖挂单
  /// multiple: 杠杆倍数
  /// hand:  手数
  /// market_id: 币种id
  /// type：下单类型 rose：涨 fall ：跌
  /// price： 市价填0 现价传输入的价格
  static Future order(String multiple, String hand, String marketId,
      String type, String price) async {
    var response = await http.post('ContractApi.order', data: {
      "multiple": multiple,
      "hand": hand,
      "market_id": marketId,
      "type": type,
      "price": price
    });
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
