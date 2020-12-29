/*
 * @Description: 
 * @Author: zhaojijin
* @LastEditors: Roy
 * @Date: 2019-04-22 18:55:06
* @LastEditTime: 2020-05-26 11:49:36
 */

import 'package:flutter/material.dart';
import 'package:HBit/common/Kline/packages/bloc/klineBloc.dart';
import 'package:HBit/common/Kline/packages/bloc/klineBlocProvider.dart';
import 'package:HBit/common/Kline/packages/model/klineConstrants.dart';
import 'package:HBit/common/Kline/packages/model/klineModel.dart';

class KlineCandleInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> _list = ['时间', '开', '高', '低', '收', '涨跌额', '涨跌幅', '成交量'];
    KlineBloc bloc = KlineBlocProvider.of<KlineBloc>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double width = kCandleInfoWidth;
    double height = kCandleInfoHeight;
    double rightLeftMargin = screenWidth - width - kCandleInfoLeftMargin;
    double rowTotalHeight =
        height - kCandleInfoPadding.top - kCandleInfoPadding.bottom;
    double rowHeight = (rowTotalHeight / _list.length);

    return StreamBuilder(
      stream: bloc.klineMarketStream,
      builder: (BuildContext context, AsyncSnapshot<Market> snapshot) {
        Market market = snapshot.data;
        double originY = market?.candleWidgetOriginY;
        Container _candleInfoWidget() {
          return Container(
            width: width,
            height: height,
            margin: (market.offset.dx > screenWidth / 2)
                ? EdgeInsets.only(
                    top: kCandleInfoTopMargin + originY,
                    left: kCandleInfoLeftMargin)
                : EdgeInsets.only(
                    top: kCandleInfoTopMargin + originY, left: rightLeftMargin),
            decoration: BoxDecoration(
                border: Border.all(
                    color: kCandleInfoBorderColor,
                    width: kCandleInfoBorderWidth),
                color: kCandleInfoBgColor),
            child: ListView.builder(
              padding: kCandleInfoPadding,
              itemCount: _list.length,
              itemBuilder: (BuildContext context, int index) {
                List<String> marketInfoList = market?.candleInfo();
                return Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: rowHeight,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${_list[index]}',
                          style: TextStyle(
                              color: kCandleInfoTextColor,
                              fontSize: kCandleInfoLeftFontSize),
                        ),
                      ),
                      Container(
                        height: rowHeight,
                        alignment: Alignment.centerRight,
                        child: marketInfoList == null
                            ? Text('')
                            : Text(
                                '${marketInfoList[index]}',
                                style: TextStyle(
                                    color: _list[index].contains('涨')
                                        ? marketInfoList[index].contains('+')
                                            ? kIncreaseColor
                                            : kDecreaseColor
                                        : kCandleInfoTextColor,
                                    fontSize: kCandleInfoRightFontSize),
                              ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }

        return market == null
            ? Container()
            : (market.isShowCandleInfo ? _candleInfoWidget() : Container());
      },
    );
  }
}
