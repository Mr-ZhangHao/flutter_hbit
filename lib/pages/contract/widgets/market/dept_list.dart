/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-24 16:50:56
* @LastEditors: Roy
* @LastEditTime: 2020-09-27 18:10:52
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/widgets/market/dept_list.dart
*/
import 'dart:async';

import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/pages/contract/provider/contract_provider.dart';
import 'package:HBit/pages/contract/widgets/market/dept_list_left.dart';
import 'package:HBit/pages/contract/widgets/market/dept_list_right.dart';
import 'package:HBit/providers/provider_widget.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_k_chart/entity/k_line_entity.dart';
import 'package:flutter_k_chart/flutter_k_chart.dart';
import 'package:flutter_k_chart/k_chart_widget.dart';

class DeptList extends StatefulWidget {
  final String coinName;
  const DeptList({Key key, this.coinName}) : super(key: key);
  @override
  _DeptListState createState() => _DeptListState();
}

class _DeptListState extends State<DeptList> {
  Timer timer;

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ContractOrderProvider>(
        model: ContractOrderProvider(),
        onModelReady: (model) {
          if (GlobalConfig.isTimer) {
            timer = Timer.periodic(Duration(seconds: 2), (timer) {
              model.klineLoadDepth(widget.coinName);
            });
          } else {
            model.klineLoadDepth(widget.coinName);
          }
        },
        builder: (context, model, child) {
          return Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                _headerView(),
                //深度图使用
                Visibility(
                  visible: model.asksList.length > 0 || model.bidsList.length > 0,
                  child: Container(
                    height: height(430),
                    color: Color(0xff050E2F),
                    width: double.infinity,
                    child: DepthChart(model.bidsList, model.asksList),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: DeptListLeft(list: model.klineBuys),
                    ),
                    Expanded(
                      child: DeptListRight(list: model.klineSells),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  Widget _headerView() {
    List coinList = widget.coinName.split('_');
    return Container(
      height: height(90),
      color: Color(0xff050E2F),
      padding: EdgeInsets.symmetric(horizontal: width(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              '${Tr.of(context).tradrBuyOrder} ${Tr.of(context).TradrQuantity}(${coinList.first.toString().toUpperCase()})',
              style: TextStyle(color: Color(0xff6374A3), fontSize: sp(24)),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Text(
              '${Tr.of(context).tradrPrice}(${coinList.last.toString().toUpperCase()})',
              style: TextStyle(color: Color(0xff6374A3), fontSize: sp(24)),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              '${Tr.of(context).TradrQuantity}(${coinList.first.toString().toUpperCase()})${Tr.of(context).tradrSellOrder}',
              style: TextStyle(color: Color(0xff6374A3), fontSize: sp(24)),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
