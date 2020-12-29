/*
* @message: 文件描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-06-01 13:46:53
* @LastEditors: Roy
* @LastEditTime: 2020-09-14 20:21:52
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/provider/market_provider.dart
*/

import 'package:HBit/pages/trade/model/balance_model.dart';
import 'package:HBit/pages/trade/model/market_model.dart';
import 'package:HBit/pages/trade/server/index.dart';
import 'package:HBit/providers/view_state_refresh_list_model.dart';
import 'package:HBit/utils/sp_utils.dart';

class MarketProvider extends ViewStateRefreshListModel {
  MyMarketModel _marketItem;
  List<MyMarketModel> marketList = [];
  MyMarketModel get marketItem => _marketItem;
  List<MyMarketModel> collectList = [];

  double rateCNY = 7.0;
  bool isCollected = false;
  BalanceModel firstModel;
  BalanceModel lastModel;
  List selectSymbol; //当前币种

  void setMarketItem(item) {
    _marketItem = item;
    reloadCollected();
    notifyListeners();
  }

  @override
  Future<List<MyMarketModel>> loadData({int pageNum}) async {
    var data = await TradeServer.marketList();
    List<MyMarketModel> list = data['data']
        .map<MyMarketModel>((e) => MyMarketModel.fromJson(e))
        .toList();
    var marketID = SpUtils.sp.getString('marketID');

    if (marketID != null) {
      list.forEach((e) {
        if (e.id.toString() == marketID) {
          _marketItem = e;
        }
      });
    } else {
      _marketItem = list.first;
    }
    SpUtils.sp.remove('marketID');
    marketList = list;
    return list;
  }

  //汇率
  getRateCNY() async {
    var data = await TradeServer.getRateCNY();
    rateCNY = double.parse(data['data']['usdt_to_cny'].toString());
    notifyListeners();
  }

  void optionMarketList() async {
    var data = await TradeServer.getOptionList();
    List<MyMarketModel> list = data['data']
        .map<MyMarketModel>((e) => MyMarketModel.fromJson(e))
        .toList();
    if (list.length == 0) {
      collectList = list;
      isCollected = false;
    } else {

      isCollected = false;
      list.forEach((item) {
        if (item.symbol == marketItem.symbol) {
          collectList = list;
          isCollected = true;
        }
      });
    }
    notifyListeners();
  }

  reloadCollected(){
    if (collectList.length == 0) {
      isCollected = false;
    } else {
      isCollected = false;
      collectList.forEach((item) {
        if (item.symbol == marketItem.symbol) {
          isCollected = true;
        }
      });
    }
    notifyListeners();
  }

  /*
  获取余额
   */
  getBalance(String symbol) async {
    var data = await TradeServer.getAccountBalance(
        symbol.replaceAll(RegExp('/'), ','));
    selectSymbol = symbol.split('/');
    firstModel = BalanceModel.fromJson(data[selectSymbol.first]);
    lastModel = BalanceModel.fromJson(data[selectSymbol.last]);
    notifyListeners();
  }
}
