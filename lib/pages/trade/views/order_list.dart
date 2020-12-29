/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-19 19:34:18
* @LastEditors: Roy
* @LastEditTime: 2020-09-17 20:38:38
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/views/order_list.dart
*/
import 'package:HBit/common/event/TrderCoinListEvent.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/refresh/page_list.dart';
import 'package:HBit/common/tabbar/indicator.dart';
import 'package:HBit/common/toast/drop-down.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/pages/trade/model/order_model.dart';
import 'package:HBit/pages/trade/provider/contract_provider.dart';
import 'package:HBit/pages/trade/provider/market_provider.dart';
import 'package:HBit/pages/trade/server/index.dart';
import 'package:HBit/pages/trade/widgets/market/order_item.dart';
import 'package:HBit/pages/trade/widgets/order/histtory_item.dart';
import 'package:HBit/pages/trade/widgets/order/right_drawer.dart';
import 'package:HBit/providers/provider_widget.dart';
import 'package:HBit/routes/application.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class OrderListPage extends StatefulWidget {
  OrderListPage({Key key}) : super(key: key);

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage>
    with SingleTickerProviderStateMixin {
  List<String> tabbarList = ['当前订单', '历史订单'];

  TabController _tabController;

  int selectCoinId = 0;
  String coinName = "";
  String side = "";
  String symbol = "";

  bool isShow = false;

  //这里就是关键的代码，定义一个key
  GlobalKey<_OrderListState> _orderListState = new GlobalKey<_OrderListState>();
  GlobalKey<_OrderListState> _orderListState1 =
      new GlobalKey<_OrderListState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabbarList.length);
    _tabController.index = 0;
    // _tabController.addListener(() {
    //   if ( _tabController.index==0) {
    //      _orderListState.currentState.loadData(1);
    //   } else {
    //     _orderListState1.currentState.loadData(1);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    String selectType = Tr.of(context).tradrAll;
    tabbarList = [Tr.of(context).tradrCurrentOrder, Tr.of(context).tradrHistoricalOrders];
    return ProviderWidget2<MarketProvider, OrderRecordProvider>(
        model1: MarketProvider(),
        model2: OrderRecordProvider(),
        onModelReady: (model1, model2) async {
          await model1.initData();
          setState(() {
            coinName = model1.marketItem.symbol;
            symbol = model1.marketItem.symbol;
          });
          await model2.symbolCallBack(model1.marketItem.symbol);
          _tabController.index == 0
              ? _orderListState.currentState.loadData(1)
              : _orderListState1.currentState.loadData(1);
        },
        builder: (BuildContext context, MarketProvider model1,
            OrderRecordProvider model2, Widget child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                    ),
                    onPressed: () {
                      Routers.goBackWithParams(context, '');
                    }),
                title: InkWell(
                  onTap: () {
                    setState(() {
                      isShow = !isShow;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(coinName,
                          style: TextStyle(
                              color: Color(0xff333333), fontSize: sp(32))),
                      Container(
                        width: width(40),
                        height: height(30),
                        child: Image.asset('images/contract/xiala.png'),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: width(20)),
                          child: ImageIcon(
                              AssetImage('images/contract/shaixuan.png'),
                              size: sp(44))),
                    );
                  }),
                ]),
            body:
                //  ProviderWid get2<MarketProvider,OrderRecordProvider>(
                //     model1: MarketProvider(),
                //     model2: OrderRecordProvider(),
                //     onModelReady: (model1,model2) async {
                //       await model1.initData();
                //       setState(() {
                //         coinName = model1.marketItem.symbol;
                //       });
                //       model2.symbolCallBack(model1.marketItem.symbol);
                //       // model2.setSymbol(model.marketItem.symbol);
                //       // _orderListState.currentState.loadData(1);
                //     },
                //     builder: (BuildContext context, MarketProvider model1,
                //     OrderRecordProvider model2,Widget child) {
                Stack(
              children: <Widget>[
                PreferredSize(
                  preferredSize: Size.fromHeight(width(70)),
                  child: Container(
                    height: width(100),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.symmetric(
                            vertical: BorderSide(
                                width: width(1), color: Color(0xffEAEAEA)))),
                    child: TabBar(
                      labelColor: Color(0xff126DFF),
                      unselectedLabelColor: Color(0xff999999),
                      indicator: TabBarIndicator(),
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: EdgeInsets.symmetric(vertical: width(10)),
                      indicatorColor: Color(0xff333333),
                      controller: _tabController,
                      tabs: tabbarList
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.only(bottom: 4),
                              child: Text(
                                e,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: sp(30),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onTap: (int index) {
                        _tabController.index = index;
                        setState(() {});
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height(90)),
                  width: double.infinity,
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      OrderList('current', symbol, side, model2,
                          key: _orderListState),
                      OrderList('history', symbol, side, model2,
                          key: _orderListState1),
                    ],
                  ),
                ),
                isShow
                    ? DropDown(
                        list: model1.marketList,
                        selectType: selectCoinId,
                        onSelect: (e) async {
                          setState(() {
                            coinName = e['coin_name'];
                            selectCoinId = e['type'];
                            symbol = e['coin_name'];
                            isShow = false;
                          });
                          await model2.symbolCallBack(e['coin_name']);
                          _tabController.index == 0
                              ? _orderListState.currentState.loadData(1)
                              : _orderListState1.currentState.loadData(1);
                        })
                    : SizedBox(),
              ],
            ),
            // }),
            endDrawer: RightDrawer(
              selectType: selectType,
              onTab: (e) async {
                if (e == '买入'||e=='Buy'||e=='買入') {
                  await model2.sideCallBack('BUY');
                } else if (e == '卖出'||e=='賣出'||e=='Sell') {
                  await model2.sideCallBack('SELL');
                } else {
                  await model2.sideCallBack('');
                }
                setState(() {
                  selectType = e;
                  side = e == '买入'||e=='Buy'||e=='買入' ? 'BUY' : e == '卖出'||e=='賣出'||e=='Sell' ? 'SELL' : '';
                });
                _tabController.index == 0
                    ? _orderListState.currentState.loadData(1)
                    : _orderListState1.currentState.loadData(1);
              },
            ),
          );
        });
  }
}

class OrderList extends PageList {
  final String type;
  final String symbol;
  final String side;
  final OrderRecordProvider model;
  OrderList(this.type, this.symbol, this.side, this.model, {Key key})
      : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends PageListState<OrderModel, OrderList> {
  bool enablePullUp = true;
  String symbolStr = '';
  String sideStr = '';
  @override
  // bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    setState(() {
      symbolStr = (widget as OrderList).symbol;
      sideStr = (widget as OrderList).side;
    });
    (widget as OrderList).model.setSideCallBack((side) {
      setState(() {
        sideStr = side;
      });
    });
    (widget as OrderList).model.setSymbolCallBack((symbol) {
      setState(() {
        symbolStr = symbol;
      });
    });
    if (symbolStr.isNotEmpty) {
      loadData(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildList(context);
  }

  @override
  buildItem(OrderModel model) {
    if ((widget as OrderList).type == 'current') {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: width(24)),
        child: OrderItemWidget(
            model: model,
            onTab: (v) {
              cancelOrder(v);
            }),
      );
    } else {}
    return HistoryItemWidget(model);
  }

  @override
  empty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/contract/no_record.png',
            width: width(230),
            height: width(230),
            fit: BoxFit.contain,
          ),
          SizedBox(height: height(20)),
          Text(Tr.of(context).homeNodata, style: TextStyle(color: Color(0xffDBDBDB)))
        ],
      ),
    );
  }

  ///加载数据
  @override
  loadPage(
      {int page, Function(List<OrderModel>) onSuccess, Function onErr}) async {
    var response = await TradeServer.orderRecord(page, symbolStr,
        perPage: 10,
        side: sideStr,
        status: (widget as OrderList).type == 'current' ? '0' : '1,2');
    onSuccess(response.map<OrderModel>((e) => OrderModel.fromJson(e)).toList());
  }

  void cancelOrder(OrderModel model) {
    showAlertDialog(BackButtonBehavior.none,
        context: context, message: Tr.of(context).tradrCancelHint, cancel: () {}, confirm: () async {
      Toast.showLoading('loading');
      TradeServer.requestCancelOrder(model.id).then((value) {
        Future.delayed(Duration(seconds: 2), () {
          Toast.showSuccess(Tr.of(context).tradrCancelSuccess);
          Application.eventBus
              .fire(TrderCoinListEvent());
        });
      }).catchError((e) {});
    });
  }
}
