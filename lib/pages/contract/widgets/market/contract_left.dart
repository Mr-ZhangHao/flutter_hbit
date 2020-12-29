/*
* @message: 行情左边部分操作台
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-11 18:15:30
* @LastEditors: Roy
* @LastEditTime: 2020-09-29 16:54:46
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/widgets/market/contract_left.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/form/lable_input.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/contract/provider/contract_common_provider.dart';
import 'package:HBit/pages/contract/provider/contract_provider.dart';
import 'package:HBit/pages/contract/server/index.dart';
import 'package:HBit/pages/contract/widgets/market/contract_popup.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/text_input_formatter.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../common/toast/dialog_util.dart';
import '../../../../common/toast/index.dart';
import '../../../../utils/screen.dart';

//委托
enum PlanType {
  // 普通计划
  normal,

  //计划委托
  entrust
}
//开仓平仓
enum WareHouse {
  // 开仓
  open,

  //多仓
  more
}

class ContractLeft extends StatefulWidget {
  const ContractLeft({
    Key key,
    @required this.planType,
    this.model1,
    this.model2,
    this.onBuyClick,
    this.onSellClick,
  }) : super(key: key);
  final PlanType planType;
  final ContractCommonProvider model1;
  final ContractOrderProvider model2;
  final VoidCallback onBuyClick;
  final VoidCallback onSellClick;

  @override
  _ContractLeftState createState() => _ContractLeftState();
}

class _ContractLeftState extends State<ContractLeft> {
  final numberCtr = TextEditingController();
  final FocusNode numberFocus = FocusNode();

  final priceCtr = TextEditingController();
  final FocusNode priceFocus = FocusNode();

  final lightCtr = TextEditingController();
  final FocusNode lightFocus = FocusNode();
  //开仓 多仓
  WareHouse wareHouseType = WareHouse.open;

  String moreHouse = "20";
  String emptyHouse = "20";
  bool isShow = false;

  @override
  void initState() {
    super.initState();
    widget.model2.setCallBack((price) => {priceCtr.text = price});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.only(left: width(20), top: height(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${Tr.of(context).contractCurrentPosition}', style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(24))),
              widget.planType == PlanType.entrust
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: openBtn(
                              '${Tr.of(context).contractOpen}',
                              WareHouse.open,
                              wareHouseType == WareHouse.open ? Color(0xffEFFFF5) : kTransprant,
                              wareHouseType == WareHouse.open ? kGreenColor : Color(0xffD7D7D7)),
                        ),
                        SizedBox(width: width(10)),
                        Expanded(
                          child: openBtn(
                              '${Tr.of(context).contractClose2}',
                              WareHouse.more,
                              wareHouseType == WareHouse.more ? Color(0xffEFFFF5) : kTransprant,
                              wareHouseType == WareHouse.more ? kGreenColor : Color(0xffD7D7D7)),
                        )
                      ],
                    )
                  : SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: wareHouses('${Tr.of(context).contractBull}', '${moreHouse}X', kGreenColor, 0)),
                  SizedBox(width: width(10)),
                  Expanded(child: wareHouses('${Tr.of(context).contractBear}', '${moreHouse}X', kRedColor, 1))
                ],
              ),
              SizedBox(height: height(10)),
              widget.planType != PlanType.entrust
                  ? Text('${Tr.of(context).contractLimitOpening}', style: TextStyle(fontSize: sp(24)))
                  : SizedBox(height: 0),
              SizedBox(height: height(widget.planType == PlanType.entrust ? 0 : 10)),
              FocusWidget(
                focusNode: priceFocus,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('images/contract/input.png'), fit: BoxFit.fill),
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(width: 0.5, color: kDividerColor)),
                  child: InputWidget(
                    obscureText: false,
                    contentPadding: EdgeInsets.only(left: width(10), bottom: height(30)),
                    controller: priceCtr,
                    focusNode: priceFocus,
                    hintText: widget.planType == PlanType.entrust ? '${Tr.of(context).contractEnterTriggerHint}' : '${Tr.of(context).TradrPriceHint}',
                    maxHeight: 60,
                    inputFormatters: [UsNumberTextInputFormatter()],
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    // suffixStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: height(widget.planType == PlanType.normal ? 20 : 10)),
              widget.planType == PlanType.entrust
                  ? Row(
                      children: <Widget>[
                        Expanded(
                          child: FocusWidget(
                            focusNode: lightFocus,
                            child: Container(
                              decoration: BoxDecoration(
                                  image:
                                      DecorationImage(image: AssetImage('images/contract/input.png'), fit: BoxFit.fill),
                                  color: isShow ? Color(0xffcccccc) : kTransprant,
                                  borderRadius: BorderRadius.all(Radius.circular(2)),
                                  border: Border.all(width: 0.5, color: kDividerColor)),
                              child: InputWidget(
                                // inputFormatters: [MyNumberTextInputFormatter(digit: 6)],
                                inputFormatters: [UsNumberTextInputFormatter(), MyNumberTextInputFormatter(digit: 6)],
                                contentPadding: EdgeInsets.only(left: width(10), bottom: height(30)),
                                obscureText: false,
                                readOnly: isShow,
                                controller: lightCtr,
                                focusNode: lightFocus,
                                hintText: isShow ? '${Tr.of(context).contractBestPrice}' : '${Tr.of(context).contractStrikePrice}',
                                maxHeight: 60,
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                // suffixStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width(10)),
                        Container(
                          alignment: Alignment.center,
                          width: width(120),
                          height: height(60),
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              border: Border.all(color: Color(0xffD7D7D7), width: width(1)),
                              borderRadius: BorderRadius.all(Radius.circular(width(5)))),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isShow = !isShow;
                              });
                            },
                            child: Text('${Tr.of(context).contractRapidLiquidation}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: sp(24),
                                )),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(height: 0),
              widget.planType == PlanType.entrust ? SizedBox(height: height(10)) : SizedBox(height: 0),
              FocusWidget(
                focusNode: numberFocus,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('images/contract/input.png'), fit: BoxFit.fill),
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(width: 0.5, color: kDividerColor)),
                  child: InputWidget(
                    contentPadding: EdgeInsets.only(left: width(10), bottom: height(30)),
                    obscureText: false,
                    controller: numberCtr,
                    focusNode: numberFocus,
                    hintText: '${Tr.of(context).contractEnterOrderNumberHint}',
                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                    suffixIcon: Container(
                      margin: EdgeInsets.only(top: height(74 / 3), right: width(10)),
                      child: Text(
                        '${Tr.of(context).assetHand}',
                        style: TextStyle(color: Color(0xffC0C0C0)),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    maxHeight: 60,
                  ),
                ),
              ),
              SizedBox(height: height(widget.planType == PlanType.normal ? 20 : 10)),
              widget.planType == PlanType.entrust
                  ? SizedBox(height: 0)
                  : Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                          "1${Tr.of(context).assetHand}≈${Utils.cutZero(widget.model1?.marketItem?.handNum ?? '0')}${widget.model1?.marketItem?.symbol?.split('_')?.first?.toUpperCase() ?? ''}",
                          style: TextStyle(color: Color(0xffE58181), fontSize: sp(20))),
                    ),
              SizedBox(height: height(widget.planType == PlanType.normal ? 10 : 0)),
              PercentageButton(
                onSelect: (e) => setState(() => numberCtr.text = e['id'].toString()),
                numInput: numberCtr.text,
              ),
              SizedBox(height: height(6)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${Tr.of(context).contractMarketValue}', style: TextStyle(color: Color(0xffc0c0c0), fontSize: sp(20))),
                  // hand_num*多少手*输入的价格
                  Text(
                      '≈${double.parse(widget.model1?.marketItem?.handNum ?? '0') * double.parse(priceCtr.text.isEmpty || priceCtr.text == '.' ? '0' : priceCtr.text) * double.parse(numberCtr.text.isEmpty || numberCtr.text == '.' ? '0.00' : numberCtr.text)}USDT',
                      style: TextStyle(color: kTextColor3, fontSize: sp(20)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
              SizedBox(height: height(6)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${Tr.of(context).contractMargin}', style: TextStyle(color: Color(0xffc0c0c0), fontSize: sp(20))),
                  Text(
                      wareHouseType == WareHouse.more && widget.planType == PlanType.entrust
                          ? '0USDT'
                          : "≈${Utils.formatNum((double.parse(widget.model1?.marketItem?.handNum ?? '0') * double.parse(priceCtr.text.isEmpty || priceCtr.text == '.' ? '0' : priceCtr.text) * double.parse(numberCtr.text.isEmpty || numberCtr.text == '.' ? '0.00' : numberCtr.text) / double.parse(moreHouse)).toString(), pos: 6)}USDT",
                      style: TextStyle(color: kTextColor3, fontSize: sp(20)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
              SizedBox(height: height(6)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${Tr.of(context).tradrAll}', style: TextStyle(color: Color(0xffc0c0c0), fontSize: sp(20))),
                  Text(Utils.cutZero(widget.model1?.available ?? '0.00'),
                      style: TextStyle(color: kTextColor3, fontSize: sp(20)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
              SizedBox(height: height(widget.planType == PlanType.normal ? 20 : 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: LinearGradientButton(
                      width: double.infinity,
                      height: height(60),
                      // text: wareHouseType == WareHouse.open ? "买入开多" : '卖出平多',
                      text: (wareHouseType == WareHouse.open && widget.planType == PlanType.entrust)
                          ? "${Tr.of(context).contractBuyOpenLong}"
                          : (wareHouseType == WareHouse.more && widget.planType == PlanType.entrust) ? '${Tr.of(context).contractSellMore}' : '${Tr.of(context).contractBuyOpenLong}',
                      textSize: sp(24),
                      textColor: Colors.white,
                      beginColor: Color(0xff74EBA7),
                      endColor: Color(0xff32AE5C),
                      shadowColor: kTransprant,
                      borderRadius: width(60),
                      marginRight: 0,
                      marginLeft: 0,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: 0,
                      paddingRight: 0,
                      onPressed: () => btnClick(0),
                    ),
                  ),
                  SizedBox(width: width(20)),
                  Expanded(
                    child: LinearGradientButton(
                      width: double.infinity,
                      height: height(60),
                      // text: wareHouseType == WareHouse.open ? "卖出开空" : '买入平空',
                      text: (wareHouseType == WareHouse.open && widget.planType == PlanType.entrust)
                          ? "${Tr.of(context).contractSell1}"
                          : (wareHouseType == WareHouse.more && widget.planType == PlanType.entrust) ? '${Tr.of(context).contractBuy1}' : '${Tr.of(context).contractSell1}',
                      textSize: sp(24),
                      textColor: Colors.white,
                      beginColor: Color(0xffF37676),
                      endColor: Color(0xffD64C4C),
                      shadowColor: kTransprant,
                      borderRadius: width(60),
                      marginRight: 0,
                      marginLeft: 0,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: 0,
                      paddingRight: 0,
                      onPressed: () => btnClick(1),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }

  //仓位按钮
  Widget wareHouses(String name, String hands, Color colors, int type) {
    return Container(
      height: height(60),
      margin: EdgeInsets.only(top: height(10)),
      padding: EdgeInsets.symmetric(horizontal: width(6)),
      decoration: BoxDecoration(
        color: widget.planType == PlanType.entrust ? Color(0xffEEF5FA) : kTransprant,
        image: DecorationImage(image: AssetImage('images/contract/btn.png'), fit: BoxFit.fill),
      ),
      child: InkWell(
        onTap: () {
          showBottomInBottomDialog(
              context,
              WareHouseView(
                  title: type == 0 ? "${Tr.of(context).contractBuy2}" : "${Tr.of(context).contractSell2}",
                  numHand: type == 0 ? moreHouse : moreHouse,
                  onSelect: (e) => setState(() => type == 0 ? moreHouse = e : moreHouse = e)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(name, style: TextStyle(color: kTextColor3, fontSize: sp(24))),
            Text(hands, style: TextStyle(color: colors, fontSize: sp(24))),
          ],
        ),
      ),
    );
  }

  //开仓平仓按钮
  /*
   * name:按钮名字
   * type:圆角位置
   * colors：背景颜色
   * borderColor:边框色和文字
   */
  Widget openBtn(String name, WareHouse type, Color colors, Color borderColor) {
    return Container(
      height: height(60),
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: height(10)),
      padding: EdgeInsets.symmetric(horizontal: width(6)),
      decoration: BoxDecoration(
          color: colors,
          borderRadius: type == WareHouse.open
              ? BorderRadius.only(bottomLeft: Radius.circular(width(32)))
              : BorderRadius.only(topRight: Radius.circular(width(32))),
          border: Border.all(color: borderColor, width: width(1))),
      child: InkWell(
        onTap: () => setState(() => wareHouseType = type),
        child: Text(name, style: TextStyle(color: borderColor, fontSize: sp(24))),
      ),
    );
  }

  void btnClick(int type) {
    if (priceCtr.text.isEmpty) {
      Toast.showText(widget.planType == PlanType.normal ? '${Tr.of(context).TradrPriceHint}' : '${Tr.of(context).contractEnterTriggerHint}');
    } else if ((lightCtr.text.isEmpty) && widget.planType == PlanType.entrust && !isShow) {
      Toast.showText('${Tr.of(context).contractEnterExecuteHint}');
    } else if (numberCtr.text.isEmpty) {
      Toast.showText('${Tr.of(context).contractEnterOrderNumberHint}');
    } else if (widget.planType == PlanType.normal) {
      //普通委托
      try {
        Toast.showLoading('Loading...');
        ContractServer.requestContractOrder({
          "symbol": widget.model1.marketItem.symbol,
          "type": type == 0 ? 'rose' : 'fall',
          "multiple": type == 0 ? moreHouse : moreHouse,
          "hand": numberCtr.text,
          "price": priceCtr.text
        }).then((data) {
          Toast.showText('${Tr.of(context).tradrSuccess}');
          priceCtr.text = '';
          numberCtr.text = '';
          setState(() {});
          type == 0 ? widget.onBuyClick() : widget.onSellClick();
        });
      } catch (e) {
        print(e);
      }
    } else if (widget.planType == PlanType.entrust) {
      try {
        Toast.showLoading('Loading...');
        ContractServer.requestPlanOrder({
          "symbol": widget.model1.marketItem.symbol,
          "type": type == 0 && wareHouseType == WareHouse.open
              ? 'rose'
              : type == 1 && wareHouseType == WareHouse.open
                  ? 'fall'
                  : type == 0 && wareHouseType == WareHouse.more ? 'fall' : 'rose',
          "multiple": type == 0 ? moreHouse : moreHouse,
          "hand": numberCtr.text,
          "trigger_price": priceCtr.text,
          "price": lightCtr.text,
          "flash": isShow ? '1' : '0',
          "order_type": wareHouseType == WareHouse.open ? '1' : '2'
        }).then((data) {
          Toast.showText('${Tr.of(context).tradrSuccess}');
          priceCtr.text = '';
          numberCtr.text = '';
          lightCtr.text = '';
          setState(() {});
          type == 0 ? widget.onBuyClick() : widget.onSellClick();
        });
      } catch (e) {
        GlobalConfig.errorTips(e);
      }
    }
  }
}

class PercentageButton extends StatefulWidget {
  PercentageButton({Key key, this.planType, this.onSelect, this.numInput}) : super(key: key);
  final PlanType planType;
  final Function onSelect;
  final String numInput;
  @override
  _PercentageButtonState createState() => _PercentageButtonState();
}

class _PercentageButtonState extends State<PercentageButton> {
  List<dynamic> list = [
    {"id": 1, "num": "1手"},
    {"id": 5, "num": "5手"},
    {"id": 10, "num": "10手"},
    {"id": 100, "num": "100手"},
  ];

  /// 当前选中的百分比
  num _currentHand = -1;

  @override
  Widget build(BuildContext context) {

    list = [
      {"id": 1, "num": "1${Tr.of(context).assetHand}"},
      {"id": 5, "num": "5${Tr.of(context).assetHand}"},
      {"id": 10, "num": "10${Tr.of(context).assetHand}"},
      {"id": 100, "num": "100${Tr.of(context).assetHand}"},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list
          .asMap()
          .keys
          .map(
            (index) => Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: list[index]["id"].toString() == widget.numInput
                          ? AssetImage('images/contract/hand.png')
                          : AssetImage('images/contract/hand_gray.png'),
                      fit: BoxFit.fill),
                ),
                margin: EdgeInsets.only(right: width(10)),
                child: SmallButton(
                  color: kTransprant,
                  isBorder: _currentHand != index,
                  borderColor: kTransprant,
                  borderWidth: width(0),
                  fontSize: sp(24),
                  textColor: list[index]["id"].toString() == widget.numInput ? Color(0xff126DFF) : kTextColor9,
                  height: height(40),
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
