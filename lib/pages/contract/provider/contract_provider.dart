/*
* @message: 文件描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-28 20:18:40
* @LastEditors: Roy
* @LastEditTime: 2020-09-27 18:33:08
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/provider/contract_provider.dart
*/


import 'package:HBit/pages/contract/model/ckline_trade_model.dart';
import 'package:HBit/pages/contract/model/cmarket_model.dart';
import 'package:HBit/pages/contract/server/index.dart';
import 'package:HBit/pages/trade/model/order_model.dart';
import 'package:HBit/pages/trade/server/index.dart';
import 'package:HBit/providers/view_state_model.dart';
import 'package:HBit/providers/view_state_refresh_list_model.dart';
import 'package:flutter_k_chart/entity/k_line_entity.dart';
import 'package:flutter_k_chart/flutter_k_chart.dart';
import 'package:flutter_k_chart/k_chart_widget.dart';
enum RecordType {
  /// 持仓
  hold,

  /// 委托
  entrust,

  /// 平仓
  unwind,

  /// 撤单
  cancellations
}

class ContractProvider extends ViewStateRefreshListModel {
  String _type;
  void setType(RecordType t) {
    switch (t) {
      case RecordType.entrust:
        _type = '3';
        break;
      case RecordType.unwind:
        _type = '1';
        break;
      case RecordType.cancellations:
        _type = '4';
        break;
      default:
    }
    notifyListeners();
  }

  @override
  Future<List<OrderModel>> loadData({int pageNum = 1}) async {
    var response = await TradeServer.normalRecord(_type);
    return response['data'].map<OrderModel>((e) => OrderModel.fromJson(e)).toList();
  }
}

class ContractOrderProvider extends ViewStateModel {
  List<OrderModel> list = [];
  num totalPro;
  String totalFx;
  List<dynamic> buys = [
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-']
  ];
  List<dynamic> sells = [
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-']
  ];
  List<dynamic> allBuys = [
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-']
  ];
  List<dynamic> allSells = [
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-']
  ];
  List<dynamic> klineBuys = [
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-']
  ];
  List<dynamic> klineSells = [
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-'],
    ['-', '-']
  ];
  List<CKlineTradeModel> tradeHistoryModelList = [];
  //深度图
  List<DepthEntity> bidsList = [];
  List<DepthEntity> asksList = [];
  double price = 0;
  String newPrice = '0';
  CMarketModel marketListModel;

  setCallBack(Function(String price) callBack) {
    this.callBack = callBack;
  }

  Function(String price) callBack;

  loadOrderRecord(id) async {
    try {
      setBusy();
      // var data = await TradeServer.orderRecord(id);
      // list = data['data']['list']
      //     .map<OrderModel>((e) => OrderModel.fromJson(e))
      //     .toList();
      if (list.isEmpty) {
        setEmpty();
      } else {
        setIdle();
      }
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  setData(listBuy, listSell) {
    List arr = [];
    List arr1 = [];
    allSells = [];
    allBuys = [];
    arr.addAll(listBuy);
    if (listBuy.length < 6) {
      for (var i = 0; i < 6 - listBuy.length; i++) {
        arr.add(["-", "-"]);
      }
      buys = arr;
    } else {
      buys = listBuy.sublist(0, 6);
    }
    if (listBuy.length < 11) {
      allBuys.addAll(listBuy);
      for (var i = 0; i < 11 - listBuy.length; i++) {
        allBuys.add(["-", "-"]);
      }
    } else {
      allBuys = listBuy.sublist(0, 11);
    }
    if (listSell.length < 6) {
      arr1.addAll(listSell);
      for (var i = 0; i < 6 - listSell.length; i++) {
        arr1.add(["-", "-"]);
      }
      sells = arr1;
    } else {
      sells = listSell.sublist(0, 6);
    }
    if (listSell.length < 11) {
      allSells.addAll(listSell);
      for (var i = 0; i < 11 - listSell.length; i++) {
        allSells.add(["-", "-"]);
      }
    } else {
      allSells = listSell.sublist(0, 11);
    }
    notifyListeners();
  }

  loadDepth(id) async {
    try {
      setBusy();
      var data = await ContractServer.depth(id);
      List listBuy = data['data']['buy'].map<dynamic>((item) => item).toList();
      List listSell = data['data']['sell'].map<dynamic>((item) => item).toList();
      setData(listBuy, listSell);

      if (data.isEmpty) {
        setEmpty();
      } else {
        setIdle();
      }
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  //k线深度
  klineLoadDepth(id) async {
    if (id == null) {
      return;
    }
    try {
      setBusy();
      var data = await ContractServer.depth(id);
      List listBuy = data['data']['buy'].map<dynamic>((item) => item).toList();
      List listSell = data['data']['sell'].map<dynamic>((item) => item).toList();
      setKlineData(listBuy, listSell);

      if (data.isEmpty) {
        setEmpty();
      } else {
        setIdle();
      }
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  //k线图深度
  setKlineData(listBuy, listSell) {
    List arr = [];
    klineBuys = [];
    klineSells = [];
    asksList = [];
    bidsList = [];
    arr.addAll(listBuy);
    if (listBuy.length < 30) {
      klineBuys.addAll(listBuy);
      for (var i = 0; i < 30 - listBuy.length; i++) {
        klineBuys.add(["-", "-"]);
      }
    } else {
      klineBuys = listBuy.sublist(0, 30);
    }
    if (listSell.length < 30) {
      klineSells.addAll(listSell);
      for (var i = 0; i < 30 - listSell.length; i++) {
        klineSells.add(["-", "-"]);
      }
    } else {
      klineSells = listSell.sublist(0, 30);
    }

    if (listBuy.length > 0) {
      double amount = 0.0;
      for (var i = 0; i < listSell.length; i++) {
        List map = listBuy[i];
        DepthEntity depth = new DepthEntity(
          double.parse(map.first.toString()),
          double.parse(map.last.toString()),
        );
        depth.amount = amount += depth.amount;
        bidsList.insert(0, depth);
      }
    } else {
      DepthEntity depth = new DepthEntity(0, 0);
      bidsList.add(depth);
    }

    if (listSell.length > 0) {
      double amount = 0.0;
      for (var i = 0; i < listSell.length; i++) {
        List map = listSell[i];
        DepthEntity depth = new DepthEntity(double.parse(map.first.toString()), double.parse(map.last.toString()));
        depth.amount = amount += depth.amount;
        asksList.add(depth);
      }
    } else {
      DepthEntity depth = new DepthEntity(0, 0);
      asksList.add(depth);
    }

    notifyListeners();
  }

  klineTradeList(id) async {
    if (id == null) {
      return;
    }
    try {
      setBusy();
      var data = await ContractServer.getTradeHistory(id);
      List<CKlineTradeModel> arr = data['data'].map<CKlineTradeModel>((e) => CKlineTradeModel.fromJson(e)).toList();
      tradeHistoryModelList = [];
      if (arr.length < 35) {
        tradeHistoryModelList.addAll(arr);
        for (var i = 0; i < 35 - arr.length; i++) {
          CKlineTradeModel model = new CKlineTradeModel();
          model.price = '-';
          model.symbol = '-';
          model.number = '-';
          model.direction = '-';
          model.createdAt = '-';
          tradeHistoryModelList.add(model);
        }
      } else {
        tradeHistoryModelList = arr.sublist(0, 35);
      }
      if (data.isEmpty) {
        setEmpty();
      } else {
        setIdle();
      }
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  loadDepthNoProgress(id) async {
    try {
      var data = await ContractServer.depth(id);
      List listBuy = data['data']['buy'].map<dynamic>((item) => item).toList();
      List listSell = data['data']['sell'].map<dynamic>((item) => item).toList();
      setData(listBuy, listSell);
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  /*
   *单个币种详情 
   */
  requestMarketDetail(symbol) async {
    try {
      var data = await ContractServer.getMarketDetail(symbol);
      marketListModel = CMarketModel.fromJson(data['data']);
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  // Future<bool> order(multiple, hand, marketId, type, price) async {
  //   setBusy();
  //   try {
  //     var data =
  //         await TradeServer.order(multiple, hand, marketId, type, price);
  //     if (data['msg'] == 'success') {
  //       setIdle();
  //       return Future.value(true);
  //     } else {
  //       return Future.value(false);
  //     }
  //   } catch (e, s) {
  //     setError(e, s);
  //     return Future.value(false);
  //   }
  // }
}
