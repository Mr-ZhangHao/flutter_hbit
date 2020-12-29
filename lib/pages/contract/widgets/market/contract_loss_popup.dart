/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-19 17:58:05
* @LastEditors: Roy
* @LastEditTime: 2020-09-07 18:22:28
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/widgets/market/contract_surplus_popup.dart
*/
import 'dart:async';
import 'dart:math';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/pages/contract/model/current_house_model.dart';
import 'package:HBit/pages/contract/server/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/button/index.dart';
import '../../../../constants/index.dart';
import '../../../../utils/screen.dart';

class LossPopupView extends StatefulWidget {
  LossPopupView({Key key, this.onSelect, this.model}) : super(key: key);
  final Function onSelect;
  final CurrentHouseModel model;
  @override
  _LossPopupViewState createState() => _LossPopupViewState();
}

class _LossPopupViewState extends State<LossPopupView> {
  String numHand = '25';
  String close = '--';
  num earnings = 0;
  Timer timer;
  final numberCtr = TextEditingController();
  final FocusNode numberFocus = FocusNode();

  final priceCtr = TextEditingController();
  final FocusNode priceFocus = FocusNode();

  String number;
  String price;

  @override
  void initState() {
    // 开多时: 止损 = （开仓均价-填入价格）* 手数 * hand_num
    // 开空时: 止损 = （填入价格 - 开仓均价）* 手数 * hand_num
    // 填入价格判断：
    // 开多时： 止损-填入价格 必须小于开仓均价
    // 开空时： 止损-填入价格必须大于开仓均价
    numberCtr.addListener(() {
      print(numberCtr.text);
      if (num.parse(numberCtr.text) > widget.model.totalHand) {
        Toast.showText('${Tr.of(context).contractMaximumProfit}${Utils.cutZero(widget.model.totalHand)}');
        setState(() {
          number = numberCtr.text;
          getEarnings();
        });
      } else if (num.parse(numberCtr.text) < 0 || numberCtr.text == '') {
        setState(() {
          numberCtr.text = '0';
          number = numberCtr.text;
          getEarnings();
        });
      } else {
        setState(() {
          number = numberCtr.text;
          getEarnings();
        });
      }
    });
// 开多时: 止损 = （开仓均价-填入价格）* 手数 * hand_num
// 开空时: 止损 = （填入价格 - 开仓均价）* 手数 * hand_num
// 填入价格判断：
// 开多时： 止损-填入价格 必须小于开仓均价
// 开空时： 止损-填入价格必须大于开仓均价
    priceCtr.addListener(() {
      print(priceCtr.text);
      // 开多 止损-  填入价格 必须小于开仓均价
      if (widget.model.markType == 1) {
        if (num.parse(priceCtr.text) > num.parse(widget.model.openPrice)) {
          Toast.showText('${Tr.of(context).contractXY}${Utils.cutZero(widget.model.openPrice)}');
          setState(() {
            price = priceCtr.text;
            getEarnings();
          });
        } else if (num.parse(priceCtr.text) < 0) {
          setState(() {
            priceCtr.text = '0';
            price = priceCtr.text;
            getEarnings();
          });
        } else {
          setState(() {
            price = priceCtr.text;
            getEarnings();
          });
        }
      } else {
        // 开多时: 止损 = （开仓均价-填入价格）* 手数 * hand_num
        // 开空时: 止损 = （填入价格 - 开仓均价）* 手数 * hand_num
        // 填入价格判断：
        // 开多时： 止损-填入价格 必须小于开仓均价
        // 开空时： 止损-填入价格必须大于开仓均价

        // 开空  止损-填入价格必须大于开仓均价
        if (num.parse(priceCtr.text) < num.parse(widget.model.openPrice)) {
          Toast.showText('${Tr.of(context).contractYX}${Utils.cutZero(widget.model.openPrice)}');
          setState(() {
            getEarnings();
            price = priceCtr.text;
          });
        } else if (num.parse(priceCtr.text) < 0) {
          setState(() {
            getEarnings();
            price = priceCtr.text;
          });
        } else {
          setState(() {
            getEarnings();
            price = priceCtr.text;
          });
        }
      }
    });
    if (GlobalConfig.isTimer) {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        this.getLastPrice();
      });
    } else {
      this.getLastPrice();
    }
    super.initState();
  }

// 开多时: 止损 = （开仓均价-填入价格）* 手数 * hand_num
// 开空时: 止损 = （填入价格 - 开仓均价）* 手数 * hand_num
// 填入价格判断：
// 开多时： 止损-填入价格 必须小于开仓均价
// 开空时： 止损-填入价格必须大于开仓均价
  getEarnings() {
    // 开多时
    if (widget.model.markType == 1) {
      earnings = (num.parse(widget.model.openPrice) - num.parse(priceCtr.text ?? '0')) *
          num.parse(numberCtr.text) *
          num.parse(widget.model.handNum);
    } else {
      // 开空时
      earnings = (num.parse(priceCtr.text ?? '0') - num.parse(widget.model.openPrice)) *
          num.parse(numberCtr.text) *
          num.parse(widget.model.handNum);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  getLastPrice() async {
    var response = await ContractServer.getLastKline(widget.model.symbol);
    print("最新价格：：：：$response");
    setState(() {
      close = response['data'][0]['close'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Material(
        //创建透明层
        type: MaterialType.transparency, //透明类型
        child: Container(
          height: height(790),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: width(45), vertical: height(40)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(width(2)), topRight: Radius.circular(width(2))),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                  RichText(
                      text: TextSpan(
                    text: '${widget.model.symbol.replaceAll('_', '/').toUpperCase()}·',
                    style: TextStyle(fontSize: sp(30), color: kTextColor3, fontWeight: FontWeight.bold),
                    children: [TextSpan(text: '${Tr.of(context).contractStopLoss}', style: TextStyle(fontSize: sp(30), color: kRedColor))],
                  )),
                  InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Text(
                        "${Tr.of(context).contractClose}",
                        style: TextStyle(color: Color(0xff9BAECA), fontWeight: FontWeight.bold, fontSize: sp(30)),
                      )),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: height(40)),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                      text: '${Tr.of(context).contractCurrentPrice}',
                      style: TextStyle(
                        fontSize: sp(28),
                        color: Color(0xffCDCDCD),
                      ),
                      children: [
                        TextSpan(
                            text: ' \$ $close',
                            style: TextStyle(fontSize: sp(28), fontWeight: FontWeight.bold, color: kTextColor3))
                      ],
                    )),
                  ),
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                      text: '${Tr.of(context).contractAverageOpenPrice}',
                      style: TextStyle(
                        fontSize: sp(28),
                        color: Color(0xffCDCDCD),
                      ),
                      children: [
                        TextSpan(
                            text: ' \$ ${widget.model.openPrice}',
                            style: TextStyle(fontSize: sp(28), fontWeight: FontWeight.bold, color: kTextColor3))
                      ],
                    )),
                  ),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: height(30)),
                child: Row(
                  children: <Widget>[
                    Text('${Tr.of(context).contractStopPrice}',
                        style: TextStyle(
                          color: Color(0xff707070),
                          fontSize: sp(28),
                          fontWeight: FontWeight.bold,
                        )),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: width(20)),
                        padding: EdgeInsets.symmetric(horizontal: width(10)),
                        height: height(90),
                        decoration: BoxDecoration(
                          border: Border.all(width: height(2), color: Color(0xffEAEAEA)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '≤',
                              style: TextStyle(color: Color(0xff323232), fontSize: sp(28)),
                            ),
                            Expanded(
                              child: FocusWidget(
                                focusNode: priceFocus,
                                child: InputWidget(
                                  obscureText: false,
                                  contentPadding: EdgeInsets.only(left: width(10), bottom: height(30)),
                                  controller: priceCtr,
                                  focusNode: priceFocus,
                                  hintText: '${Tr.of(context).TradrPriceHint}',
                                  maxHeight: 60,
                                  border:
                                      UnderlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent)),
                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                  // suffixStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Text(
                              'USDT',
                              style: TextStyle(color: Color(0xffCDCDCD), fontWeight: FontWeight.bold, fontSize: sp(28)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height(30)),
                child: Row(
                  children: <Widget>[
                    Text('${Tr.of(context).contractStopNumber}',
                        style: TextStyle(
                          color: Color(0xff707070),
                          fontSize: sp(28),
                          fontWeight: FontWeight.bold,
                        )),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: width(20)),
                        padding: EdgeInsets.symmetric(horizontal: width(10)),
                        height: height(90),
                        decoration: BoxDecoration(
                          border: Border.all(width: height(2), color: Color(0xffEAEAEA)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: FocusWidget(
                                focusNode: numberFocus,
                                child: InputWidget(
                                  obscureText: false,
                                  contentPadding: EdgeInsets.only(left: width(10), bottom: height(30)),
                                  controller: numberCtr,
                                  focusNode: numberFocus,
                                  hintText: '${Tr.of(context).contractStopLoss}${widget.model.totalHand}(${Tr.of(context).contractSingleLargest}1000)',
                                  maxHeight: 60,
                                  border:
                                      UnderlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent)),
                                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                                  // suffixStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Text(
                              '${Tr.of(context).assetHand}',
                              style: TextStyle(color: Color(0xffCDCDCD), fontWeight: FontWeight.bold, fontSize: sp(28)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: height(20)),
              PercentageButton(
                numInput: numHand,
                onSelect: (e) {
                  print(widget.model);
                  num handNum = (widget.model.totalHand * (e['id'] / 100)).round();
                  print('${Tr.of(context).contractStopNumber}：：：：$handNum');
                  setState(() {
                    numHand = e['id'].toString();
                    numberCtr.text = handNum.toString();
                  });
                },
              ),
              Container(
                margin: EdgeInsets.only(top: height(20)),
                child: RichText(
                    text: TextSpan(
                  text: '${Tr.of(context).contractMarketPrice} ',
                  style: TextStyle(
                    fontSize: sp(28),
                    color: Color(0xffBABABA),
                  ),
                  children: [
                    TextSpan(
                      text: '≤${price ?? '0.0'}USDT',
                      style: TextStyle(fontSize: sp(28), fontWeight: FontWeight.bold, color: kPrimaryColor),
                      children: [
                        TextSpan(
                          text: '${Tr.of(context).contractBestPriceHint}',
                          style: TextStyle(
                            fontSize: sp(28),
                            fontWeight: FontWeight.bold,
                            color: Color(0xffBABABA),
                          ),
                          children: [
                            TextSpan(
                              text: '${number ?? '0'}${Tr.of(context).assetHand},',
                              style: TextStyle(
                                fontSize: sp(28),
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                              children: [
                                TextSpan(
                                  text: '${Tr.of(context).contractExpectedReturn}：',
                                  style: TextStyle(
                                    fontSize: sp(28),
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffBABABA),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${earnings}USDT',
                                      style: TextStyle(
                                        fontSize: sp(28),
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: height(40)),
                width: double.infinity,
                child: SmallButton(
                  color: (price != null && price != '') && (number != null && number != '')
                      ? Color(0xff126DFF)
                      : Color(0x7f126DFF),
                  isBorder: false,
                  fontSize: sp(30),
                  textColor: kTextColorF2,
                  height: height(90),
                  borderRadius: BorderRadius.all(Radius.circular(height(45))),
                  text: '${Tr.of(context).Confirm}',
                  onPressed: () {
                    if ((price != null && price != '') && (number != null && number != '')) {
                      this.contractWin();
                    } else {
                      return;
                    }
                  }, // 可传参到父组件
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  contractWin() async {
    Toast.showLoading('loading');
    try {
      await ContractServer.contractWin(widget.model.positionId.toString(), price, number, '2');
      Toast.close();
      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
  }
}

class PercentageButton extends StatefulWidget {
  PercentageButton({Key key, this.onSelect, this.numInput}) : super(key: key);
  final Function onSelect;
  final String numInput;
  @override
  _PercentageButtonState createState() => _PercentageButtonState();
}

class _PercentageButtonState extends State<PercentageButton> {
  List<dynamic> list = [
    {"id": 25, "num": "25%"},
    {"id": 50, "num": "50%"},
    {"id": 75, "num": "75%"},
    {"id": 100, "num": "100%"}
  ];

  /// 当前选中的百分比
  num _currentHand = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: list
          .asMap()
          .keys
          .map(
            (index) => Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(height(30))),
                  color: widget.numInput == list[index]['id'].toString() ? Color(0xff126DFF) : Color(0xffF5F5F5),
                  // image: DecorationImage(
                  //     image: widget.numInput == list[index]['id'].toString()
                  //         ? AssetImage('images/contract/hand.png')
                  //         : AssetImage('images/contract/hand_gray.png'),
                  //     fit: BoxFit.fill),
                ),
                margin: EdgeInsets.only(right: width(10)),
                child: SmallButton(
                  color: kTransprant,
                  isBorder: false,
                  borderColor: kTransprant,
                  borderWidth: width(0),
                  fontSize: sp(24),
                  textColor: widget.numInput == list[index]['id'].toString() ? Color(0xffffffff) : kTextColor9,
                  height: height(60),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  text: list[index]['num'],
                  onPressed: () => _itemClick(index),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  _itemClick(index) {
    setState(() => _currentHand = index);
    widget.onSelect(list[index]);
  }
}
