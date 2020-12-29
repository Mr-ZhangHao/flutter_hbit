/*
* @message: 行情左边部分操作台
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-11 18:15:30
* @LastEditors: Roy
* @LastEditTime: 2020-09-09 15:02:57
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/widgets/market/market_left.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/event/TrderCoinListEvent.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/pages/trade/provider/contract_provider.dart';
import 'package:HBit/pages/trade/provider/market_provider.dart';
import 'package:HBit/pages/trade/server/index.dart';
import 'package:HBit/pages/trade/widgets/market/price_popover.dart';
import 'package:HBit/pages/trade/widgets/market/seekBar.dart';
import 'package:HBit/routes/application.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_seekbar/seekbar/section_text_model.dart';
// import 'package:flutter_seekbar/seekbar/seekbar.dart';
import '../../trade_screen.dart';
import '../number_controller_widget.dart';

class MarketLeft extends StatefulWidget {
  const MarketLeft(
      {Key key, @required this.buyType, this.onBuyClick, this.onSellClick, this.model, this.model1, this.refreshData})
      : super(key: key);
  final BuyType buyType;
  final VoidCallback onBuyClick;
  final VoidCallback onSellClick;
  final MarketProvider model;
  final OrderRecordProvider model1;
  final Function refreshData;

  @override
  _MarketLeftState createState() => _MarketLeftState();
}

class _MarketLeftState extends State<MarketLeft> {
  final numberCtr = TextEditingController();
  final FocusNode numberFocus = FocusNode();

  final priceCtr = TextEditingController();
  final FocusNode priceFocus = FocusNode();

  List<SectionTextModel> sectionTextsGreen = [
    SectionTextModel(position: 0, text: '0%', progressColor: kGreenColor),
    SectionTextModel(position: 1, text: '25%', progressColor: kGreenColor),
    SectionTextModel(position: 2, text: '50%', progressColor: kGreenColor),
    SectionTextModel(position: 3, text: '75%', progressColor: kGreenColor),
    SectionTextModel(position: 4, text: '100%', progressColor: kGreenColor),
  ];

  List<SectionTextModel> sectionTextsRed = [
    SectionTextModel(position: 0, text: '0%', progressColor: kRedColor),
    SectionTextModel(position: 1, text: '25%', progressColor: kRedColor),
    SectionTextModel(position: 2, text: '50%', progressColor: kRedColor),
    SectionTextModel(position: 3, text: '75%', progressColor: kRedColor),
    SectionTextModel(position: 4, text: '100%', progressColor: kRedColor),
  ];

  double type = 0.0;
  String totalNum = '0.00';
  String cnyNum = '0.00';
  String priceType = '限价';

  @override
  void initState() {
    super.initState();

    widget.model1.setCallBack((price) => {priceCtr.text = price});
    priceCtr.addListener(() {
      if (priceCtr.text.length > 0 && numberCtr.text.length > 0 && widget.buyType == BuyType.buy) {
        //买
        setState(() {
          type = 0.0;
          totalNum = (double.parse(numberCtr.text) * double.parse(priceCtr.text)).toString();
          cnyNum = Utils.formatNum(double.parse(priceCtr.text) * widget.model.rateCNY, pos: 2);
        });
      } else if (priceCtr.text.length > 0 && numberCtr.text.length > 0 && widget.buyType == BuyType.sell) {
        //卖
        setState(() {
          totalNum = (double.parse(numberCtr.text) * double.parse(priceCtr.text)).toString();
          cnyNum = Utils.formatNum(double.parse(priceCtr.text) * widget.model.rateCNY, pos: 2);
        });
      } else if (priceCtr.text.length > 0) {
        setState(() {
          cnyNum = Utils.formatNum(double.parse(priceCtr.text) * widget.model.rateCNY, pos: 2);
        });
      } else {
        setState(() {
          totalNum = '0';
        });
      }
    });
    numberCtr.addListener(() {
      setState(() {
        type = 0.0;
      });
      if (priceCtr.text.length > 0 && numberCtr.text.length > 0 && widget.buyType == BuyType.buy) {
        //买
        setState(() {
          totalNum = (double.parse(numberCtr.text) * double.parse(priceCtr.text)).toString();
        });
      } else if (priceCtr.text.length > 0 && numberCtr.text.length > 0 && widget.buyType == BuyType.sell) {
        //卖
        setState(() {
          totalNum = (double.parse(numberCtr.text) * double.parse(priceCtr.text)).toString();
        });
      } else {
        //卖
        setState(() {
          totalNum = '0';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: SmallButton(
                  color: kTransprant,
                  textColor: widget.buyType == BuyType.buy ? kGreenColor : kTxtColor,
                  isBorder: true,
                  borderWidth: 0.5,
                  borderColor: widget.buyType == BuyType.buy ? kGreenColor : kTxtColor,
                  height: height(60),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                  text:Tr.of(context).tradrBuy,
                  onPressed: widget.onBuyClick,
                ),
              ),
              Expanded(
                  child: SmallButton(
                height: height(60),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                color: kTransprant,
                textColor: widget.buyType == BuyType.sell ? kRedColor : kTxtColor,
                isBorder: true,
                borderWidth: 0.5,
                borderColor: widget.buyType == BuyType.sell ? kRedColor : kTxtColor,
                text: Tr.of(context).tradrSell,
                onPressed: widget.onSellClick,
              ))
            ],
          ),
          SizedBox(height: height(20)),
          PricePopoverButton(
            text: Text(priceType, style: TextStyle(color: kTxtColor, fontSize: sp(24))),
            items: ['限价', '市价'],
            onActive: (v) {
              setState(() {
                priceType = v;
              });
            },
          ),
          SizedBox(height: height(10)),
          Visibility(
            visible: priceType == '限价',
            child: NumberControllerWidget(
              // numText: '',
              textFocus: priceFocus,
              textController: priceCtr,
              addValueChanged: (number) {
                print('addValueChanged');
                print(number);
              },
              removeValueChanged: (number) {
                print('removeValueChanged');
                print(number);
              },
              updateValueChanged: (number) {
                print('updateValueChanged');
                print(number);
              },
            ),
            replacement: Container(
              height: height(60),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: width(10)),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
                borderRadius: BorderRadius.circular(3),
                boxShadow: [
                  BoxShadow(offset: Offset(-1, -2), color: Color(0xffEDEDED), blurRadius: 1, spreadRadius: 1),
                  BoxShadow(offset: Offset(1, 1), color: Color(0xffEDEDED), blurRadius: 0.1, spreadRadius: 0.1),
                ],
              ),
              child: Text(
                '${Tr.of(context).TradrBest}',
                style: TextStyle(fontSize: sp(26), color: Color(0xff999999)),
              ),
            ),
          ),
          SizedBox(height: height(20)),
         // Text('≈￥$cnyNum', style: TextStyle(fontSize: sp(24))),
          SizedBox(height: height(20)),
          FocusWidget(
            focusNode: numberFocus,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
                boxShadow: [
                  BoxShadow(offset: Offset(-1, -2), color: Color(0xffEDEDED), blurRadius: 1, spreadRadius: 1),
                  BoxShadow(offset: Offset(1, 1), color: Color(0xffEDEDED), blurRadius: 0.1, spreadRadius: 0.1),
                ],
              ),
              child: InputWidget(
                maxHeight: 60,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: numberCtr,
                focusNode: numberFocus,
                hintText: '${Tr.of(context).TradrQuantity}',
                style: TextStyle(fontSize: sp(28), color: Color(0xff323232)),
                suffixIcon: Container(
                    child: Text(widget.model?.marketItem?.coinName ?? ''), padding: EdgeInsets.only(right: width(20))),
                suffixIconConstraintsMaxWidth: 100,
                suffixIconConstraintsMinWidth: 28,
                suffixIconConstraintsMinHeight: 28,
                contentPadding: EdgeInsets.only(bottom: height(30), left: width(10), right: width(10)),
              ),
            ),
          ),
          SizedBox(height: height(20)),
          Text(
              '${Tr.of(context).tradrAvailable}:${Utils.cutZero(widget.buyType == BuyType.buy ? widget?.model?.lastModel?.available ?? '0' : widget?.model?.firstModel?.available ?? '0')}${widget.buyType == BuyType.buy ? widget?.model?.selectSymbol?.last?.toString()?.toUpperCase() ?? '' : widget?.model?.selectSymbol?.first?.toString()?.toUpperCase() ?? ''}',
              style: TextStyle(fontSize: sp(20), color: kTxtColor)),
          SizedBox(height: height(20)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width(20)),
            child: SeekBar(
                progresseight: 1,
                value: type,
                sectionCount: 4,
                sectionRadius: 5,
                min: 0,
                max: 100.0,
                indicatorRadius: 10,
                showSectionText: true,
                // indicatorColor: Colors.red,
                afterDragShowSectionText: true,
                sectionTexts: widget.buyType == BuyType.buy ? sectionTextsGreen : sectionTextsRed,
                sectionTextSize: sp(20),
                sectionTextColor: kTxtColor,
                sectionSelectTextColor: widget.buyType == BuyType.buy ? kGreenColor : kRedColor,
                sectionTextMarginTop: height(20),
                backgroundColor: Color(0xffEBEBEB),
                sectionUnSelecteColor: Color(0xffEBEBEB),
                progressColor: Color(0xffEBEBEB),
                sectionColor: widget.buyType == BuyType.buy ? kGreenColor : kRedColor,
                onValueChanged: (v) {
                  setState(() {
                    type = v.value;
                  });
                  computedNum(v.progress);
                }),
          ),
          SizedBox(height: height(60)),
          Row(
            children: <Widget>[
              Text('${Tr.of(context).TradrAmount} ', style: TextStyle(color: kTxtColor, fontSize: sp(20))),
              Text(Utils.formatNum(totalNum, pos: 4),
                  style: TextStyle(fontSize: sp(20)), maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
          SizedBox(height: height(10)),
          Container(
            child: LinearGradientButton(
              width: double.infinity,
              height: height(65),
              text: widget.buyType == BuyType.buy ? Tr.of(context).tradrBuy: Tr.of(context).tradrSell,
              textSize: sp(32),
              textColor: Colors.white,
              beginColor: widget.buyType == BuyType.buy ? Color(0xff74EBA7) : Color(0xffF37676),
              endColor: widget.buyType == BuyType.buy ? Color(0xff32AE5C) : Color(0xffD64C4C),
              shadowColor: kDividerColor,
              borderRadius: width(60),
              marginRight: 0,
              marginLeft: 0,
              paddingTop: 0,
              paddingBottom: 0,
              paddingLeft: 0,
              paddingRight: 0,
              onPressed: () {
                submitOrder(widget.model,widget.model1);
              },
            ),
          )
        ],
      ),
    );
  }

  void computedNum(index) {
    if (widget.buyType == BuyType.buy) {
      //买
      if (priceCtr.text.length > 0) {
        setState(() {
          numberCtr.text = Utils.formatNum(
              (double.parse(widget.model.lastModel.available.toString()) *
                      double.parse(index.toString()) /
                      double.parse(priceCtr.text))
                  .toString(),
              pos: 4);
        });
      } else if (numberCtr.text.length > 0) {
        setState(() {
          priceCtr.text = Utils.formatNum(
              (double.parse(widget.model.lastModel.available.toString()) *
                      double.parse(index.toString()) /
                      double.parse(numberCtr.text))
                  .toString(),
              pos: 4);
        });
      }
    } else {
      //卖
      setState(() {
        numberCtr.text = Utils.formatNum(
            (double.parse(widget.model.firstModel.available.toString()) * double.parse(index.toString())),
            pos: 4);
      });
    }
  }

  void submitOrder(MarketProvider model1,OrderRecordProvider model2) async {
    if (priceCtr.text.isEmpty && priceType == '限价') {
      Toast.showText(Tr.of(context).TradrPriceHint);
    } else if (numberCtr.text.isEmpty) {
      Toast.showText(Tr.of(context).TradrQuantityHint);
    } else {
      try {
        TradeServer.requestOrderPlace({
          "price": priceCtr.text,
          "number": numberCtr.text,
          "side": widget.buyType == BuyType.buy ? 'BUY' : 'SELL',
          'order_type': priceType == '限价' ? 'LIMIT' : 'MARKET',
          "symbol": model1.marketItem.symbol
        }).then((value) {
          Toast.showSuccess(Tr.of(context).TradrPending);
          numberCtr.text = '';
          priceCtr.text = '';
          widget.refreshData();
         // model2.loadOrderRecord(pageNum: 1,symbol:model1.marketItem.symbol);
          //model2.initData();
      /*    model2.loadDepth(model1.marketItem.symbol);
          model2.requestMarketDetail(model1.marketItem.symbol);
          model1.getBalance(model1.marketItem.symbol);*/


          Application.eventBus
              .fire(TrderCoinListEvent());
        });
      } catch (e) {
        print(e);
      }
    }
  }
}

class PercentageButton extends StatefulWidget {
  PercentageButton({Key key, this.buyType, this.onSelect}) : super(key: key);
  final BuyType buyType;
  final Function onSelect;
  @override
  _PercentageButtonState createState() => _PercentageButtonState();
}

class _PercentageButtonState extends State<PercentageButton> {
  List<dynamic> list = [
    {"id": 25, "num": "25%"},
    {"id": 50, "num": "50%"},
    {"id": 70, "num": "75%"},
    {"id": 100, "num": "100%"},
  ];

  /// 当前选中的百分比
  num _currentHand = -1;

  @override
  Widget build(BuildContext context) {
    Color color = widget.buyType == BuyType.buy ? kGreenColor : kRedBgColor;
    return Row(
      children: list
          .asMap()
          .keys
          .map(
            (index) => Expanded(
              child: Container(
                margin: EdgeInsets.only(right: width(10)),
                child: SmallButton(
                  color: _currentHand == index ? color : kTransprant,
                  isBorder: _currentHand != index,
                  borderColor: kBorderColor,
                  borderWidth: width(0.5),
                  fontSize: sp(24),
                  textColor: _currentHand == index ? Colors.white : kTextColor9,
                  height: height(46),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
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
