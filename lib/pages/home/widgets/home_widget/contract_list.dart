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
import 'package:HBit/pages/contract/routes/index.dart';
import 'package:HBit/pages/home/model/recommends_contract_model.dart';
import 'package:HBit/pages/home/widgets/home_widget/market_list_header.dart';
import 'package:HBit/pages/home/widgets/home_widget/market_list_item.dart';
import 'package:HBit/pages/wallet/server/contract.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:HBit/common/i18n/i18n.dart';

class ContractListView extends PageList {
  ContractListView({Key key}) : super(key: key);
  @override
  _MarketListViewState createState() => _MarketListViewState();
}

enum Sorting { ascending, descending, normal }

class _MarketListViewState extends PageListState<RecommendsContractModel, ContractListView>
    with AutomaticKeepAliveClientMixin {
  Timer timer;

  Sorting priceSorting = Sorting.ascending;
  Sorting rateSorting = Sorting.normal;

  @override
  bool get wantKeepAlive => true;
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
                print('==============${'根据涨幅升序' '根据涨幅降序'}===================');
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
            Expanded(child: buildList(context))
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
  loadPage({int page, Function(List<RecommendsContractModel>) onSuccess, Function onErr}) async {
    if (GlobalConfig.isTimer) {
      timer = Timer(Duration(seconds: 2), () async {
        try {
          List<RecommendsContractModel> list = await ContractWalletServer.getContracts();
          if (priceSorting != Sorting.normal) {
            priceSorting == Sorting.descending
                ? list.sort((left, right) => (num.parse(right.now)).compareTo(num.parse(left.now)))
                : list.sort((left, right) => (num.parse(left.now)).compareTo(num.parse(right.now)));
          } else {
            rateSorting == Sorting.descending
                ? list.sort((left, right) => (num.parse(right.rate)).compareTo(num.parse(left.rate)))
                : list.sort((left, right) => (num.parse(left.rate)).compareTo(num.parse(right.rate)));
          }
          onSuccess(list);
          timer?.cancel();
          loadData(page);
        } on Exception catch (e, _) {
          timer?.cancel();
          onErr();
        }
      });
    } else {
      try {
        List<RecommendsContractModel> list = await ContractWalletServer.getContracts();
        if (priceSorting != Sorting.normal) {
          priceSorting == Sorting.descending
              ? list.sort((left, right) => (num.parse(right.now)).compareTo(num.parse(left.now)))
              : list.sort((left, right) => (num.parse(left.now)).compareTo(num.parse(right.now)));
        } else {
          rateSorting == Sorting.descending
              ? list.sort((left, right) => (num.parse(right.rate)).compareTo(num.parse(left.rate)))
              : list.sort((left, right) => (num.parse(left.rate)).compareTo(num.parse(right.rate)));
        }
        onSuccess(list);
        timer?.cancel();
      } on Exception catch (e, _) {
        timer?.cancel();
        onErr();
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
  buildItem(RecommendsContractModel model) {
    return GestureDetector(
      onTap: () {
        timer?.cancel();
        timer = null;
        Routers.pushResult(
            context, "${ContractRouter.kline}?coinName=${model.symbol}&coinID=${model.symbol}&type=contract", (result) {
          loadData(1);
        });
      },
      child: MarketListItem(
        symbol: model.symbol.split("_").join('/').toUpperCase(),
        total: Utils.conversionNum(double.parse(model.vol)),
        close: Utils.cutZero(double.parse(model.now)),
        number: Utils.conversionNum(double.parse(model.amount)),
        rate: num.parse(model.rate),
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
