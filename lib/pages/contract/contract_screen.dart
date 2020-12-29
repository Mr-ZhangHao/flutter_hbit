import 'dart:async';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/contract/provider/contract_provider.dart';
import 'package:HBit/pages/contract/provider/contract_common_provider.dart';
import 'package:HBit/pages/contract/routes/index.dart';
import 'package:HBit/pages/contract/widgets/market/contract_left.dart';
import 'package:HBit/pages/contract/widgets/market/contract_right.dart';
import 'package:HBit/pages/contract/widgets/order/cangwei.dart';
import 'package:HBit/pages/contract/widgets/order/entrust.dart';
import 'package:HBit/pages/contract/widgets/order/plane.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/sp_utils.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/cupertino.dart' hide NestedScrollView;
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:HBit/providers/provider_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../utils/screen.dart';
import 'widgets/market/contract_drawer.dart';

enum WareHouse {
  open,

  more
}

class ContractScreen extends StatefulWidget {
  ContractScreen({Key key}) : super(key: key);

  @override
  _ContractScreenState createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  PlanType planType = PlanType.normal;

  RefreshController _refreshController = RefreshController();

  List<String> tabbarList = ['仓位', '当前委托', '当前计划'];

  Timer timer;

  int currentIndex = 0;
  int currentIndex2 = 0;
  @override
  void dispose() {
    timer?.cancel();
    _refreshController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    getCoinItem();

    super.initState();
  }

  GlobalKey<CangweiListState> cangweiKey = GlobalKey<CangweiListState>();
  GlobalKey<EentrustListState> entrustKey = GlobalKey<EentrustListState>();
  GlobalKey<PlaneListState> planeKey = GlobalKey<PlaneListState>();
  void getCoinItem() {
    String buySell = SpUtils.sp.getString('buySell');
    if (buySell != null) {
      if (buySell == 'buy') {
      } else if (buySell == 'sell') {}
    }
    SpUtils.sp.remove('buySell');
  }

  onRefresh() {
    print('onRefresh');
    _refreshController.refreshCompleted();
  }

  onLoadMore() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    tabbarList = ['${Tr.of(context).contractPositions}', '${Tr.of(context).tradrCurrentEntrust}', '${Tr.of(context).contractCurrentPlan}'];

    return ProviderWidget2<ContractCommonProvider, ContractOrderProvider>(
      model1: ContractCommonProvider(),
      model2: ContractOrderProvider(),
      onModelReady: (model1, model2) async {
        await model1.loadData();
        reloadData(model1, model2);
        getBalace(model1, model2);
      },
      builder: (BuildContext context, ContractCommonProvider model1, ContractOrderProvider model2, Widget child) {
        return Scaffold(
          backgroundColor: kWhite,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(65),
            child: AppBar(
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Builder(builder: (context) {
                    return InkWell(
                      child: ImageIcon(AssetImage('images/trade/cb.png'), size: sp(44)),
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  }),
                  SizedBox(width: width(10)),
                  Text(model2.marketListModel?.symbol?.replaceAll('_', "/")?.toUpperCase() ?? '--/--',
                      style: TextStyle(fontSize: sp(28)))
                ],
              ),
              automaticallyImplyLeading: false,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(35),
                child: Container(
                  // Container(color: Color(0xffF6F6F6), height: height(20))
                  padding: EdgeInsets.only(left: width(40), bottom: height(15)),
                  decoration:
                      BoxDecoration(border: Border(bottom: BorderSide(width: width(20), color: Color(0xffF6F6F6)))),
                  child: Row(
                    children: <Widget>[
                      Text('${Tr.of(context).contractCurrentPrice}', style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(24))),
                      SizedBox(width: width(20)),
                      Text(Utils.cutZero(model2.marketListModel?.now ?? 0.00),
                          style: TextStyle(
                              color:
                                  double.parse(model2.marketListModel?.rate ?? '0.00') >= 0 ? kGreenColor : kRedColor,
                              fontSize: sp(24)))
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: SmartRefresher(
            controller: _refreshController,
       //     header: ClassicHeader(),
            onRefresh: onRefresh,
            onLoading: null,
            enablePullUp: false,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: CustomTabBarwidget(
                          tabbarList: [Tr.of(context).contractEntrust, '${Tr.of(context).contractPlanEntrust}'],
                          currentIndex: currentIndex2,
                          unActiveColor: Colors.black87,
                          tabChange: (int index) {
                            setState(() => currentIndex2 = index);
                            if (index == 0) {
                              setState(() => planType = PlanType.normal);
                            } else {
                              setState(() => planType = PlanType.entrust);
                            }
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          timer?.cancel();
                          timer = null;
                          Routers.pushResult(context,
                              "${ContractRouter.kline}?coinName=${model1.marketItem.symbol}&coinID=${model1.marketItem.symbol}&type=contract",
                              (result) {
                            reloadData(model1, model2);
                            getBalace(model1, model2);
                          });
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                            margin: EdgeInsets.only(right: width(20)),
                            child: Image.asset('images/trade/kx.png',
                                width: width(48), height: width(48), fit: BoxFit.fill)),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: _tabPaneView(model1, model2)),
                SliverToBoxAdapter(child: Container(color: Color(0xffF6F6F6), height: height(20))),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: CustomTabBarwidget(
                          tabbarList: tabbarList,
                          currentIndex: currentIndex,
                          tabChange: (int index) => setState(() => currentIndex = index),
                        )),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            timer?.cancel();
                            Routers.pushResult(context, ContractRouter.contractRecord, (result) {
                              reloadData(model1, model2);
                              getBalace(model1, model2);
                            });
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            width: width(80),
                            height: height(80),
                            padding: EdgeInsets.all(width(20)),
                            child: Image.asset('images/trade/more@3x.png',
                                fit: BoxFit.fill, width: width(28), height: height(33)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                model1.marketItem?.symbol != null
                    ? (currentIndex == 0
                        ? CangweiList(
                            contractCommonProvider: model1,
                            key: cangweiKey,
                          )
                        : currentIndex == 1
                            ? EntrustList(
                                contractCommonProvider: model1,
                                key: entrustKey,
                              )
                            : PlaneList(
                                contractCommonProvider: model1,
                                key: planeKey,
                              ))
                    : SliverToBoxAdapter(child: SizedBox())
                // buildExpandedListView(model1, model2)
              ],
            ),
          ),
          drawer: ContractDrawer(
            onTab: (val) {
              reloadData(model1, model2);
              getBalace(model1, model2);
              currentIndex == 0
                  ? cangweiKey.currentState.loadPage()
                  : currentIndex == 1 ? entrustKey.currentState.loadPage() : planeKey.currentState.loadPage();
            },
          ),
        );
      },
    );
  }

  Widget _tabPaneView(ContractCommonProvider model1, ContractOrderProvider model2) {
    return SizedBox(
      height: height(660),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContractLeft(
            model1: model1,
            model2: model2,
            planType: planType,
            onBuyClick: () {
              reloadData(model1, model2);
            },
            onSellClick: () {
              reloadData(model1, model2);
            },
          ),
          ContractRight(model2: model2, model1: model1)
        ],
      ),
    );
  }

  void getBalace(ContractCommonProvider model1, ContractOrderProvider model2) {
    if (model1.marketItem != null) {
      model1.getBalance(model1.marketItem.symbol);
    }
  }

  void reloadData(ContractCommonProvider model1, ContractOrderProvider model2) {
    timer?.cancel();
    if (model1.marketItem != null) {
      model2.loadDepth(model1.marketItem.symbol);
      model2.requestMarketDetail(model1.marketItem.symbol);
    }
    if (GlobalConfig.isTimer) {
      timer = Timer(Duration(seconds: 30), () {
        reloadData(model1, model2);
        model1.getBalance(model1.marketItem.symbol);
        if (model1.isError || model2.isError) {
          timer?.cancel();
        }
      });
    } else {
      model1.getBalance(model1.marketItem.symbol);
    }
  }
}

class CustomTabBarwidget extends StatelessWidget {
  const CustomTabBarwidget({
    Key key,
    @required this.tabbarList,
    @required this.currentIndex,
    @required this.tabChange,
    this.unActiveColor = const Color(0xffc0c0c0),
  }) : super(key: key);

  final List<String> tabbarList;
  final int currentIndex;
  final Function(int index) tabChange;
  final Color unActiveColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: width(1), color: Color(0xffEAEAEA)))),
      child: Row(
        children: tabbarList.asMap().keys.map((index) {
          return InkWell(
            onTap: () => tabChange(index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width(0), vertical: height(18)),
              margin: EdgeInsets.symmetric(horizontal: width(20)),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: width(4), color: currentIndex == index ? kPrimaryColor : kTransprant))),
              child: Text(
                tabbarList[index],
                style: TextStyle(fontSize: sp(30), color: currentIndex == index ? kPrimaryColor : unActiveColor),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
