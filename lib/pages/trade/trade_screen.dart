/*
* @message: 币币页面
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-03-14 11:48:53
* @LastEditors: Roy
* @LastEditTime: 2020-09-15 17:00:43
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/trade_screen.dart
*/
import 'dart:async';
import 'package:HBit/common/event/TrderCoinListEvent.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/trade/provider/contract_provider.dart';
import 'package:HBit/pages/trade/provider/market_provider.dart';
import 'package:HBit/pages/trade/routes/index.dart';
import 'package:HBit/pages/trade/server/index.dart';
import 'package:HBit/pages/trade/widgets/market/bb_drawer.dart';
import 'package:HBit/pages/trade/widgets/market/market_left.dart';
import 'package:HBit/pages/trade/widgets/market/market_order.dart';
import 'package:HBit/pages/trade/widgets/market/market_right.dart';
import 'package:HBit/routes/application.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/sp_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HBit/providers/provider_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///市场行情 深度订单等等
class TradeScreen extends StatefulWidget {
  TradeScreen({Key key}) : super(key: key);

  @override
  _TradeScreenState createState() => _TradeScreenState();
}

enum BuyType {
  /// 买入   绿色
  buy,

  /// 卖出 红色
  sell
}

class _TradeScreenState extends State<TradeScreen> {
  /// 市价或现价
  // final _priceCtr = TextEditingController();

  /// 几手✋
  // final _numCtr = TextEditingController();
  final FocusNode _priceFocus = FocusNode();
  // final FocusNode _numFocus = FocusNode();

  BuyType buyType = BuyType.buy;

  List<dynamic> multipleList = [
    {"id": 25, "num": "25倍"},
    {"id": 50, "num": "50倍"},
    {"id": 100, "num": "100倍"},
  ];
  RefreshController _refreshController = RefreshController();

  Timer timer;

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    _refreshController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    getCoinItem();
    _priceFocus.addListener(() {});
    super.initState();

  }

  /*
   * 判断是不是k线页面过来
   */
  void getCoinItem() {
    String buySell = SpUtils.sp.getString('buySell');
    if (buySell != null) {
      if (buySell == 'buy') {
        setState(() {
          buyType = BuyType.buy;
        });
      } else if (buySell == 'sell') {
        setState(() {
          buyType = BuyType.sell;
        });
      }
    }
    SpUtils.sp.remove('buySell');
  }

  onRefresh() {
    print('onRefresh');
    // 刷新完成
    _refreshController.refreshCompleted();
  }

  onLoadMore() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // getCoinItem();
    return ProviderWidget3<MarketProvider, OrderRecordProvider, ContractProvider>(
      model1: MarketProvider(),
      model2: OrderRecordProvider(),
      model3: ContractProvider(),
      onModelReady: (model1, model2, model3) async {
        model1.getRateCNY();
        await model1.initData();
        if (model1.marketItem != null) {
          await SpUtils.sp.setString("symbol", model1.marketItem.symbol);
          model1.optionMarketList();
          refreshData(model1, model2, model3);
        }
        //监听事件总线上数据变化
        Application.eventBus.on<TrderCoinListEvent>().listen((event) {
          if (mounted) {
            refreshData(model1, model2, model3);
          }
        });
      },
      builder: (BuildContext context, MarketProvider model1, OrderRecordProvider model2, ContractProvider model3,
          Widget child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height(90)),
            child: AppBar(
                elevation: 1,
                automaticallyImplyLeading: false,
                centerTitle: false,
                title: Builder(
                  builder: (context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            timer?.cancel();
                            timer = null;
                            Scaffold.of(context).openDrawer();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Image.asset('images/trade/cb.png', width: width(48), height: height(48)),
                          ),
                        ),
                        SizedBox(width: width(10)),
                        Text(model1.marketItem?.symbol ?? '--/--',
                            style: TextStyle(fontSize: sp(28), color: Color(0xff323232))),
                      ],
                    );
                  },
                ),
                actions: <Widget>[
                  GestureDetector(
                    onTap: () {
                      requestCollected(model1);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width(20)),
                      child: ImageIcon(
                        model1.isCollected ? AssetImage('images/trade/sc01.png') : AssetImage('images/trade/sc02.png'),
                        size: sp(44),
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      timer?.cancel();
                      timer = null;
                      var coinName = model1.marketItem.symbol.replaceAll('/', '_').toUpperCase();
                      Routers.pushResult(context, "${TradeRouter.kline}?coinName=$coinName&coinID=$coinName&type=trade",
                          (result) {
                        refreshData(model1, model2, model3);
                      });
                    },
                    child: Container(
                      width: width(48),
                      height: width(48),
                      margin: EdgeInsets.only(right: width(20)),
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/trade/kx.png'))),
                    ),
                  ),
                ]),
          ),
          body: SmartRefresher(
            controller: _refreshController,
           header: ClassicHeader(),
            footer: ClassicFooter(),
            onRefresh: onRefresh,
            onLoading: null,
            enablePullUp: false,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: width(30), right: width(30), top: height(30), bottom: 0),
                    color: kWhite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MarketLeft(
                          model: model1,
                          model1: model2,
                          buyType: buyType,
                          refreshData: () => timerRun(model1, model2, model3),
                          onBuyClick: () => setState(() => buyType = BuyType.buy),
                          onSellClick: () => setState(() => buyType = BuyType.sell),
                        ),
                        MarketRight(model2: model2, model1: model1)
                      ],
                    ),
                  ),
                  Container(height: height(20), color: Color(0xfff6f6f6)),
                  MarketOrder(
                      model: model3,
                      clearTimer: () {
                        timer?.cancel();
                        timer = null;
                      },
                      pushResult: () {
                        if (model1.marketItem != null) {
                           model1.getBalance(model1.marketItem.symbol);
                        }
                        if (model1.marketItem != null) {
                          model2.loadDepth(model1.marketItem.symbol);
                          model2.requestMarketDetail(model1.marketItem.symbol);
                          model3.initData();
                        }
                      } )
                ],
              ),
            ),
          ),
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: true,
          drawer: BibiDrawer(
            onclick: () {
              // optionMarketList(model1);
              timerRun(model1, model2, model3);
            },
          ),
        );
      },
    );
  }

  void refreshData(MarketProvider model1, OrderRecordProvider model2, ContractProvider model3) async {
    if (model1.marketItem != null) {
      // await model3.loadData(pageNum: 1);
      model3.initData();
      model2.loadDepth(model1.marketItem.symbol);
      model1.getBalance(model1.marketItem.symbol);
      model2.requestMarketDetail(model1.marketItem.symbol);
      timerRun(model1, model2, model3);
    }
  }

  void requestCollected(MarketProvider model1) {
    try {
      Toast.showLoading('Loading...');
      TradeServer.requestOption({"symbol": model1.marketItem?.symbol ?? '', "op": model1.isCollected ? "2" : "1"})
          .then((data) {
        Toast.showSuccess(Tr.of(context).tradrSuccess);
        model1.optionMarketList();
      });
    } catch (e) {
      GlobalConfig.errorTips(e);
    }
  }

  void timerRun(MarketProvider model1, OrderRecordProvider model2, ContractProvider model3) {
    timer?.cancel();
    timer = null;
    if (model1.marketItem != null) {
    //  model1.getBalance(model1.marketItem.symbol);
    }
    if (GlobalConfig.isTimer) {
      timer = Timer.periodic(Duration(seconds: 20), (timer1) async {
        if (model1.marketItem != null) {
          model2.loadDepth(model1.marketItem.symbol);
          model2.requestMarketDetail(model1.marketItem.symbol);
          model3.initData();
        }
      });
    } else {
      if (model1.marketItem != null) {
        model2.loadDepth(model1.marketItem.symbol);
        model2.requestMarketDetail(model1.marketItem.symbol);
        model3.initData();
      }
    }
  }
}
