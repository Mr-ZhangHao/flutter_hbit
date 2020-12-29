/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-13 11:31:05
* @LastEditors: Jack
* @LastEditTime: 2020-08-17 17:23:05
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/widgets/home_widget/marked_list.dart
*/
import 'dart:async';

import 'package:HBit/common/refresh/page_list.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/home/widgets/home_widget/market_list_header.dart';
import 'package:HBit/pages/home/widgets/home_widget/market_list_item.dart';
import 'package:HBit/pages/trade/model/market_model.dart';
import 'package:HBit/pages/trade/routes/index.dart';
import 'package:HBit/pages/trade/server/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';

import 'contract_list.dart';
import 'package:HBit/common/i18n/i18n.dart';

class MarketListView extends PageList {
  final int index;
  MarketListView(this.index, {Key key}) : super(key: key);
  @override
  _MarketListViewState createState() => _MarketListViewState();
}

class _MarketListViewState extends PageListState<MyMarketModel, MarketListView> with AutomaticKeepAliveClientMixin {
  Timer timer;

  @override
  bool get wantKeepAlive => true;

  Sorting priceSorting = Sorting.ascending;
  Sorting rateSorting = Sorting.normal;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        color: kWhite,
        child: Column(
          children: <Widget>[
            MarketListHeader(
              priceAscending: priceSorting,
              rateAscending: rateSorting,
              onPriceTab: () {
                if (priceSorting == Sorting.ascending) {
                  setState(() {
                    priceSorting = Sorting.descending;
                    rateSorting = Sorting.normal;
                  });
                } else {
                  setState(() {
                    priceSorting = Sorting.ascending;
                    rateSorting = Sorting.normal;
                  });
                }

                loadData(1);
              },
              onRateTab: () {
                // print('==============${value ? '根据涨幅升序' : '根据涨幅降序'}===================');
                if (rateSorting == Sorting.ascending) {
                  setState(() {
                    rateSorting = Sorting.descending;
                    priceSorting = Sorting.normal;
                  });
                } else {
                  setState(() {
                    rateSorting = Sorting.ascending;
                    priceSorting = Sorting.normal;
                  });
                }
                loadData(1);
              },
            ),
            Expanded(child: buildList(context),flex: 1,)
          ],
        ));
  }

  @override
  void initState() {
    loadData(1);
    super.initState();
  }

  ///加载数据
  @override
  loadPage({int page, Function(List<MyMarketModel>) onSuccess, Function onErr}) async {
    if (GlobalConfig.isTimer) {
      timer = Timer(Duration(seconds: 2), () async {
        if ((widget as MarketListView).index == 0) {
          var data = await TradeServer.getOptionList();
          List<MyMarketModel> list = data['data'].map<MyMarketModel>((e) => MyMarketModel.fromJson(e)).toList();
          if (list.length > 0) {
            timer?.cancel();
            if (priceSorting != Sorting.normal) {
              priceSorting == Sorting.descending
                  ? list.sort((left, right) => (num.parse(right.close)).compareTo(num.parse(left.close)))
                  : list.sort((left, right) => (num.parse(left.close)).compareTo(num.parse(right.close)));
            } else {
              rateSorting == Sorting.descending
                  ? list.sort((left, right) => (num.parse(right.close)).compareTo(num.parse(left.close)))
                  : list.sort((left, right) => (num.parse(left.close)).compareTo(num.parse(right.close)));
            }
            onSuccess(list);
          } else {
            timer?.cancel();
          }
        } else {
          var data = await TradeServer.marketList();
          List<MyMarketModel> list = data['data'].map<MyMarketModel>((e) => MyMarketModel.fromJson(e)).toList();
          if (priceSorting != Sorting.normal) {
            priceSorting == Sorting.descending
                ? list.sort((left, right) => (num.parse(right.close)).compareTo(num.parse(left.close)))
                : list.sort((left, right) => (num.parse(left.close)).compareTo(num.parse(right.close)));
          } else {
            rateSorting == Sorting.descending
                ? list.sort((left, right) => (num.parse(right.rate)).compareTo(num.parse(left.rate)))
                : list.sort((left, right) => (num.parse(left.rate)).compareTo(num.parse(right.rate)));
          }
          onSuccess(list);
          timer?.cancel();
          loadData(page);
        }
      });
    } else {
      if ((widget as MarketListView).index == 0) {
        var data = await TradeServer.getOptionList();
        List<MyMarketModel> list = data['data'].map<MyMarketModel>((e) => MyMarketModel.fromJson(e)).toList();
        if (list.length > 0) {
          if (priceSorting != Sorting.normal) {
            priceSorting == Sorting.descending
                ? list.sort((left, right) => (num.parse(right.close)).compareTo(num.parse(left.close)))
                : list.sort((left, right) => (num.parse(left.close)).compareTo(num.parse(right.close)));
          } else {
            rateSorting == Sorting.descending
                ? list.sort((left, right) => (num.parse(right.close)).compareTo(num.parse(left.close)))
                : list.sort((left, right) => (num.parse(left.close)).compareTo(num.parse(right.close)));
          }
          onSuccess(list);
        } else {
          timer?.cancel();
        }
      } else {
        var data = await TradeServer.marketList();
        List<MyMarketModel> list = data['data'].map<MyMarketModel>((e) => MyMarketModel.fromJson(e)).toList();
        if (priceSorting != Sorting.normal) {
          priceSorting == Sorting.descending
              ? list.sort((left, right) => (num.parse(right.close)).compareTo(num.parse(left.close)))
              : list.sort((left, right) => (num.parse(left.close)).compareTo(num.parse(right.close)));
        } else {
          rateSorting == Sorting.descending
              ? list.sort((left, right) => (num.parse(right.rate)).compareTo(num.parse(left.rate)))
              : list.sort((left, right) => (num.parse(left.rate)).compareTo(num.parse(right.rate)));
        }
        onSuccess(list);
      }
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  bool get isEnablePullUp => false;
  @override
  bool get isEnablePullDown => false;

  @override
  buildItem(MyMarketModel model) {
    return GestureDetector(
      onTap: () {
        timer?.cancel();
        timer = null;
        Routers.pushResult(context,
            "${TradeRouter.kline}?coinName=${model.symbol.split('/').join('_')}&coinID=${model.symbol.split('/').join('_')}&type=trade",
            (result) {
          loadData(1);
        });
      },
      child: MarketListItem(
        symbol: model.symbol,
        total: Utils.conversionNum(double.parse(model.total.toString())),
        close: Utils.cutZero(double.parse(model.close)),
        number: Utils.conversionNum(double.parse(model.number.toString())),
        // rate: (num.parse(model.close) - num.parse(model.open)) / num.parse(model.open),
        rate: double.parse(model.rate),
      ),
    );
  }

  @override
  Widget buildFooter() {
    return SizedBox();
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
}
