import 'dart:async';

import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/toast/dialog_util.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/common/wrap/index.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/contract/model/current_house_model.dart';
import 'package:HBit/pages/contract/provider/contract_common_provider.dart';
import 'package:HBit/pages/contract/widgets/market/contract_loss_popup.dart';
import 'package:HBit/pages/contract/widgets/market/contract_surplus_popup.dart';
import 'package:HBit/pages/contract/widgets/market/contract_unwind_popup.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:HBit/pages/contract/server/index.dart';

class CangweiList extends StatefulWidget {
  const CangweiList({
    Key key,
    this.contractCommonProvider,
  }) : super(key: key);
  final ContractCommonProvider contractCommonProvider;

  @override
  CangweiListState createState() => CangweiListState();
}

class CangweiListState extends State<CangweiList> with AutomaticKeepAliveClientMixin {
  List<CurrentHouseModel> list = [];
  Timer timer;
  @override
  bool get wantKeepAlive => true;
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
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  ///加载数据
  loadPage() async {
    var data = await ContractServer.getPosition(widget.contractCommonProvider.marketItem.symbol);
    List<CurrentHouseModel> list = (data as List).map((e) => CurrentHouseModel.fromJson(e)).toList();
    setState(() {
      this.list = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (list.isEmpty) {
      return SliverEmpty(
        text: '${Tr.of(context).contractNoOrder}',
      );
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          CurrentHouseModel model = list[index];
          double huibao = double.parse(Utils.formatNum(
              ((double.parse(model.hasProfit.toString()) + double.parse(model.futureProfit.toString())) /
                  double.parse(model.bond) *
                  100),
              pos: 2));
          return Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: height(20)),
            width: double.infinity,
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: width(30), vertical: height(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: width(50),
                      height: height(50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(width(10))),
                        color: (model.markType == 1 || model.markType == 4) ? Color(0xff48BE70) : kRedColor,
                      ),
                      child: textLabel(
                        model.markType == 1
                            ? '${Tr.of(context).contractBull}'
                            : model.markType == 2 ? '${Tr.of(context).contractBear}' : model.markType == 3 ? '${Tr.of(context).contractBear}' : model.markType == 4 ? '${Tr.of(context).contractBull}' : '',
                        sp(30),
                        TextAlign.center,
                        Colors.white,
                      ),
                    ),
                    SizedBox(width: width(20)),
                    textLabel('${model.multiple.toString()}X', sp(30), TextAlign.left,
                        (model.markType == 1 || model.markType == 4) ? Color(0xff48BE70) : kRedColor),
                    SizedBox(width: width(20)),
                    textLabel(model.symbol.replaceAll('_', '/').toUpperCase(), sp(30), TextAlign.left, kTextColor3),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    textLabel('${Tr.of(context).contractProfit2}(USDT)', sp(30), TextAlign.left, kLineColor2),
                    textLabel('${Tr.of(context).contractNoProfit}(USDT)', sp(30), TextAlign.right, kLineColor2),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    textLabel(Utils.cutZero(model.hasProfit.toString()), sp(30), TextAlign.left, kTextColor3),
                    textLabel(Utils.cutZero(model.futureProfit.toString()), sp(30), TextAlign.right, kTextColor3),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width(30), vertical: height(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: textLabel('${Tr.of(context).klineHold}(${Tr.of(context).assetHand})', sp(30), TextAlign.left, kLineColor2),
                    ),
                    Expanded(
                      child: textLabel('${Tr.of(context).contractAverageOpenPrice}', sp(30), TextAlign.center, kLineColor2),
                    ),
                    Expanded(
                      child: textLabel('${Tr.of(context).contractRateOfReturn}', sp(30), TextAlign.right, kLineColor2),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: textLabel(model.totalHand.toString(), sp(30), TextAlign.left, kTextColor3),
                    ),
                    Expanded(
                      child: textLabel(Utils.formatNum(model.openPrice, pos: 6), sp(30), TextAlign.center, kTextColor3),
                    ),
                    Expanded(
                      child: textLabel(
                          huibao.toString() + '%', sp(30), TextAlign.right, huibao > 0 ? kGreenColor : kRedColor),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width(30), vertical: height(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: textLabel('${Tr.of(context).contractCanSell}(${Tr.of(context).assetHand})', sp(30), TextAlign.left, kLineColor2),
                    ),
                    Expanded(
                      child: textLabel('${Tr.of(context).contractForecastStopPrice}', sp(30), TextAlign.center, kLineColor2),
                    ),
                    Expanded(
                      child: textLabel('${Tr.of(context).contractMargin}(USDT)', sp(30), TextAlign.right, kLineColor2),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: textLabel(model.leftHand.toString(), sp(30), TextAlign.left, kTextColor3),
                    ),
                    Expanded(
                      child: textLabel(Utils.formatNum(model.failPrice, pos: 6), sp(30), TextAlign.center, kTextColor3),
                    ),
                    Expanded(
                      child: textLabel(Utils.cutZero(model.bond), sp(30), TextAlign.right, kTextColor3),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height(30)),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(width: height(1), color: kLineColor2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: myButton('${Tr.of(context).contractClose2}', () => unWindClick(model)),
                    ),
                    Expanded(
                      child: myButton('${Tr.of(context).contractStoProfit}', () => surplusClick(model)),
                    ),
                    Expanded(
                      child: myButton('${Tr.of(context).contractStopLoss}', () => stopLossClick(model)),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: height(30)),
                        alignment: Alignment.center,
                        height: height(40),
                        child: InkWell(
                          onTap: () => shareImage(model),
                          child: Image.asset('images/contract/share.png'),
                        ),
                      ),
                    ),
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

  /*
  平仓
   */
  void unWindClick(CurrentHouseModel model) {
    showBottomInBottomDialog(
        context,
        UnwindPopupView(
          model: model,
          onSelect: (e) {
            loadPage();
          },
        ));
  }

  /*
  止损
   */
  void stopLossClick(CurrentHouseModel model) {
    // Toast.showText('暂未开放');
    showBottomInBottomDialog(
        context,
        LossPopupView(
          model: model,
          onSelect: (e) {},
        ));
  }

  /*
  止盈
   */
  void surplusClick(CurrentHouseModel model) {
    // Toast.showText('暂未开放');
    showBottomInBottomDialog(
        context,
        CheckSurplusView(
          model: model,
          onSelect: (e) {},
        ));
  }

  void shareImage(CurrentHouseModel model) {
    Toast.showText('${Tr.of(context).contractNotOpen}');
    // showContainerDialog(
    //   context,
    //   ShareImagepopup(),
    // );
  }
}
