import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/pages/wallet/provider/index.dart';
import 'package:HBit/pages/wallet/routes/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart'hide Router;


class ContractCardWidget2 extends StatelessWidget {
  final WallerProvider model1;
  final ContractAssetProvider model2;
  const ContractCardWidget2({Key key, this.model1, this.model2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: height(40), horizontal: width(72)),
      margin: EdgeInsets.symmetric(horizontal: width(32), vertical: width(24)),
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/mine/mask3.png"), fit: BoxFit.fill)),
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
                    Container(
                      height: width(36),
                      width: width(36),
                      child: Image.asset('images/mine/hb@2x.png',
                          fit: BoxFit.contain, width: width(36), height: height(36)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: width(8)),
                      child: Text('${Tr.of(context).assetValuationcoincontract}（USDT）：',
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
                      model2.setIsOpen(!model2.isOpen);
                    },
                    child: Image.asset(model2.isOpen ? 'images/mine/see.png' : 'images/mine/hide2.png',
                        fit: BoxFit.contain, width: width(48), height: height(28)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, height(6), 0, height(16)),
            alignment: Alignment.centerLeft,
            child: Text(model2.isOpen ? Utils.cutZero(model2.contractWalletInfo?.totalWorth ?? 0) ?? '--.--' : '****',
                textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: sp(64), height: 1.1)),
          ),
    /*      Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, height(32)),
            margin: EdgeInsets.only(bottom: height(30)),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color.fromARGB(1000, 255, 255, 255), width: width(1)))),
            alignment: Alignment.centerLeft,
            child: Text(
                model2.isOpen
                    ? '≈${Utils.cutZero((model2.contractWalletInfo?.totalWorth ?? 0) * (model2.contractWalletInfo?.exRate ?? 0))} CNY'
                    : "****",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: sp(24), height: 1.1)),
          ),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    model2.setCurrentCoin('USDT');
                    model1.setCurrentCoin('USDT');
                    Routers.push(context, WalletRouter.transformation);
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: width(14)),
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
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ContractCardWidget extends StatelessWidget {
  final WallerProvider model;
  const ContractCardWidget({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: height(40), horizontal: width(72)),
      margin: EdgeInsets.symmetric(horizontal: width(32), vertical: width(24)),
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/mine/mask3.png"), fit: BoxFit.fill)),
      // padding: EdgeInsets.symmetric(vertical: height(60), horizontal: width(72)),
      // decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/mine/Mask@2x.png"), fit: BoxFit.fill) ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: width(8)),
            child: Text('${Tr.of(context).assetValuationcoincontract}（USDT）',
                textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: sp(32), height: 1.1)),
          ),
          Container(
            margin: EdgeInsets.only(top: height(40), bottom: height(26)),
            child: Text('${Tr.of(context).assetNonactivated}',
                textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: sp(60), height: 1.1)),
          ),
          Visibility(child:   Container(
            height: height(72),
            width: width(264),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: new Border.all(
                  width: 1.0,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(Radius.circular(width(8)))),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              //  onTap: () =>  Routers.push(context, WalletRouter.contract),
              child: Text('${Tr.of(context).assetActivation}',
                  textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: sp(24), height: 1.1)),
            ),
          ),visible: false,)
        ],
      ),
    );
  }
}
