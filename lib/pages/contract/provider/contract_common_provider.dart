/*
* @message: 文件描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-06-01 13:46:53
* @LastEditors: Roy
* @LastEditTime: 2020-09-16 18:48:26
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/provider/contract_common_provider.dart
*/

import 'package:HBit/pages/contract/model/cmarket_model.dart';
import 'package:HBit/pages/contract/server/index.dart';
import 'package:HBit/pages/trade/model/balance_model.dart';
import 'package:HBit/pages/trade/server/index.dart';
import 'package:HBit/providers/view_state_model.dart';
import 'package:HBit/utils/sp_utils.dart';

class ContractCommonProvider extends ViewStateModel {
  CMarketModel _marketItem;
  List<CMarketModel> marketList = [];
  CMarketModel get marketItem => _marketItem;

  double rateCNY = 7.0;
  String available = "0.00";
  BalanceModel firstModel;
  BalanceModel lastModel;
  List selectSymbol; //当前币种

  String symbole = '';
  int currentIndex = 0;
  int selectCoinId = 0;

  setSymboleAndType(s1, selectCoinId, index) {
    symbole = s1;
    this.selectCoinId = selectCoinId;
    currentIndex = index;
    notifyListeners();
  }

  // setSymbolCallBack(Function(String symbol) callBack) {
  //   this.symbolCallBack = callBack;
  // }

  // Function(String symbol) symbolCallBack;

  void setMarketItem(item) {
    _marketItem = item;
    notifyListeners();
  }

  loadData() async {
    var data = await ContractServer.marketList();
    List<CMarketModel> list = data['overview'].map<CMarketModel>((e) => CMarketModel.fromJson(e)).toList();
    var marketID = SpUtils.sp.getString('contractID');

    if (marketID != null) {
      list.forEach((e) {
        if (e.symbol.toString() == marketID) {
          _marketItem = e;
        }
      });
    } else {
      _marketItem = list.first;
    }
    SpUtils.sp.remove('contractID');
    marketList = list;
    notifyListeners();
  }

  //汇率
  getRateCNY() async {
    var data = await TradeServer.getRateCNY();
    rateCNY = double.parse(data['data']['usdt_to_cny'].toString());
    notifyListeners();
  }

  /*
  获取余额
   */
  getBalance(String symbol) async {
    var data = await ContractServer.getTradeBalance();
    available = data['usdt']['available'].toString();
    notifyListeners();
  }
}
