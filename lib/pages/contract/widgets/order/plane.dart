import 'dart:async';

import 'package:HBit/common/contract/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/common/wrap/index.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/contract/model/contract_plan_model.dart';
import 'package:HBit/pages/contract/provider/contract_common_provider.dart';
import 'package:HBit/pages/contract/server/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';

class PlaneList extends StatefulWidget {
  const PlaneList({
    Key key,
    this.contractCommonProvider,
  }) : super(key: key);
  final ContractCommonProvider contractCommonProvider;

  @override
  PlaneListState createState() => PlaneListState();
}

class PlaneListState extends State<PlaneList> {
  List<ContractPlanModel> list = [];

  Timer timer;
  @override
  void initState() {
    super.initState();
    if (GlobalConfig.isTimer) {
      timer = Timer.periodic(Duration(seconds: 2), (t) {
        loadPage();
      });
    } else {
      loadPage();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  ///加载数据
  loadPage() async {
    var data = await ContractServer.getOpenPlanOrderNoPage(widget.contractCommonProvider.marketItem.symbol);
    List<ContractPlanModel> list = (data as List).map((e) => ContractPlanModel.fromJson(e)).toList();
    setState(() {
      this.list = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return SliverEmpty(
        text: '${Tr.of(context).contractNoOrders}',
      );
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          ContractPlanModel model = list[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(width: width(1), color: Color(0xffEAEAEA))),
            ),
            width: double.infinity,
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: width(30), vertical: height(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: RichText(
                            text: TextSpan(
                      text: model.markType == 1
                          ? '${Tr.of(context).contractOpenLong}'
                          : model.markType == 2 ? '${Tr.of(context).contractOpenShort}' : model.markType == 3 ? '${Tr.of(context).contractCloseShort}' : model.markType == 4 ? '${Tr.of(context).contractCloseLong}' : '',
                      style: TextStyle(
                          fontSize: sp(30),
                          color: (model.markType == 1 || model.markType == 4) ? kGreenColor : kRedColor),
                      children: [TextSpan(text: '·${Tr.of(context).contractPlanEntrust}', style: TextStyle(fontSize: sp(30), color: kTextColor7))],
                    ))),
                    Expanded(child: textLabel(model.createdAt, sp(24), TextAlign.left, Color(0xff48BE70))),
                    Container(
                      width: width(120),
                      child: InkWell(
                        onTap: () => cancelEntreust(context, () => requestCancelPlan(model)),
                        child: textLabel('${Tr.of(context).TradrRevoke}', sp(30), TextAlign.right, kPrimaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: textLabel('${Tr.of(context).contractTriggerPrice}(USDT)', sp(26), TextAlign.left, kLineColor2)),
                    Expanded(child: textLabel('${Tr.of(context).contractStrikePrice}(USDT)', sp(26), TextAlign.left, kLineColor2)),
                    Expanded(child: textLabel('${Tr.of(context).tradrEntrustAmount}(${Tr.of(context).assetHand})', sp(26), TextAlign.right, kLineColor2)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width(30), vertical: height(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: textLabel('${model.triggerType > 0 ? '>=' : '<='}${Utils.cutZero(model.triggerPrice)}',
                            sp(30), TextAlign.left, kTextColor3)),
                    Expanded(
                        child: textLabel(model.flash == 1 ? '${Tr.of(context).contractBestPrice}' : Utils.cutZero(model.price), sp(30),
                            TextAlign.left, kTextColor3)),
                    Expanded(child: textLabel(model.hand.toString(), sp(30), TextAlign.right, kTextColor3)),
                  ],
                ),
              ),
            ]),
          );
        }, childCount: list.length),
      );
    }
  }

  Widget textLabel(String text, double fontSize, TextAlign textAlign, Color color) {
    return Text(text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
        ),
        textAlign: textAlign);
  }

  Widget myButton(String text, Function onClick) {
    return Container(
      margin: EdgeInsets.only(top: height(30)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(right: BorderSide(width: width(1), color: kLineColor2)),
      ),
      height: height(40),
      child: InkWell(
        onTap: () => onClick(),
        child: textLabel(text, sp(30), TextAlign.center, kPrimaryColor),
      ),
    );
  }

  void requestCancelPlan(ContractPlanModel model) {
    try {
      Toast.showLoading('Loading...');
      ContractServer.requestCancelPlan({"order_sn": model.orderSn}).then((data) {
        Toast.showSuccess('${Tr.of(context).tradrSuccess}');
        loadPage();
      });
    } catch (e) {
      GlobalConfig.errorTips(e);
    }
  }
}
