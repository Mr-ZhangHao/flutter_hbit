/*
 *当前计划 
 */
import 'dart:async';

import 'package:HBit/common/contract/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/refresh/page_list.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/contract/model/contract_plan_model.dart';
import 'package:HBit/pages/contract/provider/contract_common_provider.dart';
import 'package:HBit/pages/contract/server/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContractPlanList extends PageList {
  final ContractCommonProvider model;
  final String coinName;
  final Function reloadData;
  ContractPlanList({Key key, this.model, this.reloadData, this.coinName}) : super(key: key);

  @override
  ContractPlanListState createState() => ContractPlanListState();
}

class ContractPlanListState extends PageListState<ContractPlanModel, ContractPlanList> {
  int selectType = 0;

  Timer timer;
  String symbolStr = '';
  @override
  void initState() {
    super.initState();
    loadData(1);
  }

  childFunction() {
    print('this is a childFunction');
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  /// 更新用户状态
  void updateState(fn) {
    if (mounted) {
      setState(fn);
    }
  }

  ///加载数据
  @override
  loadPage({int page, Function(List<ContractPlanModel>) onSuccess, Function onErr}) async {
    ContractCommonProvider model = Provider.of<ContractCommonProvider>(context, listen: false);
    var data = await ContractServer.getOpenPlanOrder(model.symbole, page);
    if (data['list']['data'].isNotEmpty) {
      onSuccess((data['list']['data'] as List).map((e) => ContractPlanModel.fromJson(e)).toList());
    } else {
      onSuccess([]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          // Container(
          //   height: height(50),
          //   margin: EdgeInsets.symmetric(
          //       horizontal: width(30), vertical: height(20)),
          //   child: Row(
          //     children: <Widget>[
          //       Container(
          //         width: width(120),
          //         child: SmallButton(
          //           text: '止盈止损',
          //           color:Color(0xffF8FCFF),
          //           isBorder: true,
          //           fontSize: sp(20),
          //           textColor: selectType==0?Color(0xff126DFF):Color(0xffC9C9C9),
          //           height: height(40),
          //           borderColor: selectType==0?Color(0xff126DFF):Color(0xffC9C9C9),
          //           borderRadius: BorderRadius.all(Radius.circular(height(5))),
          //           onPressed: () {
          //             setState(() {
          //               selectType = 0;
          //             });
          //           },
          //         ),
          //       ),
          //       SizedBox(width: width(20)),
          //       Container(
          //         width: width(120),
          //         child: SmallButton(
          //           text: '计划委托',
          //           color: Color(0xffF8FCFF),
          //           isBorder: true,
          //           fontSize: sp(20),
          //           textColor: selectType==1?Color(0xff126DFF):Color(0xffC9C9C9),
          //           height: height(40),
          //           borderColor: selectType==1?Color(0xff126DFF):Color(0xffC9C9C9),
          //           borderRadius: BorderRadius.all(Radius.circular(height(5))),
          //           onPressed: () {
          //              setState(() {
          //               selectType = 1;
          //             });
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: buildList(context),
          )
        ],
      ),
    );
  }

  @override
  buildItem(ContractPlanModel model) {
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
                    fontSize: sp(30), color: (model.markType == 1 || model.markType == 4) ? kGreenColor : kRedColor),
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
              Expanded(child: textLabel('${Tr.of(context).TradrVolume}(${Tr.of(context).assetHand})', sp(26), TextAlign.right, kLineColor2)),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width(30), vertical: height(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: textLabel('>=${Utils.cutZero(model.triggerPrice)}', sp(30), TextAlign.left, kTextColor3)),
              Expanded(
                  child: textLabel(
                      model.flash == 1 ? '${Tr.of(context).contractBestPrice}' : Utils.cutZero(model.price), sp(30), TextAlign.left, kTextColor3)),
              Expanded(child: textLabel(model.hand.toString(), sp(30), TextAlign.right, kTextColor3)),
            ],
          ),
        ),
      ]),
    );
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

  @override
  empty() {
    return Center(
      child: Image.asset(
        'images/contract/no_record.png',
        width: width(230),
        height: width(230),
        fit: BoxFit.contain,
      ),
    );
  }

  void requestCancelPlan(ContractPlanModel model) {
    try {
      Toast.showLoading('Loading...');
      ContractServer.requestCancelPlan({"order_sn": model.orderSn}).then((data) {
        Toast.showSuccess('${Tr.of(context).tradrSuccess}');
        loadData(1);
        (widget as ContractPlanList).reloadData();
      });
    } catch (e) {
      GlobalConfig.errorTips(e);
    }
  }
}
