/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-18 18:02:09
* @LastEditors: Roy
* @LastEditTime: 2020-09-15 18:08:59
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/widgets/market/contract_drawer.dart
*/
import 'dart:async';

import 'package:HBit/common/drawer/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/pages/contract/model/cmarket_model.dart';
import 'package:HBit/pages/contract/provider/contract_common_provider.dart';
import 'package:HBit/pages/contract/provider/contract_provider.dart';
import 'package:HBit/providers/provider_widget.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/index.dart';
import '../../../../routes/fluro_navigator.dart';

class ContractDrawer extends StatefulWidget {
  const ContractDrawer({
    Key key,
    this.onTab,
  }) : super(key: key);
  final ValueChanged<String> onTab;

  @override
  _ContractDrawerState createState() => _ContractDrawerState();
}

class _ContractDrawerState extends State<ContractDrawer> with SingleTickerProviderStateMixin {
  Timer timer;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'USDT${Tr.of(context).contractContractList}',
            style: TextStyle(fontSize: sp(32), fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          leading: IconButton(
            icon: ImageIcon(AssetImage('images/trade/cb.png'), size: sp(44)),
            onPressed: () => Routers.goBack(context),
          ),
        ),
        body: ProviderWidget<ContractCommonProvider>(
            model: ContractCommonProvider(),
            onModelReady: (model) async {
              if (GlobalConfig.isTimer) {
                timer = Timer.periodic(Duration(seconds: 2), (timer) {
                  model.loadData();
                });
              } else {
                model.loadData();
              }
            },
            builder: (BuildContext context, ContractCommonProvider model, Widget child) {
              return Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: CoinListWidget(
                        dataSource: model.marketList,
                        onTab: (item) => _selectAction(item),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  void _selectAction(item) async {
    Provider.of<ContractCommonProvider>(context, listen: false).setMarketItem(item);

    // await SpUtils.sp.setString("csymbol", item.symbol);
    // Provider.of<ContractProvider>(context,listen: false).loadData(pageNum: 1);
    // Provider.of<ContractProvider>(context,listen: false).initData();
    Provider.of<ContractOrderProvider>(context, listen: false).requestMarketDetail(item.symbol);
    Provider.of<ContractOrderProvider>(context, listen: false).loadDepth(item.symbol);
    Provider.of<ContractCommonProvider>(context, listen: false).getBalance(item.symbol);

    widget.onTab(item.symbol);
    Routers.goBack(context);
  }
}

class CoinListWidget extends StatelessWidget {
  const CoinListWidget({
    Key key,
    @required this.dataSource,
    this.onTab,
  }) : super(key: key);
  final List dataSource;
  final Function(CMarketModel item) onTab;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        CMarketModel model = dataSource[index];
        return Container(
          height: height(100),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: width(44)),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onTab(model),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(model?.symbol?.replaceAll("_", "/")?.toUpperCase() ?? '--/--',
                        textAlign: TextAlign.left, style: TextStyle(fontSize: sp(26))),
                  ),
                  Expanded(
                    child: Text(Utils.cutZero(model?.now ?? 0.00),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kGreenColor, fontSize: sp(26))),
                  ),
                  Expanded(
                    child: Text(double.parse(model?.rate ?? '0.00') >= 0 ? '+${model.rate}%' : '${model.rate}%',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: double.parse(model?.rate ?? '0.00') >= 0 ? kGreenColor : kRedColor,
                            fontSize: sp(26))),
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
