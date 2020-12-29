import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/c2c/model/C2cCurrency_model.dart';
import 'package:HBit/pages/c2c/provider/index.dart';
import 'package:HBit/pages/c2c/routes/index.dart';
import 'package:HBit/pages/mine/mine_screen.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BindPaymentPage extends StatefulWidget {
  @override
  _BindPaymentPageState createState() => _BindPaymentPageState();
}

class _BindPaymentPageState extends State<BindPaymentPage> {

  List<C2cCurrencyModel> Coinlist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((mag) {
      Provider.of<C2cProvider>(context, listen: false).getCoinsList();
    });
    Coinlist =
        Provider.of<C2cProvider>(context, listen: false).c2cCurrencyModel;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
          title: Text(Tr.of(context).c2cManagement),
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
        body: Consumer<C2cProvider>(builder: (context, model, child) {
          return Column(children: Coinlist
              .map(
                (e) => Padding(
              padding: EdgeInsets.only(bottom: 4),
              child:MineListItemWidget(
                text: e.chinese+'(${e.currency})',
                image: '',
                onTab: () {

                  print(' BindBank id:'+e.id.toString());
                  Routers.pushResult(context, "${C2CRouter.BindBank}?id=${e.id.toString()}",
                          (result) {

                      });
                },
              ),
            ),
          ).toList(),

      /*      Column(children: [
              MineListItemWidget(
                text: Tr.of(context).c2cBank,
                image: 'images/c2c/bank.png',
                onTab: () {
                  print("modelpaymentInfo:" +
                      model.paymentInfo.bank.length.toString());
                  if (model.paymentInfo.bank.length == 0) {
                    Routers.push(context, C2CRouter.BindBank);
                    Routers.pushResult(context, "${C2CRouter.BindBank}?id=${model.id}",
                            (result) {
                         // loadData(1);
                        });
                  } else {
                    Toast.showText('${Tr.of(context).Bound}');
                  }
                },
              ),
              MineListItemWidget(
                text: Tr.of(context).c2cAlipay,
                image: 'images/c2c/alipay.png',
                onTab: () {
                  print("modelpaymentInfo2:" +
                      model.paymentInfo.alipay.length.toString());

                  if (model.paymentInfo.alipay.length == 0) {
                    Routers.push(context, C2CRouter.BindAliPay);
                  } else {
                    Toast.showText('${Tr.of(context).Bound}');
                  }
                },
              ),
              MineListItemWidget(
                text: Tr.of(context).WeChat,
                image: 'images/c2c/wchat.png',
                onTab: () {
                  print("modelpaymentInfo3:" +
                      model.paymentInfo.alipay.length.toString());

                  if (model.paymentInfo.wechat.length == 0) {
                    Routers.push(context, C2CRouter.BindWeChat);
                  } else {
                    Toast.showText('${Tr.of(context).Bound}');
                  }
                },
              ),
            ])*/
          );
        }));
  }
}
