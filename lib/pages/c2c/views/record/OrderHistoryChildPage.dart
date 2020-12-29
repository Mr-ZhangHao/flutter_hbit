import 'package:HBit/common/event/c2cOrderHistoryEvent.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/refresh/page_list.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/c2c/model/OrderHistoryList_model.dart';
import 'package:HBit/pages/c2c/provider/index.dart';
import 'package:HBit/pages/c2c/routes/index.dart';
import 'package:HBit/pages/c2c/server/index.dart';
import 'package:HBit/routes/application.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class OrderHistoryChildPage extends PageList {
  final int status;
  final int id;
  final int indexs;
  final String sort;

  OrderHistoryChildPage(this.status,this.id, this.indexs,  {Key key,this.sort}) : super(key: key);

  @override
  _OrderHistoryChildPageState createState() => _OrderHistoryChildPageState();
}

class _OrderHistoryChildPageState
    extends PageListState<OrderHistoryListModel, OrderHistoryChildPage> {


  String coin = '';
  String currency = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildList(context),
    );
  }

  @override
  void initState() {
    loadData(1);
    super.initState();
    //监听事件总线上数据变化
    Application.eventBus.on<c2cOrderHistoryEvent>().listen((event) {
      if (mounted) {
        setState(() {

          loadData(1);

        });
      }
    });
  }

  ///加载数据
  @override
  loadPage(
      {int page,
      Function(List<OrderHistoryListModel>) onSuccess,
      Function onErr}) async {
    try {
      List<OrderHistoryListModel> data = await C2cServer.getOrderHistory({
        "status": '${(widget as OrderHistoryChildPage).status}',
       //"coin_id": '${(widget as OrderHistoryChildPage).id}',
      //  "time_sort": (widget as OrderHistoryChildPage).sort,
        "page": page,
        "per_page": 10,
      });
      //  var data = [OrderHistoryListModel(), OrderHistoryListModel()];
      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(OrderHistoryListModel model) {
       _inita(model.symbol);
    return GestureDetector(
      child: Container(
          color: kWhite,
          margin: EdgeInsets.only(
            bottom: height(20),
          ),
          padding: EdgeInsets.only(
            left: width(20),
            right: width(20),
          ),
/*          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.5, color: kDividerColor))),*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height(20),
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text('${model.side.toString()}'
                            ,
                            style: TextStyle(
                                fontSize: sp(28),
                                color:
                                model.side =='BUY'
                                        ? Color(0xffFF4C4C)
                                        : Color(0xff00B768),
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: width(10),
                        ),
                        Text('${model.symbol}',
                            style: TextStyle(
                                fontSize: sp(30),
                                color: Color(0xff323232),
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Text(_getState(model.status,model.side),
                      style: TextStyle(
                          fontSize: sp(28), color: Color(0xffFF7412))),
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
                        Text('${model.number} ${coin}',
                            style: TextStyle(
                                fontSize: sp(28), color: Color(0xff323232)))
                      ],
                    ),
                  ),
                  Text('${double.parse(model.price)  * double.parse(model.number)}',
                      style: TextStyle(
                          fontSize: sp(36),
                          color: Color(0xff323232),
                          fontWeight: FontWeight.bold))
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
                        Text('${Tr.of(context).c2cPrice}',
                            style: TextStyle(
                                fontSize: sp(28), color: Color(0xff9e9e9e))),
                        SizedBox(
                          width: width(10),
                        ),
                        Text('${model.price}',
                            style: TextStyle(
                                fontSize: sp(28), color: Color(0xff323232)))
                      ],
                    ),
                  ),
                  Text('${Tr.of(context).c2cTotalAmount}(${currency})',
                      style:
                          TextStyle(fontSize: sp(28), color: Color(0xff9e9e9e)))
                ],
              ),
              SizedBox(
                height: height(10),
              ),
              Container(
                height: height(1),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.5, color: kDividerColor))),
              ),
              SizedBox(
                height: height(10),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text('${model.createdAt}',
                        style: TextStyle(
                            fontSize: sp(28), color: Color(0xff9e9e9e))),
                  ),
                  Visibility(child:  Text(_getTime(model.limitPayTime),
                      style:
                      TextStyle(fontSize: sp(28), color: Color(0xff323232))),
                  visible: _getButtonState2(model.status,model.side),
                  )
                ],
              ),
              SizedBox(
                height: height(20),
              ),
            ],
          )),
      onTap: () {
        Routers.pushResult(context, "${C2CRouter.c2cOrderDetail}?id=${model.id}",
            (result) {
          loadData(1);
        });
      },
    );

  }
  void _inita(String model) {
    var s = model?.split('/');
    coin =   s[0];
    currency =   s[1];
  }

    String  _getTime (int m){
      String   date = '';
      int   f  =  m ~/ 60;
      String   mm  =  (m-(f*60)).toString();
        date= '剩${f}分${mm}秒';
    return date;
    }

  @override
  Widget buildFooter() {
    return SizedBox();
  }
  //倒计时显示与否
  bool _getButtonState2(int date, String Type) {
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
