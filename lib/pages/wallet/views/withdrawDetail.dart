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
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/qrscan/index.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/core/model/tfa_type_model.dart';
import 'package:HBit/pages/login/server/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/pages/mine/routes/index.dart';
import 'package:HBit/pages/wallet/provider/index.dart';
import 'package:HBit/pages/wallet/widgets/common/usdt_type_button.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/wallet/routes/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:provider/provider.dart';

class WithdrawDetailPage extends StatefulWidget {
  final String coinName;
  WithdrawDetailPage({Key key, this.coinName}) : super(key: key);

  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<WithdrawDetailPage> {
  String type = 'ERC20'; // 默认
  final _addrCtr = TextEditingController();
  final FocusNode _addrFocus = FocusNode();
  final _numCtr = TextEditingController();
  final FocusNode _numFocus = FocusNode();

  num _numStr = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((mag) {
      WallerProvider model = Provider.of<WallerProvider>(context, listen: false);
      model.setCurrentCoin(widget.coinName);
      _numCtr.addListener(() {
        if (_numCtr.text.isNotEmpty) {
          num _num = num.parse(_numCtr.text);
          num _withdrawFee = num.parse(model.currentCoin.coin.withdrawFee);
          setState(() => _numStr = (_num > _withdrawFee) ? (_num - _withdrawFee) : 0.0);
        } else {
          setState(() => _numStr = 0.0);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
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
        title: Text('${widget.coinName}${Tr.of(context).assetWithdrawal}', style: TextStyle(color: kTextColor3, fontSize: sp(36))),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(top: height(28)),
        decoration: BoxDecoration(border: Border(top: BorderSide(color: kLineColor1, width: width(1)))),
        child: Consumer<WallerProvider>(
          builder: (BuildContext context, WallerProvider model, Widget child) {
            return Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(width(40), height(32), width(40), 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, height(24)),
                        child: Text(
                            // '可用',
                            '${Tr.of(context).tradrAvailable} ${Utils.cutZero(model.currentCoin?.available ?? '0.0')} ${model.currentCoin?.coin?.name ?? '--/--'}',
                            style: TextStyle(
                                color: kTextColor3, fontSize: sp(28), height: 1.1, fontWeight: FontWeight.bold)),
                      ),
                      Visibility(
                        visible: widget.coinName == 'USDT',
                        child: ChooseChainTypeWidget(
                          onTab: (value) => setState(() => type = value),
                        ),
                      ),
                      FocusWidget(
                        focusNode: _addrFocus,
                        child: InputWidget(
                          obscureText: false,
                          controller: _addrCtr,
                          focusNode: _addrFocus,
                          hintText: '${Tr.of(context).assetWithdrawalHint2}',
                          hintStyle: TextStyle(fontSize: sp(28), color: Color(0xffcccccc)),
                          suffixIconConstraintsMaxWidth: 100,
                          suffixIconConstraintsMinWidth: 100,
                          suffixIconConstraintsMaxHeight: 60,
                          suffixIconConstraintsMinHeight: 60,
                          maxHeight: 100,
                          suffixIcon: QrScanCode(
                              image: 'images/mine/sys.png',
                              callback: (value) {
                                _addrCtr.text = value;
                              }),
                        ),
                      ),
                      FocusWidget(
                        focusNode: _numFocus,
                        child: InputWidget(
                          obscureText: false,
                          controller: _numCtr,
                          focusNode: _numFocus,
                          maxLength: 30,
                          hintText: maxFoo(model),
                          // inputFormatters: [_UsNumberTextInputFormatter()],
                          // inputFormatters: [WhitelistingTextInputFormatter(RegExp(r"[0-9.]"))],
                          hintStyle: TextStyle(fontSize: sp(28), color: Color(0xffcccccc)),
                          suffixIconConstraintsMaxWidth: 180,
                          suffixIconConstraintsMinWidth: 160,
                          suffixIconConstraintsMaxHeight: 60,
                          suffixIconConstraintsMinHeight: 60,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          maxHeight: 100,
                          suffixIcon: Container(
                            alignment: Alignment.centerRight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: width(20)),
                                  child: Text('${model.currentCoin?.coin?.name ?? '--/--'}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: kLineColor2, fontSize: sp(28), height: 1.1)),
                                ),
                                InkWell(
                                  onTap: () {
                                    _numCtr.text = model.currentCoin.available;
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(left: width(20)),
                                    decoration: BoxDecoration(
                                        border: Border(left: BorderSide(color: kLineColor1, width: width(1)))),
                                    child: Text('${Tr.of(context).assetALL}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: kBgColor1,
                                            fontSize: sp(28),
                                            height: 1.1,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height(40),
                        margin: EdgeInsets.fromLTRB(0, height(30), 0, height(92)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text('${Tr.of(context).tradrFee}：',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: kLineColor2, fontSize: sp(28), height: 1.1)),
                            ),
                            Container(
                              child: Text(
                                feeFoo(model),
                                textAlign: TextAlign.left,
                                style: TextStyle(color: kTextColor3, fontSize: sp(28), height: 1.1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: height(40),
                        margin: EdgeInsets.only(bottom: height(34)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text('${Tr.of(context).assetArrivalquantity}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: kLineColor2,
                                    fontSize: sp(28),
                                    height: 1.1,
                                  )),
                            ),
                            Container(
                              child: Text('$_numStr ${model.currentCoin?.coin?.name ?? '--/--'}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: kTextColor3, fontSize: sp(28), height: 1.1, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => next(model),
                        child: Container(
                          width: width(670),
                          height: height(88),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(500, 18, 109, 255),
                              borderRadius: BorderRadius.all(Radius.circular(width(44)))),
                          alignment: Alignment.center,
                          child: Text('${Tr.of(context).assetCarryon}',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: sp(30), height: 1.1)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height(20)),
                Container(
                  color: Color(0xffF6F9FB),
                  margin: EdgeInsets.fromLTRB(width(40), height(60), width(40), 0),
                  padding: EdgeInsets.all(width(30)),
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

  String feeFoo(WallerProvider model) {
    if (widget.coinName == 'USDT') {
      if (type == 'ERC20') {
        return '${Utils.cutZero(model.currentCoin?.erc20WithdrawFee ?? 0)} ${model.currentCoin?.coin?.name ?? '---'}';
      } else if (type == 'TRC20') {
        return '${Utils.cutZero(model.currentCoin?.trc20WithdrawFee ?? 0)} ${model.currentCoin?.coin?.name ?? '---'}';
      } else {
        return Utils.cutZero(model.currentCoin?.coin?.withdrawFee ?? 0) + widget.coinName;
      }
    } else {
      return Utils.cutZero(model.currentCoin?.coin?.withdrawFee ?? 0) + widget.coinName;
    }
  }

  String maxFoo(WallerProvider model) {
    if (widget.coinName == 'USDT') {
      if (type == "ERC20") {
        return '${Tr.of(context).assetWithdrawalMaxhint}${Utils.cutZero(model.currentCoin?.erc20WithdrawMax ?? '0.0')}';
      } else if (type == 'TRC20') {
        return '${Tr.of(context).assetWithdrawalMaxhint}${Utils.cutZero(model.currentCoin?.trc20WithdrawMax ?? '0.0')}';
      } else {
        return '${Tr.of(context).assetWithdrawalMaxhint}${Utils.cutZero(model.currentCoin?.coin?.withdrawMax ?? '0.0')}';
      }
    } else {
      return '${Tr.of(context).assetWithdrawalMaxhint}${Utils.cutZero(model.currentCoin?.coin?.withdrawMax ?? '0.0')}';
    }
  }

  renderTips(WallerProvider model) {
    if (widget.coinName == 'USDT') {
      if (type == 'ERC20') {
        return Html(data: model.currentCoin.erc20WithdrawPrompt, style: {
          "p": Style(fontSize: FontSize.medium, color: Color(0xff8C8C8C)),
          "div": Style(fontSize: FontSize.medium, color: Color(0xffFFA131)),
        });
      } else if (type == 'TRC20') {
        return Html(data: model.currentCoin.trc20WithdrawPrompt, style: {
          "p": Style(fontSize: FontSize.medium, color: Color(0xff8C8C8C)),
          "div": Style(fontSize: FontSize.medium, color: Color(0xffFFA131)),
        });
      } else {
        return Html(data: model.currentCoin.coin.withdrawPrompt, style: {
          "p": Style(fontSize: FontSize.medium, color: Color(0xff8C8C8C)),
          "div": Style(fontSize: FontSize.medium, color: Color(0xffFFA131)),
        });
      }
    } else {
      return Html(data: model.currentCoin.coin.withdrawPrompt, style: {
        "p": Style(fontSize: FontSize.medium, color: Color(0xff8C8C8C)),
        "div": Style(fontSize: FontSize.medium, color: Color(0xffFFA131)),
      });
    }
  }

  void next(WallerProvider model) async {
    MineProvider mineProvider = Provider.of<MineProvider>(context, listen: false);
    if (mineProvider.userInfo.payPassword == 0) {
      showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text(''),
              content: Text('${Tr.of(context).assetNoFundpwd}。'),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text('${Tr.of(context).cancel}', style: TextStyle(color: Color(0xff909090))),
                  onPressed: () => Routers.goBack(context),
                ),
                CupertinoDialogAction(
                  child: Text('${Tr.of(context).assetSet}', style: TextStyle(color: kPrimaryColor)),
                  onPressed: () {
                    Navigator.pop(context);
                    Routers.push(context, MineRouter.moneyPsw);
                  },
                ),
              ],
            );
          });
    } else if (model.currentCoin.coin.canWithdraw == 0) {
      showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('${Tr.of(context).assetprotection}！'),
              content: Text('${Tr.of(context).assetWithdrawalhint3}!'),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text('${Tr.of(context).Confirm}', style: TextStyle(color: kPrimaryColor)),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          });
    } else if (_addrCtr.text.isEmpty) {
      Toast.showText('${Tr.of(context).assetEmptyhint1}');
    } else if (_numCtr.text.isEmpty) {
      Toast.showText('${Tr.of(context).assetEmptyhint2}');
    } else {
      Toast.showLoading('Loading...');
      try {
        TfaTypeModel tfaType =
            await LoginServer.getVertifyType(4, Provider.of<MineProvider>(context, listen: false).userInfo.username);
        Provider.of<WallerProvider>(context, listen: false).setWithdrawField(WithdrawField(
            model.currentCoin.coinId.toString(), type, _addrCtr.text, _numCtr.text, tfaType.tfaType, widget.coinName));

        Routers.pushResult(context, WalletRouter.verification, (res) {
          Provider.of<WallerProvider>(context, listen: false).setCurrentCoin(widget.coinName);
        });
      } catch (e) {
        print(e);
      }
    }
  }
}

// // 只允许输入小数
// class _UsNumberTextInputFormatter extends TextInputFormatter {
//   static const defaultDouble = 0.001;
//   static double strToFloat(String str, [double defaultValue = defaultDouble]) {
//     try {
//       return double.parse(str);
//     } catch (e) {
//       return defaultValue;
//     }
//   }

//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     String value = newValue.text;
//     int selectionIndex = newValue.selection.end;
//     if (value == ".") {
//       value = "0.";
//       selectionIndex++;
//     } else if (value != "" && value != defaultDouble.toString() && strToFloat(value, defaultDouble) == defaultDouble) {
//       value = oldValue.text;
//       selectionIndex = oldValue.selection.end;
//     }
//     return new TextEditingValue(
//       text: value,
//       selection: new TextSelection.collapsed(offset: selectionIndex),
//     );
//   }
// }
