/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-17 14:42:09
* @LastEditors: Roy
* @LastEditTime: 2020-10-26 15:43:50
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/widgets/home_widget/market_chart_item.dart
*/
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/home/widgets/small_chart/chart.dart';
import 'package:HBit/utils/screen.dart' as Utils;
import 'package:flutter/material.dart';
import 'package:HBit/pages/home/model/recommend_market_model.dart';
import 'package:HBit/common/i18n/i18n.dart';

class MarketChartItem extends StatelessWidget {
  final int type;

  /// 交易对名称
  final String symbol;

  /// 交易对现价

  final String price;

  /// 交易对开盘价
  final String open;

  /// 交易对涨跌幅
  final double rate;

  /// 交易对周涨跌数据
  final List<ChartData> chartData;
  final int index;
  final double width;
  const MarketChartItem({
    Key key,
    @required this.symbol,
    @required this.price,
    @required this.open,
    @required this.rate,
    @required this.chartData,
    @required this.type,
    this.index,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(rate);
    return Container(
      width: width,
      height: Utils.height(260),
      decoration: BoxDecoration(
          // boxShadow: kDefaultShadow,
          color: kWhite,
          border: Border(
            right: BorderSide(width: index != 2 ? 1 : 0, color: Color(0x80DFDFDF)),
          )
          // borderRadius: BorderRadius.circular(5)
          ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(height: Utils.width(0)),
          Text(
            '$symbol',
            style: TextStyle(fontSize: Utils.sp(22), fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Utils.height(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                price,
                style: TextStyle(
                    letterSpacing: -1.5,
                    color: rate > 0 ? kGreenColor : kRedColor,
                    fontSize: Utils.sp(36),
                    fontWeight: FontWeight.bold),
              ),
              ImageIcon(
                // rate
                AssetImage("images/home/${rate > 0 ? 'zhang' : 'die'}.png"),
                size: Utils.sp(30),
                color: rate > 0 ? kGreenColor : kRedColor,
              )
            ],
          ),
          SizedBox(height: Utils.height(10)),
          Text(
            '${Tr.of(context).homeOpen}:${open.toString()}',
            style: TextStyle(color: kTxtColor, fontSize: Utils.sp(18)),
          ),
          Expanded(
              child: SmallChart(
            type: type,
            chartData: chartData,
            // chartData: [
            //   ChartData(time: 1601452800, close: 2.5793),
            //   ChartData(time: 1601449200, close: 2.5785),
            //   ChartData(time: 1601445600, close: 2.5824),
            //   ChartData(time: 1601442000, close: 2.577),
            //   ChartData(time: 1601438400, close: 2.5857),
            //   ChartData(time: 1601434800, close: 2.5815),
            //   ChartData(time: 1601431200, close: 2.5859),
            // ],
            color: rate > 0 ? kGreenColor : kRedColor,
          ))
        ],
      ),
    );
  }
}

// class ChartData {
//   ChartData({this.time, this.close});
//   final int time;
//   final double close;
// }
