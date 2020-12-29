import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/wallet/model/coin_info_model.dart';
import 'package:HBit/pages/wallet/provider/index.dart';
import 'package:HBit/pages/wallet/routes/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart'hide Router;

import 'package:provider/provider.dart';

class CoinListItemWidget extends StatelessWidget {
  final CoinInfoModel model;
  const CoinListItemWidget({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: height(200),
      margin: EdgeInsets.fromLTRB(width(24), height(20), width(24), 0),
      padding: EdgeInsets.symmetric(vertical: height(28), horizontal: width(28)),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(width(20)), boxShadow: [
        BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, height(8)), //阴影xy轴偏移量
            blurRadius: 20.0, //阴影模糊程度
            spreadRadius: 1.0 //阴影扩散程度
            )
      ]),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Provider.of<WallerProvider>(context, listen: false).setCurrentCoin(model.coin.name);
          Routers.push(context, "${WalletRouter.item}?coinName=${model.coin.name}");
        },
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(model.coin.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: kTextColor8, fontSize: sp(32), height: 1.1, fontWeight: FontWeight.bold)),
                ),
                Container(
                  height: width(16),
                  width: width(32),
                  child:
                      Image.asset('images/mine/pointer.png', fit: BoxFit.contain, width: width(16), height: height(32)),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: height(26)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text('${Tr.of(context).tradrAvailable}',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: kTextColor7, fontSize: sp(24), height: 1.1)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: height(12)),
                        alignment: Alignment.centerLeft,
                        child: Consumer<WallerProvider>(
                          builder: (BuildContext context, WallerProvider value, Widget child) {
                            return Text(value.isOpen ? Utils.cutZero(model.available) : "****",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: kTextColor5,
                                    fontSize: sp(32),
                                    height: 1.1,
                                    letterSpacing: -1.2,
                                    fontWeight: FontWeight.bold));
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text('${Tr.of(context).assetFreeze}',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: kTextColor7, fontSize: sp(24), height: 1.1)),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: height(12)),
                          alignment: Alignment.centerLeft,
                          child: Consumer<WallerProvider>(
                            builder: (BuildContext context, WallerProvider value, Widget child) {
                              return Text(value.isOpen ? Utils.cutZero(model.disabled) : "****",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: kTextColor5,
                                      fontSize: sp(32),
                                      height: 1.1,
                                      letterSpacing: -1.2,
                                      fontWeight: FontWeight.bold));
                            },
                          )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text('${Tr.of(context).assetConvertedamount}',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: kTextColor7, fontSize: sp(24), height: 1.1)),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: height(12)),
                          alignment: Alignment.centerRight,
                          child: Consumer<WallerProvider>(
                            builder: (BuildContext context, WallerProvider value, Widget child) {
                              return Text(
                                  value.isOpen ? Utils.cutZero(model.disabled) : "****",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: kTextColor5,
                                      fontSize: sp(32),
                                      height: 1.1,
                                      letterSpacing: -1.2,
                                      fontWeight: FontWeight.bold));
                            },
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
