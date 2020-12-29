import 'dart:async';
import 'package:HBit/common/Kline/packages/model/klineConstrants.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/tabbar/indicator.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/contract/model/cmarket_model.dart';
import 'package:HBit/pages/contract/server/index.dart';
import 'package:HBit/pages/contract/views/kline_widget.dart';
import 'package:HBit/pages/contract/widgets/market/clinch_deal.dart';
import 'package:HBit/pages/contract/widgets/market/dept_list.dart';
import 'package:HBit/providers/gloable_provider.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/sp_utils.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Kline extends StatefulWidget {
  final String coinName;
  final String coinID;
  final String tabBarType;
  const Kline({Key key, this.coinName, this.coinID, this.tabBarType}) : super(key: key);
  @override
  _KlineState createState() => _KlineState();
}

class _KlineState extends State<Kline> with SingleTickerProviderStateMixin {
  // final Completer<WebViewController> _controller =
  // Completer<WebViewController>();

  List navList = ['深度', '成交'];
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: navList.length, vsync: this, initialIndex: 0); //第5步，监听TabBar的各种页面切换
    _tabController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    navList = [Tr.of(context).klineDepth, Tr.of(context).klineVOL];
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CupertinoNavigationBar(
          padding: EdgeInsetsDirectional.only(start: 0),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () async {
              await SpUtils.sp.remove('buySell');
              await SpUtils.sp.remove('marketID');
              Routers.goBackWithParams(context, '');
            },
          ),
          middle: Text(
            '${widget.coinName.replaceAll('_', '/').toUpperCase()}',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kBackgroundColor,
        ),
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          color: kBackgroundColor,
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    HeadView(
                      coinID: widget.coinID,
                    ),
                    Container(
                      child: KlineWidget(
                        coinId: widget.coinID,
                      ),
                    ),
                    _tabBar(),
                    Container(
                      width: double.infinity,
                      constraints: BoxConstraints(minHeight: height(700), maxHeight: height(3100)),
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          DeptList(
                            coinName: widget?.coinName ?? '--_--',
                          ),
                          ClinchDeal(
                            coinName: widget?.coinName ?? '--_--',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height(150)),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: height(120),
                  child: _footerView(),
                ),
              ],
            ),
          ),
        ));
  }

  _footerView() {
    return Container(
      height: height(110),
      color: Color(0xff24294C),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: width(18), right: width(18)),
              height: height(75),
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Color(0xff27B399),
                textColor: Colors.white,
                onPressed: () async {
                  await SpUtils.sp.setString('buySell', 'buy');
                  await SpUtils.sp.setString('contractID', widget.coinID.replaceAll('_', '/'));
                  Provider.of<GloableProvider>(context, listen: false)
                      .setCurrIndex(widget.tabBarType == 'contract' ? 3 : 2);
                  Routers.goBackWithParams(context, '');
                },
                child: Text(
                  Tr.of(context).tradrBuy,
                  style: TextStyle(fontSize: sp(32)),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: width(12), right: width(24)),
              height: height(75),
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Color(0xffDE6676),
                textColor: Colors.white,
                onPressed: () async {
                  await SpUtils.sp.setString('buySell', 'sell');
                  await SpUtils.sp.setString('contractID', widget.coinID.replaceAll('_', '/'));
                  Provider.of<GloableProvider>(context, listen: false)
                      .setCurrIndex(widget.tabBarType == 'contract' ? 3 : 2);
                  Routers.goBackWithParams(context, '');
                },
                child: Text(
                  Tr.of(context).tradrSell,
                  style: TextStyle(fontSize: sp(32)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _tabBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(height(70)),
        child: Container(
            height: width(90),
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xff050E2F),
              ),
              padding: EdgeInsets.only(left: width(24)),
              child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Color(0xffBADFFB),
                indicator: TabBarIndicator(),
                labelPadding: EdgeInsets.symmetric(vertical: width(20)),
                indicatorColor: Color(0xff333333),
                unselectedLabelColor: Color(0xff6374A3),
                tabs: navList
                    .map(
                      (e) => Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / navList.length,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            e,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: sp(30),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                controller: _tabController,
                onTap: (int index) => _tabController.index = index,
              ),
            )));
  }
}

class HeadView extends StatefulWidget {
  final String coinID;

  const HeadView({Key key, this.coinID}) : super(key: key);
  @override
  _HeadViewState createState() => _HeadViewState();
}

class _HeadViewState extends State<HeadView> {
  Timer timer;
  CMarketModel coinDetailModel;
  @override
  void initState() {
    super.initState();
    if (GlobalConfig.isTimer) {
      timer = Timer.periodic(Duration(seconds: 2), (timer) {
        _getRequestCoinDetail();
      });
    } else {
      _getRequestCoinDetail();
    }
  }

  _getRequestCoinDetail() async {
    try {
      var data = await ContractServer.getMarketDetail(widget.coinID);
      setState(() {
        coinDetailModel = CMarketModel.fromJson(data['data']);
      });
    } catch (e) {
      GlobalConfig.errorTips(e);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width(30)),
      color: kBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  Utils.cutZero(double.parse(coinDetailModel?.now ?? '0.00')),
                  style: TextStyle(
                      color: double.parse(coinDetailModel?.rate ?? '0') >= 0 ? kGreenColor : kRedColor,
                      fontSize: sp(50),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  Tr.of(context).home24volume,
                  style: TextStyle(color: Color(0xff546580), fontSize: sp(26)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  Utils.conversionNum(double.parse(coinDetailModel?.vol ?? '0.00')),
                  style: TextStyle(color: Color(0xffD3DAE9), fontSize: sp(26)),
                ),
              ),
            ],
          ),
          SizedBox(height: height(20)),
          Row(
            children: <Widget>[
              // Expanded(
              //   flex: 1,
              //   child: Text(
              //     '≈${Utils.cutZero(double.parse(coinDetailModel?.now??'0.00'))}',
              //     style: TextStyle(color: Color(0xffCDCDCD), fontSize: sp(28)),
              //   ),
              // ),
              Expanded(
                flex: 3,
                child: Text(
                  (coinDetailModel?.rate ?? '0') + '%',
                  style: TextStyle(
                      color: double.parse(coinDetailModel?.rate ?? '0') >= 0 ? kGreenColor : kRedColor,
                      fontSize: sp(28)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  Tr.of(context).klineMax,
                  style: TextStyle(color: Color(0xff546580), fontSize: sp(26)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  Utils.cutZero(double.parse(coinDetailModel?.high ?? '0.00')),
                  style: TextStyle(color: Color(0xffD3DAE9), fontSize: sp(26)),
                ),
              ),
            ],
          ),
          SizedBox(height: height(20)),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  Tr.of(context).homeOpen,
                  style: TextStyle(color: Color(0xff546580), fontSize: sp(26)),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  '${Utils.conversionNum(double.parse(coinDetailModel?.open ?? '0.00'))}',
                  style: TextStyle(color: Color(0xffD3DAE9), fontSize: sp(26)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  Tr.of(context).klineMin,
                  style: TextStyle(color: Color(0xff546580), fontSize: sp(26)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  Utils.cutZero(double.parse(coinDetailModel?.low ?? '0.00')),
                  style: TextStyle(color: Color(0xffD3DAE9), fontSize: sp(26)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
