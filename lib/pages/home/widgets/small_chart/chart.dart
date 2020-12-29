/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-17 14:24:32
* @LastEditors: Jack
* @LastEditTime: 2020-08-17 14:38:06
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/widgets/small_chart/chart.dart
*/
import 'dart:async';

import 'package:HBit/pages/home/model/recommend_market_model.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SmallChart extends StatefulWidget {
  final int type;
  final Color color;
  final List<ChartData> chartData;
  SmallChart({Key key, @required this.color, @required this.chartData, this.type}) : super(key: key);

  @override
  _SmallChartState createState() => _SmallChartState();
}

Timer timer;

class _SmallChartState extends State<SmallChart> {
  @override
  Widget build(BuildContext context) {
    return getHorizantalGradientAreaChart();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  updateData(Timer timer) {
    if (mounted) {
      print('更新数据');
    }
  }

  /// Return the circular chart with horizontal gradient.
  SfCartesianChart getHorizantalGradientAreaChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        isVisible: false,
        labelPlacement: LabelPlacement.onTicks, // 显示方式
        labelRotation: 0, // 旋转的角度
        majorGridLines: MajorGridLines(width: 1), // 距离右边图表位置距离
      ),
      tooltipBehavior: TooltipBehavior(
        enable: false, // 是否开启toolTip
        canShowMarker: true, // 是否显示标记
        elevation: 0,
        header: '', // toolTip 头部显示文字数据等等
      ),
      primaryYAxis: NumericAxis(
        isVisible: false,
        // interval: 0.01, // 刻度单位
        // minimum: 2.577, // 最小值
        // maximum: 2.5859, // 最大值
        // labelFormat: '{value}%', // 格式化显示值
        // axisLine: AxisLine(width: 0), // 线条宽度
        // majorTickLines: MajorTickLines(size: 0), // 距离右边图表位置距离
      ),
      series: getGradientAreaSeries(), // 图表数据显示
    );
  }

  /// Returns the list of spline area series with horizontal gradient.
  List<ChartSeries<ChartData, String>> getGradientAreaSeries() {
    final List<Color> lineColor = <Color>[widget.color, widget.color];
    final List<Color> areaColor = <Color>[Color(0xffFFFFFF), widget.color];

    final List<double> stops = <double>[0.2, 1.0];

    return <ChartSeries<ChartData, String>>[
      SplineAreaSeries<ChartData, String>(
          opacity: 0.8,
          isVisible: true,
          dataLabelSettings: DataLabelSettings(isVisible: false),
          markerSettings: MarkerSettings(isVisible: false),

          /// To set the gradient colors for border here.
          borderGradient:
              LinearGradient(colors: lineColor, stops: stops, begin: Alignment.bottomCenter, end: Alignment.topCenter),

          /// To set the gradient colors for series.
          gradient:
              LinearGradient(colors: areaColor, stops: stops, begin: Alignment.bottomCenter, end: Alignment.topCenter),
          borderWidth: 1,
          borderDrawMode: BorderDrawMode.top,
          dataSource: widget.chartData,
          // xValueMapper: (ChartData sales, _) => DateTime.fromMillisecondsSinceEpoch(sales.time * 1000).day.toString(),
          xValueMapper: (ChartData sales, _) => sales.time.toString(),
          yValueMapper: (ChartData sales, _) => num.parse(sales.close.toString()))
    ];
  }
}

// class ChartData {
//   ChartData({this.time, this.close});
//   final int time;
//   final double close;
// }
