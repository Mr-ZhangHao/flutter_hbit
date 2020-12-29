import 'dart:async';

import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/c2c/model/ContactServer_model.dart';
import 'package:HBit/pages/c2c/model/c2cOrderlDetail_model.dart';
import 'package:HBit/pages/c2c/provider/index.dart';
import 'package:HBit/pages/c2c/server/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/providers/provider_widget.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:HBit/routes/application.dart';
import 'package:HBit/common/event/c2cOrderHistoryEvent.dart';


class c2cOrderDetailPage extends StatefulWidget {
  final String id;

  c2cOrderDetailPage({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _c2cOrderDetailPageState createState() => _c2cOrderDetailPageState();
}

class _c2cOrderDetailPageState extends State<c2cOrderDetailPage> {
  final _idTypeCtr = TextEditingController();
  final FocusNode _idTypeFocus = FocusNode();
  final _PwdCtr = TextEditingController();
  final FocusNode _PwdFocus = FocusNode();
  List<PaymentAccount> account;
  PaymentAccount accounts;
  int type = 0;

  String coin = '';
  String currency = '';
  String Line = '';
  String Telogram = '';
  String Whatapp = '';
  String LineNumber = '';
  String TelogramNumber = '';
  String WhatappNumber = '';

  List<Map<String, dynamic>> typeList = [
    {"name": '银行卡', "id": 0},
    {"name": '支付宝', "id": 1},
    {"name": '微信', "id": 2},
  ];

  @override
  void initState() {
    super.initState();

    getOrderDetail();
  }
  @override
  Widget build(BuildContext context) {
    typeList = [
      {"name": '${Tr.of(context).c2cBank}', "id": 0},
      {"name": '${Tr.of(context).c2cAlipay}', "id": 1},
      {"name": '${Tr.of(context).WeChat}', "id": 2},
    ];
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text('${Tr.of(context).c2cOrderDetail}'),
        centerTitle: true,
        elevation: 1,
        leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Routers.goBack(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png',
                  width: width(22), height: height(36)),
            )),
      ),
      body: ProviderWidget<C2cProvider>(
          model: C2cProvider(),
          onModelReady: (model) {
            model.getC2cOrderDetail(widget.id);
          },
          builder: (context, model, _) {
           if( model.C2cOrderlDetailModel!=null){

             _inita(model);
             account = model.C2cOrderlDetailModel.paymentAccount;
           /*  for (int i = 0; i < account.length; i++) {
                if(account[i].type==0){
                  typeList.add({"name": '${Tr.of(context).c2cBank}', "id": 0});

                } else if(account[i].type==1){
                  typeList.add({"name": '${Tr.of(context).c2cAlipay}', "id": 1});

                }else if(account[i].type==2){
                  typeList.add({"name": '${Tr.of(context).WeChat}', "id": 2});
                }

             }*/
             for (int i = 0; i < account.length; i++) {
                 accounts = account[0];
             }

           }
            return model.C2cOrderlDetailModel==null ? Center(
              child: CupertinoActivityIndicator(),
            ):Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Visibility(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: width(20),
                              right: width(20),
                            ),
                            color: Color(0xffEDF2FA),
                            height: height(88),
                            child: Row(
                              children: [
                                Text('${Tr.of(context).c2cCancelOrderHint}',
                                    style: TextStyle(
                                        fontSize: sp(28),
                                        color: Color(0xff323232))),
                                SizedBox(width: width(20)),
                                GestureDetector(child: Text('${Tr.of(context).c2cCancelOrder}',
                                    style: TextStyle(
                                      fontSize: sp(28),
                                      color: Color(0xff126DFF),
                                      fontWeight: FontWeight.w600,
                                    )),onTap: (){
                                      //取消订单
                                        CancelOrder(context, model);

                                  },)
                              ],
                            ),
                          ),
                          visible: _getButtonState3(model.C2cOrderlDetailModel.orderInfo.status,model.C2cOrderlDetailModel.orderInfo.side),
                        ),
                        Visibility(
                          child: state(model.C2cOrderlDetailModel.orderInfo.status),
                          visible: _getButtonState2(model.C2cOrderlDetailModel.orderInfo.status,model.C2cOrderlDetailModel.orderInfo.side),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              left: width(20),
                              right: width(20),
                            ),
                            child: Container(
                              height: height(80),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    children: [
                                      Text('${Tr.of(context).c2cOrderNumber} ${model.C2cOrderlDetailModel.orderInfo.orderNo}',
                                          style: TextStyle(
                                              fontSize: sp(28),
                                              color: Color(0xff323232))),
                                      SizedBox(
                                        width: width(20),
                                      ),
                                      GestureDetector(
                                        child: Image.asset('images/c2c/icon_copy.png',
                                            width: width(40), height: height(40)),
                                        onTap: (){
                                          Clipboard.setData(ClipboardData(text: '${model.C2cOrderlDetailModel.orderInfo.orderNo}'));
                                          Toast.showSuccess(Tr.of(context).copySuccessfully);

                                        },
                                      )
                                    ],
                                  )),
                                  Text(_getState(model.C2cOrderlDetailModel.orderInfo.status, model.C2cOrderlDetailModel.orderInfo.side),
                                      style: TextStyle(
                                          fontSize: sp(28),
                                          color: Color(0xffFF7412))),
                                ],
                              ),
                            )),
                        Divider(
                          height: 0.5,
                          color: Color(0xffF6F6F6),
                        ),

                        Padding(
                            padding: EdgeInsets.only(
                              left: width(20),
                              right: width(20),
                            ),
                            child: Container(
                              height: height(60),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text('${Tr.of(context).c2cRealNameInfo}',
                                        style: TextStyle(
                                            fontSize: sp(28),
                                            color: Color(0xff9E9E9E))),
                                  ),
                                  Text('${model.C2cOrderlDetailModel.otherInfo.name}',
                                      style: TextStyle(
                                          fontSize: sp(28),
                                          color: Color(0xff323232))),
                                ],
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                              left: width(20),
                              right: width(20),
                            ),
                            child: Container(
                              height: height(60),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text('${Tr.of(context).c2cOrderAmount}(${currency})',
                                        style: TextStyle(
                                            fontSize: sp(28),
                                            color: Color(0xff9E9E9E))),
                                  ),
                                  Text('${double.parse(model.C2cOrderlDetailModel.orderInfo.number)*double.parse(model.C2cOrderlDetailModel.orderInfo.price)}',
                                      style: TextStyle(
                                          fontSize: sp(28),
                                          color: Color(0xff323232))),
                                ],
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                              left: width(20),
                              right: width(20),
                            ),
                            child: Container(
                              height: height(60),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text('${Tr.of(context).TradrQuantity}',
                                        style: TextStyle(
                                            fontSize: sp(28),
                                            color: Color(0xff9E9E9E))),
                                  ),
                                  Text('${model.C2cOrderlDetailModel.orderInfo.number} ${coin}',
                                      style: TextStyle(
                                          fontSize: sp(28),
                                          color: Color(0xff323232))),
                                ],
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                              left: width(20),
                              right: width(20),
                            ),
                            child: Container(
                              height: height(60),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text('${Tr.of(context).c2cPrice}(${currency})',
                                        style: TextStyle(
                                            fontSize: sp(28),
                                            color: Color(0xff9E9E9E))),
                                  ),
                                  Text('${model.C2cOrderlDetailModel.orderInfo.price}',
                                      style: TextStyle(
                                          fontSize: sp(28),
                                          color: Color(0xff323232))),
                                ],
                              ),
                            )),

                        Padding(
                            padding: EdgeInsets.only(
                              left: width(20),
                              right: width(20),
                            ),
                            child: Container(
                              height: height(60),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text('${Tr.of(context).c2cOrderTime}',
                                        style: TextStyle(
                                            fontSize: sp(28),
                                            color: Color(0xff9E9E9E))),
                                  ),
                                  Text('${model.C2cOrderlDetailModel.otherInfo.createdAt}',
                                      style: TextStyle(
                                          fontSize: sp(28),
                                          color: Color(0xff323232))),
                                ],
                              ),
                            )),
                        Container(
                          height: height(20),
                          color: Color(0xffF4F4F4),
                        ),
                        Visibility(
                          child: Column(
                            children: [
                              payment(),
                              PaymentType(type,accounts),
                              Container(
                                height: height(20),
                                color: Color(0xffF4F4F4),
                              ),
                            ],
                          ),
                          visible: _getButtonState4(model.C2cOrderlDetailModel.orderInfo.status,model.C2cOrderlDetailModel.orderInfo.side),

                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            securityHint2(),
                            Container(
                              height: height(20),
                              color: Color(0xffF4F4F4),
                            ),
                          ],
                        ),
                        Visibility(
                          child: Column(
                            children: [
                              securityHint(),
                              Container(
                                height: height(20),
                                color: Color(0xffF4F4F4),
                              ),
                            ],
                          ),
                          visible: true,
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  child: GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: height(88),
                      color: kPrimaryColor,
                      child: Text(
                        _getbutton(model.C2cOrderlDetailModel.orderInfo.status,model.C2cOrderlDetailModel.orderInfo.side, model.C2cOrderlDetailModel.orderInfo.side == 'BUY' ? model.C2cOrderlDetailModel.orderInfo.limitPayTime:model.C2cOrderlDetailModel.orderInfo.limitFinishTime),
                        style: TextStyle(color: kWhite),
                      ),
                    ),
                    onTap: () {
                          if(model.C2cOrderlDetailModel.orderInfo.side == 'BUY'){
                            ConfirmPayment(context,model);
                          }else{
                            ConfirmOrder(context,model);
                          }
                    },
                  ),
                  visible: _getButtonState(model.C2cOrderlDetailModel.orderInfo.status,model.C2cOrderlDetailModel.orderInfo.side),
                ),
              ],
            );
          }),
    );

  }

  ConfirmOrder(BuildContext context,C2cProvider model) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text('${Tr.of(context).c2cConfirmSK}', style: TextStyle(color: Colors.black87)),
            content: Container(
              height: height(160),
              child: Column(
                children: [
                  Text('${Tr.of(context).c2cConfirmSKHint}。',
                      style: TextStyle(
                          color: Color(0xff323232), fontSize: sp(28))),
                  SizedBox(
                    height: height(10),
                  ),
                  Container(
                      decoration: new BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: new BorderRadius.circular((20.0))),
                      height: height(80),
                      child: TextField(
                        controller: _PwdCtr,
                        focusNode: _PwdFocus,
                        cursorColor: Color(0xff909090),
                        autofocus: false,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        style: TextStyle(
                            color: Color(0xff323232), fontSize: sp(28)),
                        decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: width(20)),
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixStyle: TextStyle(color: Colors.black),
                            hintText: '${Tr.of(context).miningEnterHint}',
                            hintStyle: TextStyle(
                                color: Color(0xff909090),
                                fontSize: sp(28))),
                      ))
                ],
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                  child: Text('${Tr.of(context).cancel}',
                      style: TextStyle(
                          color: Color(0xff909090), fontSize: sp(28))),
                  color: Color(0xffD8D8D8),
                  onPressed: () => Navigator.of(context).pop(true)),
              RaisedButton(
                  child: Text('${Tr.of(context).c2cConfirmSK}'),
                  color: Color(0xff126DFF),
                  onPressed: () {
                    Toast.showLoading('loading...');
                    C2cServer. getConfirmOrder(widget.id,_PwdCtr.text).then((value){
                      Navigator.of(context).pop(false);
                      Toast.showSuccess('${Tr.of(context).c2cCompletedOrder}');
                      model.getC2cOrderDetail(widget.id);
                    });
                  }),
            ]));
  }

  CancelOrder(BuildContext context,C2cProvider model) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text('${Tr.of(context).c2cCancelOrder}', style: TextStyle(color: Colors.black87)),
            content: Text('${Tr.of(context).c2cCancelOrderHint2}？',
                style: TextStyle(color: Colors.black87)),
            actions: <Widget>[
              RaisedButton(
                  child: Text('${Tr.of(context).c2cCancelOrderHint3}',
                      style: TextStyle(
                          color: Color(0xff909090), fontSize: sp(28))),
                  color: Color(0xffD8D8D8),
                  onPressed: () => Navigator.of(context).pop(true)),
              RaisedButton(
                  child: Text('${Tr.of(context).c2cCancelOrder}'),
                  color: Color(0xff126DFF),
                  onPressed: () {
    Toast.showLoading('loading...');

    C2cServer. getCancel(widget.id).then((value){
      Navigator.of(context).pop(false);
      Toast.showSuccess('${Tr.of(context).c2cCancelSuccess}');
      model.getC2cOrderDetail(widget.id);
      Application.eventBus.fire(c2cOrderHistoryEvent());

    });
    } ),
            ]));
  }



  ConfirmPayment(BuildContext context,C2cProvider model) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text('${Tr.of(context).c2cConfirmPayment}', style: TextStyle(color: Colors.black87)),
            content: Text('${Tr.of(context).c2cConfirmPaymentHint}。',
                style: TextStyle(color: Color(0xff323232), fontSize: sp(28))),
            actions: <Widget>[
              RaisedButton(
                  child: Text('${Tr.of(context).cancel}',
                      style: TextStyle(
                          color: Color(0xff909090), fontSize: sp(28))),
                  color: Color(0xffD8D8D8),
                  onPressed: () => Navigator.of(context).pop(true)),
              RaisedButton(
                  child: Text('${Tr.of(context).c2cConfirmPaymentHint2}'),
                  color: Color(0xff126DFF),
                  onPressed: (){
                    Toast.showLoading('loading...');

                    C2cServer.getConfirmPay(widget.id, model.C2cOrderlDetailModel.paymentAccount[0].paymentMethod).then((value){
                      Navigator.of(context).pop(false);
                      Toast.showSuccess('${Tr.of(context).c2cPaymentConfirmed}');
                      //   _numCtr.text = '';
                      model.getC2cOrderDetail(widget.id);
                      Application.eventBus.fire(c2cOrderHistoryEvent());
                    } );
                  } ),
            ]));
  }
  //付款方式显示与否
  bool _getButtonState4(int date, String Type) {
    bool button = false;
    if (Type == 'BUY') {
      switch (date) {
        case 0:
          button = true;
          break;
        case 1:
          button = true;
          break;
        case 2:
          button = true;
          break;
        case 4:
          button = true;
          break;
        default:
      }
    } else {
      switch (date) {
        case 0:
          button = true;
          break;
        case 1:
          button = true;
          break;
        case 2:
          button = true;
          break;
        case 4:
          button = true;
          break;
        default:
      }
    }
    return button;
  }
  //取消订单显示与否
  bool _getButtonState3(int date, String Type) {
    bool button = false;
    if (Type == 'BUY') {
      switch (date) {
        case 0:
          button = false;
          break;
        case 1:
          button = false;
          break;
        case 2:
          button = false;
          break;
        case 4:
          button = false;
          break;
        default:
      }
    } else {
      switch (date) {
        case 0:
          button = false;
          break;
        case 1:
          button = false;
          break;
        case 2:
          button = false;
          break;
        case 4:
          button = false;
          break;
        default:
      }
    }
    return button;
  }
  //图片背景订单显示与否

  bool _getButtonState2(int date, String Type) {
    bool button = false;
    if (Type == 'BUY') {
      switch (date) {
        case 0:
          button = true;
          break;
        case 1:
          button = false;
          break;
        case 2:
          button = false;
          break;
        case 4:
          button = true;
          break;
        default:
      }
    } else {
      switch (date) {
        case 0:
          button = true;
          break;
        case 1:
          button = false;
          break;
        case 2:
          button = false;
          break;
        case 4:
          button = true;
          break;
        default:
      }
    }
    return button;
  }
  //按钮显示
  bool _getButtonState(int date, String Type) {
    bool button = false;
    if (Type == 'BUY') {
      switch (date) {
        case 0:
          button = false;
          break;
        case 1:
          button = true;
          break;
        case 2:
          button = false;
          break;
        case 4:
          button = false;
          break;
        default:
      }
    } else {
      switch (date) {
        case 0:
          button = false;
          break;
        case 1:
          button = false;
          break;
        case 2:
          button = true;
          break;
        case 4:
          button = false;
          break;
        default:
      }
    }
    return button;
  }
  String _getbutton(int date, String Type,int m) {
    String button = '';
    int   f  =  m ~/ 60;
    String   mm  =  (m-(f*60)).toString();
     String time= '剩${f}分${mm}秒';

    if (Type == 'BUY') {
      switch (date) {
        case 0:
          button = '';
          break;
        case 1:
          button = '${Tr.of(context).c2cConfirmPaymentHint2}';
          break;
        case 2:
          button = '';
          break;
        case 4:
          button = '';
          break;
        default:
      }
    } else {
      switch (date) {
        case 0:
          button = '';
          break;
        case 1:
          button = '';
          break;
        case 2:
          button = '${Tr.of(context).c2cConfirmSK}';
          break;
        case 4:
          button = '';
          break;
        default:
      }
    }
    return button;
  }
  String _getState(int date, String Type) {
    String State = '';

    if (Type == 'BUY') {
      switch (date) {
        case 0:
          State = '${Tr.of(context).c2cCancelled}';
          break;
        case 1:
          State = '${Tr.of(context).c2cPaymentPaid}';
          break;
        case 2:
          State = '${Tr.of(context).c2cAlreadyPaid}';
          break;
        case 4:
          State = '${Tr.of(context).assetcompleted}';
          break;
        default:
      }
    } else {
      switch (date) {
        case 0:
          State = '${Tr.of(context).c2cCancelled}';
          break;
        case 1:
          State = '${Tr.of(context).c2cPaymentPaid}';
          break;
        case 2:
          State = '${Tr.of(context).c2cConfirmed}';
          break;
        case 4:
          State = '${Tr.of(context).assetcompleted}';
          break;
        default:
      }
    }
    return State;
  }
  String  _getTime (int m){
    String   date = '';
    int   f  =  m ~/ 60;
    String   mm  =  (m-(f*60)).toString();
    date= '剩${f}分${mm}秒';
    return date;
  }
  state(int state) {
    return Container(
      width: double.infinity,
      height: height(200),
      //设置背景图片
      decoration: new BoxDecoration(
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: new AssetImage('images/c2c/state_bg.png'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          state == 0
              ? Image.asset(
                  'images/c2c/cancel.png',
                  width: width(88),
                  height: height(88),
                )
              : Image.asset(
                  'images/c2c/complete.png',
                  width: width(88),
                  height: height(88),
                ),
          SizedBox(width: width(20)),
          Text(
            state == 0 ? '${Tr.of(context).c2cCancelled}' : '${Tr.of(context).assetcompleted}',
            style: TextStyle(color: kWhite),
          ),
        ],
      ),
    );
  }

  payment() {
    return Container(
      padding: EdgeInsets.only(
        left: width(20),
        right: width(20),
      ),
      child: Column(
        children: [
          FocusWidget(
            focusNode: _idTypeFocus,
            child: InputWidget(
              maxHeight: 100,
              textAlign: TextAlign.right,
              focusNode: _idTypeFocus,
              onTab: () {
             /*   return showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return PayMentTypeWidget(
                      typeList: typeList,
                      onTab: (index, name) {
                        print(name);
                        setState(() {
                          type = index;
                          for (int i = 0; i < account.length; i++) {
                            if(account[i].type == type){
                              accounts = account[i];
                            }
                          }
                        });

                        print(type);
                        Routers.goBack(context);
                      },
                    );
                  },
                );*/
              },
              controller: _idTypeCtr,
              prefixIconConstraintsMaxWidth: 350,
              prefixIconConstraintsMinWidth: 150,
              prefixIconConstraintsMinHeight: 50,
              prefixIconConstraintsMaxHeight: 50,
              suffixIconConstraintsMaxHeight: 50,
              suffixIconConstraintsMaxWidth: 250,
              suffixIconConstraintsMinHeight: 50,
              suffixIconConstraintsMinWidth: 150,
              readOnly: true,
              suffixIcon: Container(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image.asset(
                      type==0 ? 'images/c2c/bank.png':(type==1 ? 'images/c2c/alipay.png':'images/c2c/wchat.png'),
                      width: width(28),
                    ),
                    SizedBox(width: width(20)),
                  Text(type==0 ?'${Tr.of(context).c2cBank}' :(type==1 ? '${Tr.of(context).c2cAlipay}':'${Tr.of(context).WeChat}')),
                    SizedBox(width: width(20)),
                /*    Image.asset(
                      'images/mine/next.png',
                      width: width(12),
                      color: Color(0xff323232),
                    ),*/
                  ],
                ),
              ),
              contentPadding: EdgeInsets.only(top: height(5)),
              hintStyle: TextStyle(color: Color(0xff323232), fontSize: sp(28)),
              prefixIcon: Container(
                child: Text('${Tr.of(context).c2cPaymentMethod2}', style: TextStyle(color: Colors.black)),
              ),
              hintText: null,
            ),
          ),
        ],
      ),
    );
  }

  PaymentType(int type,PaymentAccount model) {
    return Column(
      children: [
        Visibility(
          child: Padding(
              padding: EdgeInsets.only(
                left: width(20),
                right: width(20),
              ),
              child: Container(
                height: height(60),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('${Tr.of(context).c2cPaymentBank}',
                          style: TextStyle(
                              fontSize: sp(28), color: Color(0xff9E9E9E))),
                    ),
                    Text('${model?.paymentBank ??''}',
                        style: TextStyle(
                            fontSize: sp(28), color: Color(0xff323232))),
                  ],
                ),
              )),
          visible: type == 0,
        ),
        Padding(
            padding: EdgeInsets.only(
              left: width(20),
              right: width(20),
            ),
            child: Container(
              height: height(60),
              child: Row(
                children: [
                  Expanded(
                    child: Text('${Tr.of(context).c2cPaymentUser}',
                        style: TextStyle(
                            fontSize: sp(28), color: Color(0xff9E9E9E))),
                  ),
                  Text('${model?.paymentName??''}',
                      style: TextStyle(
                          fontSize: sp(28), color: Color(0xff323232))),
                ],
              ),
            )),
        Padding(
            padding: EdgeInsets.only(
              left: width(20),
              right: width(20),
            ),
            child: Container(
              height: height(60),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                        type == 0 ? '${Tr.of(context).c2cBankCardNumber}' : (type == 1 ? '${Tr.of(context).c2cAlipayAccount}' : '${Tr.of(context).c2cWeChatAccount}'),
                        style: TextStyle(
                            fontSize: sp(28), color: Color(0xff9E9E9E))),
                  ),
                  Text('${model?.paymentAccount??''}',
                      style: TextStyle(
                          fontSize: sp(28), color: Color(0xff323232))),
                ],
              ),
            )),
        Visibility(
          child: Padding(
              padding: EdgeInsets.only(
                left: width(20),
                right: width(20),
              ),
              child: Container(
                height: height(60),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('${Tr.of(context).c2cAffiliatedBranch}',
                          style: TextStyle(
                              fontSize: sp(28), color: Color(0xff9E9E9E))),
                    ),
                    Text('${model?.paymentMethod??''}',
                        style: TextStyle(
                            fontSize: sp(28), color: Color(0xff323232))),
                  ],
                ),
              )),
          visible: false,
        ),
        Visibility(
          child: Padding(
              padding: EdgeInsets.only(
                left: width(20),
                right: width(20),
              ),
              child: Container(
                height: height(60),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('${Tr.of(context).c2cReceivingQRCode}',
                          style: TextStyle(
                              fontSize: sp(28), color: Color(0xff9E9E9E))),
                    ),
                    Image.network(
                      '${model?.qrCode}',
                      width: width(176),
                      height: height(176),
                    ),
                  ],
                ),
              )),
          visible: type != 0,
        ),
        SizedBox(
          height: height(20),
        ),
      ],
    );
  }

  securityHint() {
    return Container(
      constraints: BoxConstraints(

        minWidth: 230,

        minHeight: 170,

      ),
      margin: EdgeInsets.only(left: width(20), right: width(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height(20),
          ),
          Text('${Tr.of(context).c2cTradHint}',
              style: TextStyle(fontSize: sp(28), color: Color(0xff323232))),
          SizedBox(
            height: height(20),
          ),
          Text('${Tr.of(context).c2cTradHint2}',
              style: TextStyle(fontSize: sp(28), color: Color(0xff323232))),
          SizedBox(
            height: height(20),
          ),
          Text('${Tr.of(context).c2cTradHint3}。',
              style: TextStyle(fontSize: sp(28), color: Color(0xff323232))),
          SizedBox(
            height: height(20),
          ),
        ],
      ),
    );
  }
  securityHint2() {
    return Container(
      constraints: BoxConstraints(

        minWidth: 230,

        minHeight: 170,

      ),
      margin: EdgeInsets.only(left: width(20), right: width(20)),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(
            height: height(20),
          ),
          Text('${Tr.of(context).assetTips}',
              style: TextStyle(fontSize: sp(28), color: Color(0xff323232))),
          SizedBox(
            height: height(20),
          ),
          Text('${Tr.of(context).c2cContactTip}',
              style: TextStyle(fontSize: sp(28), color: Color(0xff323232))),
          SizedBox(
            height: height(20),
          ),
          Text('${Line} ${LineNumber}',
              style: TextStyle(fontSize: sp(28), color: Color(0xff323232))),
          SizedBox(
            height: height(20),
          ),
          Text('${Telogram} ${TelogramNumber}',
              style: TextStyle(fontSize: sp(28), color: Color(0xff323232))),
          SizedBox(
            height: height(20),
          ),
          Text('${Whatapp} ${LineNumber}',
              style: TextStyle(fontSize: sp(28), color: Color(0xff323232))),
          SizedBox(
            height: height(20),
          ),
        ],
      ),
    );
  }

  void _inita(C2cProvider model) {
    var s = model.C2cOrderlDetailModel.orderInfo.symbol?.split('/');
    coin =   s[0];
    currency =   s[1];

    print('coin:${coin}');
    print('currency:${currency}');
  }

  void getOrderDetail() async{
    List<ContactServerModel> res = await C2cServer.getContactServer();
    for (int i = 0; i < res.length; i++) {
    setState(() {
     if(i==1){
       Line=res[i].name;
       LineNumber=res[i].value;

     }else if(i==2){
       Telogram=res[i].name;
       TelogramNumber=res[i].value;

     }else{
       Whatapp=res[i].name;
       WhatappNumber=res[i].value;
     }
   });
    }
  }

}


class PayMentTypeWidget extends StatelessWidget {
  final Function(int type, String name) onTab;
  final List typeList;

  const PayMentTypeWidget({Key key, this.onTab, this.typeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(350),
      child: Column(
        children: <Widget>[
          Column(
              children: typeList
                  .map((e) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => {onTab(e['id'], e['name'])},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.5, color: Color(0xffcccccc)))),
                          margin: EdgeInsets.symmetric(horizontal: width(40)),
                          child: Row(
                            children: [
                              e['id'] == 0
                                  ? Image.asset(
                                      'images/c2c/bank.png',
                                      width: width(40),
                                      height: height(40),
                                    )
                                  : (e['id'] == 1
                                      ? Image.asset(
                                          'images/c2c/alipay.png',
                                          width: width(40),
                                          height: height(40),
                                        )
                                      : Image.asset(
                                          'images/c2c/wchat.png',
                                          width: width(40),
                                          height: height(40),
                                        )),
                              SizedBox(
                                width: width(20),
                              ),
                              Text(e['name']),
                            ],
                          ),
                          height: height(80),
                          alignment: Alignment.centerLeft,
                        ),
                      ))
                  .toList()),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {Navigator.pop(context)},
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 0.5, color: Color(0xffcccccc)))),
              margin: EdgeInsets.symmetric(horizontal: width(40)),
              child: Text(Tr.of(context).cancel,
                  style: TextStyle(color: Colors.blue)),
              height: height(80),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
