/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-15 12:13:26
* @LastEditors: Jack
* @LastEditTime: 2020-08-15 20:12:01
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/widgets/point_line_charts.dart
*/
import 'package:HBit/constants/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PointLineChart extends StatelessWidget {
  const PointLineChart({Key key, this.dataSource}) : super(key: key);
  final List<SalesData> dataSource;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      // Enable legend
      legend: Legend(isVisible: false),
      // Enable tooltip
      tooltipBehavior: TooltipBehavior(
          enable: true,
          elevation: 0,
          header: '',
          borderColor: kDividerColor,
          canShowMarker: true,
          textStyle: TextStyle(color: Colors.white, fontSize: sp(22)),
          color: kBgColor),
      series: <ChartSeries<SalesData, String>>[
        LineSeries<SalesData, String>(
            dataSource: dataSource,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            //显示数据标签
            dataLabelSettings: DataLabelSettings(isVisible: true),
            color: kPrimaryColor,
            markerSettings:
                MarkerSettings(isVisible: true, color: kPrimaryColor))
      ],
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
