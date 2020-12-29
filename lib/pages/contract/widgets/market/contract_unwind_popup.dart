/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-19 17:58:05
* @LastEditors: Roy
* @LastEditTime: 2020-09-27 18:43:42
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/widgets/market/contract_unwind_popup.dart
*/
import 'package:HBit/common/contract/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/pages/contract/model/current_house_model.dart';
import 'package:HBit/pages/contract/server/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/button/index.dart';
import '../../../../constants/index.dart';
import '../../../../utils/screen.dart';

class UnwindPopupView extends StatefulWidget {
  UnwindPopupView({Key key, this.onSelect, this.model}) : super(key: key);
  final Function onSelect;
  final CurrentHouseModel model;
  @override
  _UnwindPopupViewState createState() => _UnwindPopupViewState();
}

class _UnwindPopupViewState extends State<UnwindPopupView> {
  String numHand = '0';

  int selectType = 0;

  final numberCtr = TextEditingController();
  final FocusNode numberFocus = FocusNode();

  final priceCtr = TextEditingController();
  final FocusNode priceFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Material(
        //创建透明层
        type: MaterialType.transparency, //透明类型
        child: Container(
          height: height(730),
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
                child: Stack(children: <Widget>[
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                        widget.model.markType == 1
                            ? '${Tr.of(context).contractOpenLongSell}'
                            : widget.model.markType == 2
                                ? '${Tr.of(context).contractCloseLongSell}'
                                : widget.model.markType == 3 ? '${Tr.of(context).contractCloseLongSell}' : widget.model.markType == 4 ? '${Tr.of(context).contractOpenLongSell}' : '',
                        style: TextStyle(color: Color(0xff323232), fontWeight: FontWeight.bold, fontSize: sp(32))),
                  ),
                  Positioned(
                    right: width(10),
                    child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Text("${Tr.of(context).contractClose}",
                            style: TextStyle(color: Color(0xff9BAECA), fontWeight: FontWeight.bold, fontSize: sp(30)))),
                  ),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: height(40)),
                child: Row(
                  children: <Widget>[
                    Container(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          selectType = 0;
                        });
                      },
                      child: Text(
                        '${Tr.of(context).contractRapidLiquidation}',
                        style: TextStyle(
                          color: selectType == 0 ? Color(0xff006CFF) : Color(0xff707070F),
                          fontWeight: FontWeight.bold,
                          fontSize: sp(28),
                        ),
                      ),
                    )),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width(20)),
                      width: width(40),
                      height: height(40),
                      child: InkWell(
                        onTap: () {
                          unwindView(context);
                        },
                        child: Image.asset('images/contract/wenhao.png'),
                      ),
                    ),
                    Container(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          selectType = 1;
                        });
                      },
                      child: Text(
                        '${Tr.of(context).contractLimitOpening}',
                        style: TextStyle(
                          color: selectType == 1 ? Color(0xff006CFF) : Color(0xff707070F),
                          fontWeight: FontWeight.bold,
                          fontSize: sp(28),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Visibility(
                visible: selectType == 0,
                child: Container(
                  width: double.infinity,
                  height: height(80),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: width(1), color: kLineColor2)),
                  ),
                  child: Text(
                    '${Tr.of(context).contractOptimalTransaction}',
                    style: TextStyle(
                      color: Color(0xffB0BFD7),
                      fontSize: sp(28),
                    ),
                  ),
                ),
                replacement: Container(
                  width: double.infinity,
                  height: height(80),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: width(1), color: kLineColor2)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
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
                            border: UnderlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent)),
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
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
              ),
              Container(
                width: double.infinity,
                height: height(80),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: width(1), color: kLineColor2)),
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
                          hintText: '${Tr.of(context).TradrQuantity}',
                          maxHeight: 60,
                          border: UnderlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent)),
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
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
              SizedBox(height: height(40)),
              PercentageButton(
                numInput: numHand,
                onSelect: (e) {
                  setState(() {
                    numHand = e['id'].toString();
                    numberCtr.text = (double.parse(e['id'].toString()) * double.parse(widget.model.leftHand.toString()))
                        .floor()
                        .toString();
                  });
                },
              ),
              Container(
                margin: EdgeInsets.only(top: height(40)),
                child: Row(
                  children: <Widget>[
                    Container(
                        child: Text(
                      '${Tr.of(context).contractCanSell}${widget.model.leftHand.toString()}${Tr.of(context).assetHand}',
                      style: TextStyle(
                        color: Color(0xffB0BFD7),
                        fontWeight: FontWeight.bold,
                        fontSize: sp(28),
                      ),
                    )),
                    // Container(
                    //     margin: EdgeInsets.symmetric(horizontal: width(20)),
                    //     child: Text(
                    //       '冻结0手',
                    //       style: TextStyle(
                    //         color: Color(0xffB0BFD7),
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: sp(28),
                    //       ),
                    //     )),
                    Container(
                      width: width(40),
                      height: height(40),
                      child: InkWell(
                        child: Image.asset('images/contract/wenhao.png'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height(50)),
                width: double.infinity,
                child: SmallButton(
                  color: kPrimaryColor,
                  isBorder: false,
                  fontSize: sp(30),
                  textColor: kTextColorF2,
                  height: height(90),
                  borderRadius: BorderRadius.all(Radius.circular(height(45))),
                  text: '${Tr.of(context).Confirm}',
                  onPressed: () {
                    sureCick();
                  }, // 可传参到父组件
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sureCick() {
    if (selectType != 0 && priceCtr.text.isEmpty) {
      Toast.showText('${Tr.of(context).TradrPriceHint}');
    } else if (numberCtr.text.isEmpty) {
      Toast.showText('${Tr.of(context).TradrQuantityHint}');
    } else {
      try {
        Toast.showLoading('Loading...');
        ContractServer.requestSettleOrder({
          "symbol": widget.model.symbol,
          "type": widget.model.type == 'rose' ? 'fall' : 'rose',
          "hand": numberCtr.text,
          "price": priceCtr.text,
          "flash": selectType == 0 ? '1' : '0',
        }).then((data) {
          Toast.showSuccess('${Tr.of(context).tradrSuccess}');
          widget.onSelect('');
          Navigator.of(context).pop();
        });
      } catch (e) {
        GlobalConfig.errorTips(e);
      }
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
    {"id": 0.25, "num": "25%"},
    {"id": 0.50, "num": "50%"},
    {"id": 0.75, "num": "75%"},
    {"id": 1, "num": "100%"}
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
