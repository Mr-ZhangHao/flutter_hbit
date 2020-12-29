/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-18 18:02:09
* @LastEditors: Roy
* @LastEditTime: 2020-09-14 20:24:57
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/widgets/market/bb_drawer.dart
*/
import 'dart:async';

import 'package:HBit/common/drawer/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/trade/model/market_model.dart';
import 'package:HBit/pages/trade/provider/contract_provider.dart';
import 'package:HBit/pages/trade/provider/market_provider.dart';
import 'package:HBit/pages/trade/server/index.dart';
import 'package:HBit/providers/provider_widget.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/sp_utils.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BibiDrawer extends StatefulWidget {
  final Function onclick;
  const BibiDrawer({Key key, this.onclick}) : super(key: key);

  @override
  _BibiDrawerState createState() => _BibiDrawerState();
}


class _BibiDrawerState extends State<BibiDrawer> with SingleTickerProviderStateMixin {
  // TextEditingController _searchCtr;
  // FocusNode _searchFocus = FocusNode();
  Timer timer;
  List<MyMarketModel> marketModelList = [];

  TabController _tabController;
  @override
  void initState() {
    marketList();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      setState(() {
        marketModelList = [];
      });
      if (_tabController.index == 0) {
        marketList();
      } else {
        optionMarketList();
      }
    });

    if (GlobalConfig.isTimer) {
      timer = Timer.periodic(Duration(seconds: 20), (timer) {
        if (_tabController.index == 0) {
          marketList();
        } else {
          optionMarketList();
        }
      });
    } else {
      if (_tabController.index == 0) {
        marketList();
      } else {
        optionMarketList();
      }
    }
    super.initState();
  }
    @override
  void deactivate() {
    super.deactivate();
    timer?.cancel();
    timer = null;

  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      callback: widget.onclick(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(Tr.of(context).tradrListCoin),
            leading: IconButton(
              icon: ImageIcon(AssetImage('images/trade/cb.png'), size: sp(44)),
              onPressed: () {
                timer?.cancel();
                timer = null;
                Routers.goBack(context);
              }

          ),
            centerTitle: false,
          ),
          body: ProviderWidget<MarketProvider>(
              model: MarketProvider(),
              onModelReady: (model) {
            /*    if (GlobalConfig.isTimer) {
                  timer = Timer.periodic(Duration(seconds:30), (timer) {
                    model.initData();
                  });
                } else {
                  model.initData();
                }*/
              },
              builder: (context, model, child) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: width(40)),
                      //   decoration: BoxDecoration(
                      //       color: Color(0xfff7f7f7),
                      //       borderRadius: BorderRadius.circular(5)),
                      //   child: FocusWidget(
                      //     focusNode: _searchFocus,
                      //     child: ConstrainedBox(
                      //       constraints: BoxConstraints(
                      //         maxHeight: height(80),
                      //         minHeight: height(80),
                      //       ),
                      //       child: TextField(
                      //         controller: _searchCtr,
                      //         focusNode: _searchFocus,
                      //         onChanged: (value) {
                      //           print(value);
                      //         },
                      //         decoration: InputDecoration(
                      //             focusColor: Color(0xff9A9A9A),
                      //             contentPadding: EdgeInsets.symmetric(
                      //                 horizontal: width(0),
                      //                 vertical: height(20)),
                      //             hintText: '搜索币种',
                      //             hintStyle: TextStyle(
                      //                 color: Color(0xff9A9A9A),
                      //                 fontSize: sp(30)),
                      //             prefixIcon: Icon(Icons.search,
                      //                 color: Color(0xff9A9A9A)),
                      //             border: InputBorder.none),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        height: width(80),
                        decoration:
                            BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey[400]))),
                        child: TabBar(
                          labelColor: kTxtColor,
                          unselectedLabelColor: kTxtColor,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: kPrimaryColor,
                          controller: _tabController,
                          tabs: <Widget>[Text(Tr.of(context).homeCoin), Text(Tr.of(context).homeOptional)],
                        ),
                      ),
                      Expanded(
                          child: TabBarView(controller: _tabController, children: [
                        Visibility(
                          visible: marketModelList.length > 0 && _tabController.index == 0,
                          child: CoinListWidget(
                            dataSource: marketModelList,
                            onTab: (val) => _selectAction(val),
                          ),
                          replacement: SizedBox(),
                        ),
                        Visibility(
                          visible: marketModelList.length > 0 && _tabController.index == 1,
                          child: CoinListWidget(
                            dataSource: marketModelList,
                            onTab: (val) => _selectAction(val),
                          ),
                          replacement: SizedBox(),
                        ),
                      ]))
                    ],
                  ),
                );
              })),
    );
  }

  void marketList() async {
    var data = await TradeServer.marketList();
    List<MyMarketModel> list = data['data'].map<MyMarketModel>((e) => MyMarketModel.fromJson(e)).toList();
    setState(() {
      marketModelList = list;
    });
  }

  void optionMarketList() async {
    var data = await TradeServer.getOptionList();
    List<MyMarketModel> list = data['data'].map<MyMarketModel>((e) => MyMarketModel.fromJson(e)).toList();
    setState(() {
      marketModelList = list;
    });
  }

  void _selectAction(item) async {
    Provider.of<MarketProvider>(context, listen: false).setMarketItem(item);

    await SpUtils.sp.setString("symbol", item.symbol);
    Provider.of<ContractProvider>(context, listen: false).loadData(pageNum: 1);
    Provider.of<ContractProvider>(context, listen: false).initData();
    Provider.of<OrderRecordProvider>(context, listen: false).requestMarketDetail(item.symbol);
    Provider.of<OrderRecordProvider>(context, listen: false).loadDepth(item.symbol);
    Provider.of<MarketProvider>(context, listen: false).getBalance(item.symbol);

    widget.onclick();
    Routers.goBack(context);
    timer?.cancel();
    timer = null;
  }
}

class CoinListWidget extends StatelessWidget {
  const CoinListWidget({
    Key key,
    @required this.dataSource,
    this.onTab,
  }) : super(key: key);
  final List<MyMarketModel> dataSource;
  final Function(MyMarketModel val) onTab;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        MyMarketModel marketModel = dataSource[index];
        String rates = double.parse(marketModel.open) == 0
            ? '0'
            : ((double.parse(marketModel.close) - double.parse(marketModel.open)) /
                    double.parse(marketModel.open) *
                    100)
                .toString();
        if (double.parse(rates) < 0) {
          rates = '-' + Utils.formatNum(rates.replaceAll('-', ''), pos: 2).toString();
        } else {
          rates = '+' + Utils.formatNum(rates, pos: 2).toString();
        }
        return Container(
          height: height(100),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: width(44)),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onTab(marketModel),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(marketModel.symbol ?? '--/--',
                        textAlign: TextAlign.left, style: TextStyle(fontSize: sp(26))),
                  ),
                  Expanded(
                    child: Text(Utils.cutZero(marketModel.close ?? 0),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: double.parse(rates ?? 0) >= 0 ? kGreenColor : kRedColor, fontSize: sp(26))),
                  ),
                  Expanded(
                    child: Text(rates + '%' ?? '0' + '%',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: double.parse(rates ?? 0) >= 0 ? kGreenColor : kRedColor, fontSize: sp(26))),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: dataSource.length,
    );
  }
}
