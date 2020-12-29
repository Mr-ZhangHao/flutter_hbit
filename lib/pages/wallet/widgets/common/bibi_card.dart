import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/pages/wallet/provider/index.dart';
import 'package:HBit/pages/wallet/routes/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart'hide Router;
import 'package:provider/provider.dart';


class BibiCardWidget extends StatelessWidget {
  final WallerProvider model;
  const BibiCardWidget({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: height(60), horizontal: width(72)),
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/mine/Mask@2x.png"), fit: BoxFit.fill)),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                /*    Container(
                      height: width(36),
                      width: width(36),
                      child: Image.asset('images/mine/hb@2x.png',
                          fit: BoxFit.contain, width: width(36), height: height(36)),
                    ),*/
                    Container(
                      padding: EdgeInsets.only(left: width(8)),
                      child: Text('${Tr.of(context).assetValuationcoin}（USDT）：',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: sp(32), height: 1.1)),
                    )
                  ],
                ),
                Container(
                  height: height(28),
                  width: width(48),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      model.setIsOpen(!model.isOpen);
                    },
                    child: Image.asset(model.isOpen ? 'images/mine/see.png' : 'images/mine/hide2.png',
                        fit: BoxFit.contain, width: width(48), height: height(28)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, height(6), 0, height(16)),
            alignment: Alignment.centerLeft,
            child: Text(model.isOpen ? Utils.cutZero(model.assetPreview?.total ?? 0) ?? '--.--' : '****',
                textAlign: TextAlign.left,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: sp(64), height: 1.1, letterSpacing: -2)),
          ),
         /* Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, height(32)),
            margin: EdgeInsets.only(bottom: height(30)),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color.fromARGB(600, 255, 255, 255), width: width(1)))),
            alignment: Alignment.centerLeft,
            child: Text(model.isOpen ? '≈${Utils.cutZero(model.assetPreview?.totalCny ?? 0)} CNY' ?? '--.--' : '****',
                textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: sp(24), height: 1.1)),
          ),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Routers.push(context, "${WalletRouter.recharge}?coinName=USDT"),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: width(40),
                      width: width(40),
                      child: Image.asset('images/mine/icon1.png',
                          fit: BoxFit.contain, width: width(40), height: height(40)),
                    ),
                    Container(
                      child: Text('${Tr.of(context).assetRecharge}',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: sp(28), height: 1.1)),
                    )
                  ],
                ),
              )),
              Container(
                  child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Routers.push(context, "${WalletRouter.withdrawDetail}?coinName=USDT"),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: width(40),
                      width: width(40),
                      child: Image.asset('images/mine/icon2.png',
                          fit: BoxFit.contain, width: width(40), height: height(40)),
                    ),
                    Container(
                      child: Text('${Tr.of(context).assetWithdrawal}',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: sp(28), height: 1.1)),
                    )
                  ],
                ),
              )),
 /*             Container(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Routers.push(context, WalletRouter.transformation),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: width(40),
                        width: width(40),
                        child: Image.asset('images/mine/icon3.png',
                            fit: BoxFit.contain, width: width(40), height: height(40)),
                      ),
                      Container(
                        child: Text('${Tr.of(context).assetTransfer}',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white, fontSize: sp(28), height: 1.1)),
                      ),
                    ],
                  ),
                ),
              ),*/
              Container(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                   // Provider.of<WallerProvider>(context, listen: false).getCoinList(coinName: 'HBIT');

                    Routers.push(context, WalletRouter.Mining);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: width(40),
                        width: width(40),
                        child: Image.asset('images/mine/icon8.png',
                            fit: BoxFit.contain, width: width(40), height: height(40)),
                      ),
                      Container(
                        child: Text('${Tr.of(context).Mining}',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white, fontSize: sp(28), height: 1.1)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
