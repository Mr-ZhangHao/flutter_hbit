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
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/pages/wallet/provider/index.dart';
import 'package:HBit/pages/wallet/server/index.dart';
import 'package:HBit/utils/text_input_formatter.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/constants/index.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TransformationPage extends StatefulWidget {
  TransformationPage({Key key}) : super(key: key);

  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<TransformationPage> {
  bool direction = true;
  final _numCtr = TextEditingController();
  final FocusNode _numFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.center,
            child: Image.asset('images/mine/back@2x.png', width: width(22), height: height(36)),
          ),
        ),
        title: Text('${Tr.of(context).assetTransfer}', style: TextStyle(color: kTextColor3, fontSize: sp(36))),
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Consumer2<WallerProvider, ContractAssetProvider>(
          builder: (BuildContext context, WallerProvider model1, ContractAssetProvider model2, Widget child) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: width(24)),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: height(40)),
                    padding: EdgeInsets.symmetric(horizontal: width(40)),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("images/mine/mask2.png"), fit: BoxFit.fill),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: height(38)),
                          padding: EdgeInsets.symmetric(horizontal: width(40)),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            textDirection: direction ? TextDirection.rtl : TextDirection.ltr,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: AccountTypeWidget(
                                    icon: 'images/mine/hb@2x.png',
                                    title: '${Tr.of(context).assetCoin}',
                                    number: Utils.cutZero(model1.currentCoin?.available ?? 0),
                                    direction: direction),
                              ),
                              Expanded(
                                child: IconButtonWidget(
                                  onTab: () => setState(() => direction = !direction),
                                ),
                              ),
                              Expanded(
                                child: AccountTypeWidget(
                                    icon: 'images/mine/hy.png',
                                    title: '${Tr.of(context).assetContract}',
                                    number: Utils.cutZero(model2.currentCoin?.available ?? 0),
                                    direction: !direction),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height(20)),
                        SelectCoinWidget(),
                        FocusWidget(
                          focusNode: _numFocus,
                          child: InputWidget(
                            obscureText: false,
                            controller: _numCtr,
                            focusNode: _numFocus,
                            hintText: '${Tr.of(context).assetTransferQuantityhint}',
                            hintStyle: TextStyle(fontSize: sp(28), color: Color(0xffcccccc)),
                            suffixIconConstraintsMaxWidth: 100,
                            suffixIconConstraintsMinWidth: 100,
                            suffixIconConstraintsMaxHeight: 60,
                            suffixIconConstraintsMinHeight: 60,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            contentPadding: EdgeInsets.symmetric(vertical: width(0)),
                            maxHeight: 100,
                            inputFormatters: [MyNumberTextInputFormatter(digit: 8)],
                            suffixIcon: InkWell(
                              onTap: () {
                                if (direction) {
                                  if (double.parse(model2.currentCoin.available) > 0) {
                                    _numCtr.text = model2.currentCoin.available.toString();
                                  } else {
                                    Toast.showText('${Tr.of(context).assetNoavailable}');
                                  }
                                } else {
                                  if (double.parse(model1.currentCoin.available) > 0) {
                                    _numCtr.text = double.parse(model1.currentCoin.available).toString();
                                  } else {
                                    Toast.showText('${Tr.of(context).assetNoavailable}');
                                  }
                                }
                              },
                              child: Container(
                                child: Text(
                                  '${Tr.of(context).tradrAll}',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: kBgColor1,
                                    fontSize: sp(28),
                                    height: 1.1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //   padding: EdgeInsets.fromLTRB(width(68), height(20), 0, height(82)),
                  //   child: Text(
                  //     '最多可划转0.00000000USDT',
                  //     textAlign: TextAlign.left,
                  //     style: TextStyle(
                  //       color: kLineColor2,
                  //       fontSize: sp(28),
                  //       height: 1.1,
                  //     ),
                  //   ),
                  // ),
                  MyButton(text: '${Tr.of(context).assetConfirmtransfer}', onPressed: () => _confirm(model1, model2)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _confirm(WallerProvider model1, ContractAssetProvider model2) async {
    if (_numCtr.text.isEmpty) {
      Toast.showText('${Tr.of(context).assetQuantityEmptyhint}');
    } else {
      Toast.showLoading('loading...');
      var data = {
        "coin_id": model1.currentCoin.coinId,
        "from_account": direction ? "contract_account" : "account",
        "to_account": !direction ? "contract_account" : "account",
        "number": _numCtr.text
      };
      WalletServer.transfer(data).then((res) {
        model1
          ..getBibiAsset()
          ..getCoinList(coinName: 'USDT');
        // ..setCurrentCoin('USDT');

        model2.getContractAsset(coinName: 'USDT');
        // ..setCurrentCoin('USDT');
        Toast.showSuccess('${Tr.of(context).assetSuccessfultransfer}');
      });
    }
  }
}

class IconButtonWidget extends StatelessWidget {
  final Function onTab;
  const IconButtonWidget({
    Key key,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(0, height(4), 0, height(8)),
        child: Image.asset('images/mine/change.png', fit: BoxFit.contain, width: width(68), height: height(68)),
      ),
    );
  }
}

class AccountTypeWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String number;
  final bool direction;
  const AccountTypeWidget({
    Key key,
    this.icon,
    this.title,
    this.number,
    this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          mainAxisAlignment: direction ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: width(12)),
              height: width(36),
              width: width(36),
              child: Image.asset(icon, fit: BoxFit.contain, width: width(36), height: height(36)),
            ),
            Container(
              child: Text(title,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: kTextColor3, fontSize: sp(32), height: 1.1, fontWeight: FontWeight.bold)),
            )
          ],
        ),
        SizedBox(height: height(72)),
        Text('${Tr.of(context).assetBalance}\n$number',
            textAlign: direction ? TextAlign.right : TextAlign.left,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: kLineColor2, fontSize: sp(28))),
      ],
    );
  }
}

class SelectCoinWidget extends StatelessWidget {
  const SelectCoinWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(100),
      decoration: BoxDecoration(border: Border(top: BorderSide(color: kLineColor3, width: width(1)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text('${Tr.of(context).assetCurrentcurrency}',
                textAlign: TextAlign.left,
                style: TextStyle(color: kTextColor3, fontSize: sp(28), fontWeight: FontWeight.bold)),
          ),
          Container(
            child: Text('USDT',
                textAlign: TextAlign.left,
                style: TextStyle(color: kTextColor3, fontSize: sp(28), fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
