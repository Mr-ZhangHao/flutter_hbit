import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/c2c/routes/index.dart';
import 'package:HBit/pages/c2c/server/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/routes/routes.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:HBit/providers/provider_widget.dart';
import 'package:HBit/pages/c2c/provider/index.dart';

class orderDealPage extends StatefulWidget {
  final String type;
  final String id;
  final String coin;
  final String currency;
  final String currencyID;
  final String number;
  final String price;

  orderDealPage({Key key, this.type, this.id, this.coin, this.currency, this.currencyID, this.number, this.price})
      : super(key: key);
  @override
  _orderDealPageState createState() => _orderDealPageState();
}

class _orderDealPageState extends State<orderDealPage> {
  final _numCtr = TextEditingController();
  final FocusNode _numFocus = FocusNode();
  final _PwdCtr = TextEditingController();
  final FocusNode _PwdFocus = FocusNode();

  String totla = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    totla = widget.price;
    _numCtr.addListener(() {
      ///获取输入的内容
      String currentStr = _numCtr.text;
      setState(() {
        totla = (double.parse(currentStr) * double.parse(widget.price)).toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png', width: width(22), height: height(36)),
            ),
          ),
          title: Text(int.parse(widget.type) == 0 ? '${Tr.of(context).c2cBuy}' : '${Tr.of(context).c2cSell}',
              style: TextStyle(color: kTextColor3, fontSize: sp(32))),
          centerTitle: true,
          elevation: 1,
        ),
        body: ProviderWidget<C2cProvider>(
            model: C2cProvider(),
            onModelReady: (model) {},
            builder: (context, model, _) {
              return Container(
                color: kWhite,
                padding: EdgeInsets.only(left: width(20), right: width(20)),
                child: Column(
                  children: [
                    InputWidget(
                      maxHeight: 100,
                      textAlign: TextAlign.right,
                      onTab: () {},
                      prefixIconConstraintsMaxWidth: 250,
                      prefixIconConstraintsMinWidth: 100,
                      prefixIconConstraintsMinHeight: 50,
                      prefixIconConstraintsMaxHeight: 50,
                      suffixIconConstraintsMaxHeight: 50,
                      suffixIconConstraintsMaxWidth: 250,
                      suffixIconConstraintsMinHeight: 50,
                      suffixIconConstraintsMinWidth: 100,
                      readOnly: true,
                      suffixIcon: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('${widget.price}'),
                            /*     SizedBox(width: width(10)),
                        Image.asset(
                          'images/mine/next.png',
                          width: width(18),
                          color: Color(0xff323232),
                        ),*/
                          ],
                        ),
                      ),
                      // contentPadding: EdgeInsets.only(top: height(5)),
                      hintText: '',
                      prefixIcon: Container(
                        child: Text('${Tr.of(context).c2cPrice} (${widget.currency})'),
                      ),
                    ),
                    FocusWidget(
                      focusNode: _numFocus,
                      child: InputWidget(
                        focusNode: _numFocus,
                        controller: _numCtr,
                        maxHeight: 100,
                        obscureText: false,
                        textAlign: TextAlign.center,
                        hintText: Tr.of(context).TradrQuantityHint,
                        prefixIconConstraintsMaxWidth: 250,
                        prefixIconConstraintsMinWidth: 100,
                        prefixIconConstraintsMinHeight: 50,
                        prefixIconConstraintsMaxHeight: 50,
                        suffixIconConstraintsMaxHeight: 50,
                        suffixIconConstraintsMaxWidth: 150,
                        suffixIconConstraintsMinHeight: 50,
                        suffixIconConstraintsMinWidth: 50,
                        //  contentPadding: EdgeInsets.only(left: width(22)),
                        hintStyle: TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                        prefixIcon: Container(
                          child: Text('${Tr.of(context).TradrQuantity}(${widget.coin}) ',
                              style: TextStyle(color: Colors.black)),
                        ),
              /*          suffixIcon: GestureDetector(
                          child: Container(
                            child: Text('${Tr.of(context).tradrAll}', style: TextStyle(color: Color(0xffFF7412))),
                          ),
                          onTap: () {
                            _numCtr.text = widget.number;
                          },
                        ),*/
                      ),
                    ),
                    InputWidget(
                      maxHeight: 100,
                      textAlign: TextAlign.right,
                      onTab: () {},
                      prefixIconConstraintsMaxWidth: 250,
                      prefixIconConstraintsMinWidth: 100,
                      prefixIconConstraintsMinHeight: 50,
                      prefixIconConstraintsMaxHeight: 50,
                      suffixIconConstraintsMaxHeight: 50,
                      suffixIconConstraintsMaxWidth: 250,
                      suffixIconConstraintsMinHeight: 50,
                      suffixIconConstraintsMinWidth: 100,
                      readOnly: true,
                      suffixIcon: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('${totla}'),
                            /*     SizedBox(width: width(10)),
                        Image.asset(
                          'images/mine/next.png',
                          width: width(18),
                          color: Color(0xff323232),
                        ),*/
                          ],
                        ),
                      ),
                      // contentPadding: EdgeInsets.only(top: height(5)),
                      hintText: '',
                      prefixIcon: Container(
                        child: Text('${Tr.of(context).assetAmount} (${widget.currency})'),
                      ),
                    ),
                    Visibility(
                      child: FocusWidget(
                        focusNode: _PwdFocus,
                        child: InputWidget(
                          focusNode: _PwdFocus,
                          controller: _PwdCtr,
                          maxHeight: 100,
                          obscureText: true,
                          hintText: Tr.of(context).loginPwdHint,
                          prefixIconConstraintsMaxWidth: 200,
                          prefixIconConstraintsMinWidth: 160,
                          prefixIconConstraintsMinHeight: 50,
                          prefixIconConstraintsMaxHeight: 50,
                          contentPadding: EdgeInsets.only(bottom: height(12)),
                          hintStyle: TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                          prefixIcon: Container(
                            child: Text('${Tr.of(context).moneyPassword}：', style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ),
                      visible: int.parse(widget.type) == 1,
                    ),
                    SizedBox(
                      height: height(100),
                    ),
                    MyButton(
                        text: int.parse(widget.type) == 0 ? '${Tr.of(context).c2cBuy}' : '${Tr.of(context).c2cSell}',
                        onPressed: () {
                          Toast.showLoading('loading...');
                          int.parse(widget.type) == 0
                              ? C2cServer.getbuyDetail(widget.id, _numCtr.text, widget.currencyID).then((value) {
                                  _numCtr.text = '';
                                  Toast.showSuccess('${Tr.of(context).c2cBuySuccessful}');
                                  Routers.push(context, C2CRouter.orderHistory, replace: true, clearStack: false);
                                })
                              : C2cServer.getsellerDetail(widget.id, _numCtr.text, widget.currencyID, _PwdCtr.text)
                                  .then((value) {
                                  _numCtr.text = '';
                                  Toast.showSuccess('${Tr.of(context).c2cSellSuccessful}');
                                  Routers.push(context, C2CRouter.orderHistory, replace: true, clearStack: false);
                                });
                        }),
                  ],
                ),
              );
            }));
  }
}
