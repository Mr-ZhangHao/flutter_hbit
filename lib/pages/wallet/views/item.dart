/*
* @message: 登录
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Jack
* @LastEditTime: 2020-08-13 16:52:53
* @Deprecated: 否
* @FilePath: /archimedes/lib/pages/mine/views/account.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/pages/wallet/model/coin_info_model.dart';
import 'package:HBit/pages/wallet/provider/index.dart';
import 'package:HBit/pages/wallet/routes/index.dart';
import 'package:HBit/providers/gloable_provider.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'hide Router;

import 'package:HBit/utils/screen.dart';
import 'package:HBit/constants/index.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget {
  final String coinName;
  ItemPage({Key key, this.coinName}) : super(key: key);

  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<ItemPage> {
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
        brightness: Brightness.light,
        title: Text(widget.coinName, style: TextStyle(color: kTextColor3, fontSize: sp(36))),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(border: Border(top: BorderSide(color: kLineColor1, width: width(1)))),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              height: height(108),
              margin: EdgeInsets.only(top: height(26)),
              padding: EdgeInsets.symmetric(horizontal: width(28)),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: kLineColor1, width: width(1)))),
              child: Consumer<WallerProvider>(
                builder: (BuildContext context, WallerProvider model, Widget child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TopItemWidget(
                        title: '${Tr.of(context).tradrAvailable}',
                        number: Utils.cutZero(model.currentCoin.available ?? 0),
                        align: TextAlign.left,
                      ),
                      TopItemWidget(
                        title: '${Tr.of(context).assetFreeze}',
                        number: Utils.cutZero(model.currentCoin.disabled ?? 0),
                        align: TextAlign.right,
                      ),
                  /*    TopItemWidget(
                        title: '${Tr.of(context).assetConvertedamount}',
                        number: "￥${Utils.cutZero(model.currentCoin.cny ?? 0)}",
                        align: TextAlign.right,
                      ),*/
                    ],
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: width(28), vertical: height(40)),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: kLineColor1, width: width(1)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  widget.coinName == 'HBIT' ? Container(width: 0, height: 0): Expanded(
                    child: IconItemWidget(
                      icon: 'images/mine/icon4.png',
                      title: '${Tr.of(context).assetRecharge}',
                      onTab: () => Routers.push(context, "${WalletRouter.recharge}?coinName=${widget.coinName}"),
                    ),
                  ),
                  widget.coinName == 'HBIT' ? Container(width: 0, height: 0):Expanded(
                    child: IconItemWidget(
                      icon: 'images/mine/icon5.png',
                      title: '${Tr.of(context).assetWithdrawal}',
                      onTab: () {
                        Routers.pushResult(context, "${WalletRouter.withdrawDetail}?coinName=${widget.coinName}",
                            (result) {
                          Provider.of<WallerProvider>(context, listen: false).setCurrentCoin(widget.coinName);
                        });
                      },
                    ),
                  ),
              /*    widget.coinName == 'USDT'
                      ? Expanded(
                          child: IconItemWidget(
                            icon: 'images/mine/icon6.png',
                            title: '${Tr.of(context).assetTransfer}',
                            onTab: () {
                              Provider.of<WallerProvider>(context, listen: false).setCurrentCoin('USDT');
                              Provider.of<ContractAssetProvider>(context, listen: false).setCurrentCoin('USDT');
                              Routers.push(context, WalletRouter.transformation);
                            },
                          ),
                        )
                      : Container(width: 0, height: 0),*/
                  Expanded(
                    child: IconItemWidget(
                      icon: 'images/mine/icon7.png',
                      title: '${Tr.of(context).assetTotrade}',
                      onTab: () {
                        CoinInfoModel currentCoin = Provider.of<WallerProvider>(context, listen: false).currentCoin;
                        if (currentCoin.coin.isSpot == 1) {
                          Routers.goBack(context);
                          Provider.of<GloableProvider>(context, listen: false).setCurrIndex(2);
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class IconItemWidget extends StatelessWidget {
  const IconItemWidget({
    Key key,
    this.icon,
    this.title,
    this.onTab,
  }) : super(key: key);

  final String icon;
  final String title;
  final Function onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTab,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: width(52),
            width: width(44),
            child: Image.asset(icon, fit: BoxFit.contain, width: width(52), height: height(44)),
          ),
          Container(
            width: width(80),
            margin: EdgeInsets.only(top: height(10)),
            alignment: Alignment.center,
            child: Text(title,
                textAlign: TextAlign.center, style: TextStyle(color: kTextColor9, fontSize: sp(24), height: 1.42)),
          ),
        ],
      ),
    );
  }
}

class TopItemWidget extends StatelessWidget {
  const TopItemWidget({
    Key key,
    this.title,
    this.number,
    this.align,
  }) : super(key: key);

  final String title;
  final String number;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text(title,
              textAlign: TextAlign.left, style: TextStyle(color: kTextColor7, fontSize: sp(24), height: 1.1)),
        ),
        Container(
          margin: EdgeInsets.only(top: height(12)),
          alignment: Alignment.centerLeft,
          child: Text(number,
              textAlign: align,
              style: TextStyle(
                  color: kTextColor5, fontSize: sp(32), letterSpacing: -1, height: 1.1, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
