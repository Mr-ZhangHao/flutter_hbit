import 'package:HBit/common/event/c2cListEvent.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/refresh/page_list.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/c2c/model/C2cCurrency_model.dart';
import 'package:HBit/pages/c2c/model/C2cList_model.dart';
import 'package:HBit/pages/c2c/routes/index.dart';
import 'package:HBit/pages/c2c/server/index.dart';
import 'package:HBit/pages/mine/model/rate_model.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/routes/application.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HBit/pages/mine/routes/index.dart';
import 'package:provider/provider.dart';
import 'package:HBit/pages/c2c/provider/index.dart';

class C2cListPage extends PageList {
  final int indexs;
  final int id;
  final String coin;
  final String name;
  int PaymentType;
  int currencyID;
  C2cCurrencyModel currencyModel;

  C2cListPage(this.indexs, this.id, this.name, this.coin, this.currencyModel,
      this.currencyID, this.PaymentType,
      {Key key})
      : super(key: key);

  @override
  _C2cListPageState createState() => _C2cListPageState();
}

class _C2cListPageState extends PageListState<C2cListModel, C2cListPage> {

  int PaymentType;
  int currencyID;
  List<C2cCurrencyModel> c2cCurrencyModel = [];
  String selectCurrency = 'TWD';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildList(context),
    );
  }

  @override
  void initState() {
    super.initState();
    c2cCurrencyModel= Provider.of<C2cProvider>(context, listen: false)
        .c2cCurrencyModel;
    for (int i = 0; i < c2cCurrencyModel
        .length; i++) {
      if (c2cCurrencyModel[i].currency == selectCurrency) {
        setState(() {
          currencyID = c2cCurrencyModel[i].id;
          (widget as C2cListPage).currencyModel = c2cCurrencyModel[i];
        });

      }

    }
    loadData(1);

    //监听事件总线上数据变化
    Application.eventBus.on<c2cListEvent>().listen((event) {
      if (mounted) {
        setState(() {
          currencyID = event.currencyID;
          PaymentType = event.PaymentType;
          (widget as C2cListPage).currencyModel = event.currencyModel;
          loadData(1);
          Provider.of<C2cProvider>(context, listen: false).getPaymentBindDetail(currencyID.toString());

        });
      }
    });
  }

  ///加载数据
  @override
  loadPage(
      {int page,
      Function(List<C2cListModel>) onSuccess,
      Function onErr}) async {
    try {
      List<C2cListModel> data = await C2cServer.getC2cList({
        "coin_id": '${(widget as C2cListPage).id}',
        "currency_id": currencyID,
        "type":PaymentType,
        "side": (widget as C2cListPage).indexs == 0 ? 'SELL' : 'BUY',
        "page": page,
        "per_page": 10,
      });
      //  var data = [C2cListModel(), C2cListModel(), C2cListModel()];
      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(C2cListModel model) {
    return Center(
      child: Container(
          height: height(280),
          margin: EdgeInsets.only(
            left: width(20),
            right: width(20),
          ),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.5, color: kDividerColor))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(model.symbol,
                        style: TextStyle(
                            fontSize: sp(32),
                            color: Color(0xff323232),
                            fontWeight: FontWeight.bold)),
                  ),
      /*            Text('${Tr.of(context).klineVOL}',
                      style: TextStyle(
                          fontSize: sp(28), color: Color(0xff9e9e9e))),
                  Text('${model.orderCount};',
                      style: TextStyle(
                          fontSize: sp(28), color: Color(0xffFF843B))),
                  SizedBox(
                    width: width(5),
                  ),
                  Text('${Tr.of(context).c2cRate}',
                      style: TextStyle(
                          fontSize: sp(28), color: Color(0xff9e9e9e))),
                  Text('${model.finishPercent}',
                      style: TextStyle(
                          fontSize: sp(28), color: Color(0xffFF843B))),*/
                ],
              ),
              SizedBox(
                height: height(10),
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text('${Tr.of(context).TradrQuantity}',
                            style: TextStyle(
                                fontSize: sp(28), color: Color(0xff9e9e9e))),
                        SizedBox(
                          width: width(10),
                        ),
                        Text('${model.number.toString()}',
                            style: TextStyle(
                                fontSize: sp(28),
                                color: Color(0xff323232),
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Text('${model.price} ',
                      style: TextStyle(
                          fontSize: sp(40), color: Color(0xff323232))),
                  Text('${(widget as C2cListPage).currencyModel.currency ?? ""}',
                      style: TextStyle(
                          fontSize: sp(24), color: Color(0xff9e9e9e))),
                ],
              ),
              SizedBox(
                height: height(10),
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text('${Tr.of(context).c2cLimit}',
                            style: TextStyle(
                                fontSize: sp(28), color: Color(0xff9e9e9e))),
                        SizedBox(
                          width: width(10),
                        ),
                        Text(
                            '${model.minCny}-${model.maxCny} ${(widget as C2cListPage).currencyModel.currency?? ""} ',
                            style: TextStyle(
                                fontSize: sp(28), color: Color(0xffD45151)))
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height(10),
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(

                      children: [
                        Image.asset('images/c2c/bank.png',
                            width: width(68), height: height(40))
                       /* Visibility(
                          child: Image.asset('images/c2c/bank.png',
                              width: width(68), height: height(40)),
                          visible: model.bank == 1,
                        ),
                        SizedBox(
                          width: width(10),
                        ),
                        Visibility(
                          child: Image.asset('images/c2c/alipay.png',
                              width: width(40), height: height(40)),
                          visible: model.alipay == 1,
                        ),
                        SizedBox(
                          width: width(10),
                        ),
                        Visibility(
                          child: Image.asset('images/c2c/wchat.png',
                              width: width(40), height: height(40)),
                          visible: model.wechat == 1,
                        ),*/
                      ],
                    ),
                  ),

                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: (widget as C2cListPage).indexs == 0
                              ? Color(0xffFF4C4C)
                              : Color(0xff00B768),
                          borderRadius: BorderRadius.circular(width(10))),
                      width: width(120),
                      height: height(60),
                      alignment: Alignment.center,
                      child: Text(
                          (widget as C2cListPage).indexs == 0
                              ? '${Tr.of(context).c2cBuy}'
                              : '${Tr.of(context).c2cSell}',
                          style: TextStyle(
                              fontSize: sp(28), color: Color(0xffffffff))),
                    ),
                    onTap: () {
                      if(Provider.of<C2cProvider>(context, listen: false).bankBindDetailModel.length==0){
                        showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text(''),
                                content: Text('${Tr.of(context).bankCardHint}'),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: Text('${Tr.of(context).cancel}',
                                        style: TextStyle(color: Color(0xff909090))),
                                    onPressed: () => Routers.goBack(context),
                                  ),
                                  CupertinoDialogAction(
                                    child: Text('${Tr.of(context).assetSet}',
                                        style: TextStyle(color: kPrimaryColor)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Routers.push(context, C2CRouter.BindPayment);
                                    },
                                  ),
                                ],
                              );
                            });

                      }else{

                      if( Provider.of<MineProvider>(context, listen: false).userInfo.kycStatus==1){

                        if (Provider.of<MineProvider>(context, listen: false).userInfo.payPassword == 0) {
                          Routers.push(context, MineRouter.moneyPsw); // 设置
                        } else {

                        Routers.pushResult(context,
                            "${C2CRouter.orderDeal}?id=${model.id}&type=${(widget as C2cListPage).indexs.toString()}&coin=${(widget as C2cListPage).name.toString()}&currency=${(widget as C2cListPage).currencyModel.currency}&currencyID=${(widget as C2cListPage).currencyModel.id}&number=${model.number}&price=${model.price}",
                                (result) {
                              loadData(1);
                            });
                        }
                      }else{
                        if (Provider.of<MineProvider>(context, listen: false).userInfo.kycStatus == 0) {
                          Routers.push(
                              context, MineRouter.identityType);
                        } else {
                          Routers.push(
                              context, MineRouter.vertifyStatus);
                        }

                        Toast.showSuccess(Tr.of(context). CertificateAuthentication);

                      }

                      }


                    },
                  )
                ],
              ),
            ],
          )),
    );
  }

  @override
  Widget buildFooter() {
    return SizedBox();
  }

  ///默认空页面
  empty() {
    return Center(
        child: Text("${Tr.of(context).homeNodata}",
            style: TextStyle(
                fontSize: sp(32),
                color: Color(0xff999999),
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none)));
  }
}
