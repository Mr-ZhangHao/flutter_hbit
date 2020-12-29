/*
* @message: 登录
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Jack
* @LastEditTime: 2020-08-22 11:25:41
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/wallet/views/recharge.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/pages/wallet/provider/index.dart';
import 'package:HBit/pages/wallet/widgets/common/usdt_type_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/constants/index.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RechargePage extends StatefulWidget {
  final String coinName;
  RechargePage({Key key, this.coinName}) : super(key: key);

  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<RechargePage> {
  GlobalKey _globalKey = GlobalKey();

  String address = '';
  String type = 'ERC20';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((mag) {
      WallerProvider model = Provider.of<WallerProvider>(context, listen: false);
      model.setCurrentCoin(widget.coinName);
      setState(() {
        address =
            widget.coinName == 'USDT' ? model.currentCoin.usdtErc20 ?? 'null' : model.currentCoin.address ?? 'null';
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
        brightness: Brightness.light,
        title: Text('${widget.coinName}${Tr.of(context).assetRecharge}', style: TextStyle(color: kTextColor3, fontSize: sp(36))),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Container(
        constraints: BoxConstraints(minHeight: Screen.designHeight),
        padding: EdgeInsets.symmetric(horizontal: width(40)),
        decoration: new BoxDecoration(color: Colors.white),
        child: Consumer<WallerProvider>(
          builder: (BuildContext context, WallerProvider model, Widget child) {
            return Column(
              children: <Widget>[
                Visibility(
                  visible: widget.coinName == 'USDT',
                  child: ChooseChainTypeWidget(
                    onTab: (value) {
                      print(value);
                      setState(() {
                        type = value;
                      });
                      // 切换币币充值种类
                      if (value == 'ERC20') {
                        setState(() {
                          address = model.currentCoin.usdtErc20 ?? 'null';
                        });
                      } else if (value == 'TRC20') {
                        setState(() {
                          address = model.currentCoin.usdtTrc20;
                        });
                      } else {
                        setState(() {
                          address = model.currentCoin.address;
                        });
                      }
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: height(630),
                  decoration:
                      BoxDecoration(color: Color(0xffF6F9FB), borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: height(60)),
                        height: width(282),
                        width: width(282),
                        child: Container(
                          alignment: Alignment.center,
                          child: RepaintBoundary(
                            key: _globalKey,
                            child: QrImage(
                              data: address,
                              size: width(310),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(0, height(28), 0, height(24)),
                        child: Text('${Tr.of(context).assetWithdrawalHint}', style: TextStyle(color: kTextColor2, fontSize: sp(28), height: 1.1)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, height(20)),
                        child: Text(address, style: TextStyle(color: kTextColor3, fontSize: sp(30), height: 1.1)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: address));
                          Toast.showSuccess(Tr.of(context).copySuccessfully);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: width(230),
                          height: height(70),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(1000, 18, 109, 255),
                              borderRadius: BorderRadius.all(Radius.circular(width(35)))),
                          child: Text('${Tr.of(context).assetCopyaddress}', style: TextStyle(color: Colors.white, fontSize: sp(28), height: 1.1)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height(20)),
                Container(
                  color: Color(0xffF6F9FB),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: height(20)),
                      Text('  ${Tr.of(context).assetTips}',
                          style: TextStyle(fontSize: sp(28), color: Color(0xff323232), fontWeight: FontWeight.bold)),
                      renderTips(model)
                    ],
                  ),
                )
              ],
            );
          },
        ),
      )),
    );
  }

  renderTips(WallerProvider model) {
    if (widget.coinName == 'USDT') {
      if (type == 'ERC20') {
        return Html(data: model.currentCoin.erc20RechargePrompt, style: {
          "p": Style(fontSize: FontSize.medium, color: Color(0xff8C8C8C)),
          "div": Style(fontSize: FontSize.medium, color: Color(0xffFFA131)),
        });
      } else if (type == 'TRC20') {
        return Html(data: model.currentCoin.trc20RechargePrompt, style: {
          "p": Style(fontSize: FontSize.medium, color: Color(0xff8C8C8C)),
          "div": Style(fontSize: FontSize.medium, color: Color(0xffFFA131)),
        });
      } else {
        return Html(data: model.currentCoin.coin.rechargePrompt, style: {
          "p": Style(fontSize: FontSize.medium, color: Color(0xff8C8C8C)),
          "div": Style(fontSize: FontSize.medium, color: Color(0xffFFA131)),
        });
      }
    } else {
      return Html(data: model.currentCoin.coin.rechargePrompt, style: {
        "p": Style(fontSize: FontSize.medium, color: Color(0xff8C8C8C)),
        "div": Style(fontSize: FontSize.medium, color: Color(0xffFFA131)),
      });
    }
  }
}

class RechargeTipsWIdget extends StatelessWidget {
  const RechargeTipsWIdget({
    Key key,
    this.tip1,
    this.tip2,
    this.tip3,
    this.tip4,
  }) : super(key: key);

  final String tip1;
  final String tip2;
  final String tip3;
  final String tip4;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: height(28)),
      padding: EdgeInsets.all(width(30)),
      decoration:
          BoxDecoration(color: Color.fromARGB(1000, 246, 249, 251), borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(0, 0, 0, height(20)),
            child: Text('${Tr.of(context).assetTips}', style: TextStyle(color: kTextColor3, fontSize: sp(28), height: 1.1)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(tip1, style: TextStyle(color: kTextColor1, fontSize: sp(24))),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(tip2, style: TextStyle(color: kTextColor0, fontSize: sp(24))),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(tip3, style: TextStyle(color: kTextColor1, fontSize: sp(24))),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(0, 0, 0, height(20)),
            child: Text(tip4, style: TextStyle(color: kTextColor1, fontSize: sp(24))),
          ),
        ],
      ),
    );
  }
}
