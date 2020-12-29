/*
* @message: 主页路由控制
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-02-27 20:08:46
* @LastEditors: Jack
* @LastEditTime: 2020-08-15 20:45:41
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/wallet/routes/index.dart
*/

import 'dart:convert';

import 'package:HBit/pages/trade/trade_screen.dart';
import 'package:HBit/pages/wallet/model/bibi_recored_model.dart';
import 'package:HBit/pages/wallet/views/Mining.dart';
import 'package:HBit/pages/wallet/views/MiningList.dart';
import 'package:HBit/pages/wallet/views/RuleDescription.dart';
import 'package:HBit/pages/wallet/views/record_contract.dart';
import 'package:fluro/fluro.dart';
import 'package:HBit/routes/router_init.dart';
import 'package:HBit/pages/wallet/views/item.dart';
import 'package:HBit/pages/wallet/views/recharge.dart';
import 'package:HBit/pages/wallet/views/withdraw.dart';
import 'package:HBit/pages/wallet/views/withdrawDetail.dart';
import 'package:HBit/pages/wallet/views/transformation.dart';
import 'package:HBit/pages/wallet/views/contract.dart';
import 'package:HBit/pages/wallet/views/record_bibi.dart';
import 'package:HBit/pages/wallet/views/recordDetail.dart';
import 'package:HBit/pages/wallet/views/verification.dart';

class WalletRouter implements IRouterProvider {
  static String security = '/security';
  static String item = '/item';
  static String recharge = '/recharge';
  static String withdraw = '/withdraw';
  static String withdrawDetail = '/withdrawDetail';
  static String transformation = '/transformation';
  static String contract = '/contract';
  static String recordBibi = '/recordBibi';
  static String recordContract = '/recordContract';
  static String recordDetail = '/recordDetail';
  static String verification = '/verification';
  static String trade = '/trade';
  static String Mining = '/Mining';
  static String MiningList = '/MiningList';
  static String RuleDescription = '/RuleDescription';

  @override
  void initRouter(FluroRouter router) {
    router.define(item, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      var coinName = params['coinName'].first;
      return ItemPage(coinName: coinName);
    }));
    router.define(recharge, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      var coinName = params['coinName'].first;
      return RechargePage(coinName: coinName);
    }));
    router.define(withdraw, handler: Handler(handlerFunc: (_, __) => WithdrawPage()));
    router.define(withdrawDetail, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      var coinName = params['coinName'].first;
      return WithdrawDetailPage(coinName: coinName);
    }));
    router.define(transformation, handler: Handler(handlerFunc: (_, __) => TransformationPage()));
    router.define(contract, handler: Handler(handlerFunc: (_, __) => ContractPage()));
    router.define(recordBibi, handler: Handler(handlerFunc: (_, __) => RecordBibiPage()));
    router.define(recordContract, handler: Handler(handlerFunc: (_, __) => RecordContractPage()));
    router.define(recordDetail, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      Map<String, dynamic> item = json.decode(params['param'].first);
      BibiRecored model = BibiRecored.fromJson(item);
      return RecordDetailPage(model: model);
    }));
    router.define(verification, handler: Handler(handlerFunc: (_, __) => VerificationPage()));

    router.define(trade, handler: Handler(handlerFunc: (_, __) => TradeScreen()));
    router.define(Mining, handler: Handler(handlerFunc: (_, __) => MiningPage()));
    router.define(MiningList, handler: Handler(handlerFunc: (_, __) => MiningListPage()));
    router.define(RuleDescription, handler: Handler(handlerFunc: (_, __) => RuleDescriptionPage()));
  }
}
