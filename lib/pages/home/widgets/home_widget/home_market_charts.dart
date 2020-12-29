import 'dart:async';

import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/contract/routes/index.dart';
import 'package:HBit/pages/home/model/recommend_market_model.dart';
import 'package:HBit/pages/home/model/recommends_contract_model.dart';
import 'package:HBit/pages/home/provider/index.dart';
import 'package:HBit/pages/trade/routes/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:HBit/common/i18n/i18n.dart';

import 'market_chart_item.dart';

class HomeMarketCharts extends StatefulWidget {
  final double h;
  const HomeMarketCharts({
    Key key,
    @required this.h,
  }) : super(key: key);

  @override
  _HomeMarketChartsState createState() => _HomeMarketChartsState();
}

class _HomeMarketChartsState extends State<HomeMarketCharts> {
  Timer timer;

  void _getDate(HomeProvider model) {
    model.getData();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width(260),
      color: Colors.white,
      padding: EdgeInsets.only(left: width(40), right: width(40)),
      child: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider model, Widget child) {
          return Swiper(
            autoplay: false,
            itemCount: 2,
            autoplayDisableOnInteraction: true,
            autoplayDelay: 5000,
            duration: 1000,
            itemBuilder: (BuildContext context, int index) {
              if (index == 1) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: model.recommendsBibi.isNotEmpty
                      ? model.recommendsBibi.asMap().keys.map(
                          (index) {
                            RecommendMarketModel symbleItem = model.recommendsBibi[index];
                            return GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                timer?.cancel();
                                timer = null;
                                Routers.pushResult(context,
                                    "${TradeRouter.kline}?coinName=${symbleItem.symbol.toString().split('/').join('_')}&coinID=${symbleItem.symbol.toString().split('/').join('_')}&type=trade",
                                    (result) {
                                  _getDate(model);
                                });
                              },
                              child: MarketChartItem(
                                  width: (MediaQuery.of(context).size.width - width(80)) / 3,
                                  symbol: symbleItem.symbol,
                                  price: Utils.cutZero(symbleItem.close),
                                  open: Utils.cutZero(symbleItem.open),
                                  rate: (num.parse(symbleItem.close) - num.parse(symbleItem.open)) /
                                      num.parse(symbleItem.open),
                                  chartData: symbleItem.kline,
                                  type: 0,
                                  index: index),
                            );
                          },
                        ).toList()
                      : [],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: model.recommendsBibi.isNotEmpty
                      ? model.recommendsContracts.sublist(0, 3).asMap().keys.map(
                          (index) {
                            RecommendsContractModel symbleItem = model.recommendsContracts[index];
                            return GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                timer?.cancel();
                                timer = null;
                                Routers.pushResult(context,
                                    "${ContractRouter.kline}?coinName=${symbleItem.symbol.split('/').join('_')}&coinID=${symbleItem.symbol.split('/').join('_')}&type=contract",
                                    (result) {
                                  _getDate(model);
                                });
                              },
                              child: MarketChartItem(
                                width: (MediaQuery.of(context).size.width - width(80)) / 3,
                                symbol: "${symbleItem.symbol.split('_').join('/').toUpperCase()}(${Tr.of(context).homeSustainable})",
                                price: Utils.cutZero(symbleItem.now),
                                open: Utils.cutZero(symbleItem.open),
                                rate: num.parse(symbleItem.rate),
                                chartData: symbleItem.line,
                                type: 1,
                                index: index,
                              ),
                            );
                          },
                        ).toList()
                      : [],
                );
              }
            },
            pagination: SwiperPagination(
                alignment: Alignment(-0, 1.23),
                // alignment: Alignment(-0, 1.65),
                builder: DotSwiperPaginationBuilder(
                  size: width(15),
                  activeSize: width(15),
                  activeColor: kPrimaryColor,
                  color: Color(0xffD2D2D2),
                  space: width(10),
                )),
          );
        },
      ),
    );
  }
}
