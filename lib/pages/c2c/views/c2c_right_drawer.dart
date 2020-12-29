/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-18 18:02:09
* @LastEditors: Roy
* @LastEditTime: 2020-09-10 16:05:46
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/widgets/order/right_drawer.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/drawer/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/c2c/model/C2cCurrency_model.dart';
import 'package:HBit/pages/c2c/provider/index.dart';
import 'package:HBit/pages/c2c/server/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class C2cRightDrawer extends StatefulWidget {
  const C2cRightDrawer({
    Key key,
    this.onTab,
    this.onCurrencyTab,
    this.currencyModel,
    this.selectPayType,
  }) : super(key: key);
  final ValueChanged<String> onTab;
  final C2cCurrencyModel currencyModel;
  final String selectPayType;
  final Function(C2cCurrencyModel currency) onCurrencyTab;

  @override
  _C2cRightDrawerState createState() => _C2cRightDrawerState();
}

class _C2cRightDrawerState extends State<C2cRightDrawer>
    with SingleTickerProviderStateMixin {
  bool isShow = true;

  List list = ['银行卡', '支付宝', '微信'];
  List<C2cCurrencyModel> Coinlist = [];

  String selectPayType;
  C2cCurrencyModel currencyModel2;

  @override
  void initState() {
    super.initState();
    Coinlist =
        Provider.of<C2cProvider>(context, listen: false).c2cCurrencyModel;

    setState(() {
      currencyModel2 = widget.currencyModel;
    });
    setState(() {
      selectPayType = widget.selectPayType;
    });
  }

  @override
  Widget build(BuildContext context) {
    list = [
      '${Tr.of(context).c2cBank}',
      '${Tr.of(context).c2cAlipay}',
      '${Tr.of(context).WeChat}'
    ];
    return CustomDrawer(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _headerView(),
            _footerView(),
          ],
        ),
      ),
    );
  }

  Widget _headerView() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
        /*  Container(
            margin: EdgeInsets.only(top: height(20), left: width(40)),
            alignment: Alignment.centerLeft,
            child: Text(
              '${Tr.of(context).c2cPaymentMethod}',
              style: TextStyle(fontSize: sp(30)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: list
                .map((e) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => {
                        setState(() {
                          selectPayType = e;
                        })
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: height(20)),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffEFF8FE),
                            borderRadius: BorderRadius.circular(5),
                            image: selectPayType == e
                                ? DecorationImage(
                                    image:
                                        AssetImage('images/trade/select.png'),
                                    fit: BoxFit.fill)
                                : null),
                        height: width(70),
                        width: width(140),
                        child: Text(e,
                            style: TextStyle(
                                color: selectPayType == e
                                    ? kPrimaryColor
                                    : Color(0xff323232),
                                fontSize: sp(24))),
                      ),
                    ))
                .toList(),
          ),*/
          Container(
            margin: EdgeInsets.only(top: height(20), left: width(40)),
            alignment: Alignment.centerLeft,
            child: Text(
              '${Tr.of(context).mainOtc}',
              style: TextStyle(fontSize: sp(30)),
            ),
          ),
          Expanded(child:     GridView.count(
            //水平子Widget之间间距
            crossAxisSpacing: 5.0,
            //垂直子Widget之间间距
            mainAxisSpacing: 5.0,
            //GridView内边距
            padding: EdgeInsets.all(10.0),
            //一行的Widget数量
            crossAxisCount: 3,
            //子Widget宽高比例
            childAspectRatio: 2.0,
            //子Widget列表
            children: getWidgetList(),
          ))
        ],
      ),
    );
  }



  List<Widget> getWidgetList() {
    return Coinlist.map((e) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => {
            setState(() {
              currencyModel2 = e;
            })
          },
          child: Container(
            margin: EdgeInsets.only(top: height(20)),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xffEFF8FE),
                borderRadius: BorderRadius.circular(5),
                image: currencyModel2.currency == e.currency
                    ? DecorationImage(
                        image: AssetImage('images/trade/select.png'),
                        fit: BoxFit.fill)
                    : null),
            height: width(70),
            width: width(140),
            child: Text(e.currency,
                style: TextStyle(
                    color: currencyModel2.currency == e.currency
                        ? kPrimaryColor
                        : Color(0xff323232),
                    fontSize: sp(24))),
          ),
        )).toList();
  }

  Widget _footerView() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: height(90),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: width(1), color: Color(0xffD3D3D3)),
          ),
        ),
        child: Row(children: <Widget>[
          Expanded(
            child: SmallButton(
              color: kTransprant,
              textColor: kPrimaryColor,
              isBorder: false,
              borderWidth: 0,
              borderColor: kTransprant,
              height: height(90),
              borderRadius: BorderRadius.all(Radius.circular(width(0))),
              text: '${Tr.of(context).cancel}',
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop();
                  // currencyModel2 = currencyModel;
                });
              },
            ),
          ),
          Expanded(
            child: SmallButton(
              color: kPrimaryColor,
              textColor: Colors.white,
              isBorder: false,
              borderWidth: 0,
              borderColor: kTransprant,
              height: height(90),
              borderRadius: BorderRadius.all(Radius.circular(width(0))),
              text: '${Tr.of(context).Confirm}',
              onPressed: () {
                widget.onTab(selectPayType);
                widget.onCurrencyTab(currencyModel2);
                Navigator.of(context).pop();
              },
            ),
          ),
        ]),
      ),
    );
  }
}
