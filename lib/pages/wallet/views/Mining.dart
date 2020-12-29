import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/drawer/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/c2c/routes/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/pages/mine/routes/index.dart';
import 'package:HBit/pages/mine/views/identity_auth1.dart';
import 'package:HBit/pages/wallet/model/Lockup_config_model.dart';
import 'package:HBit/pages/wallet/model/coin_info_model.dart';
import 'package:HBit/pages/wallet/provider/index.dart';
import 'package:HBit/pages/wallet/routes/index.dart';
import 'package:HBit/pages/wallet/server/index.dart';
import 'package:HBit/pages/wallet/widgets/drawer.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MiningPage extends StatefulWidget {
  @override
  _MiningPageState createState() => _MiningPageState();
}

class _MiningPageState extends State<MiningPage> {
  List<Map<String, dynamic>> typeList = [];
  List<LockupConfigModel> ConfigList;

  String Currency = '';
  int CurrencyID = 0;
  String Rate = '3';
  Object AvailableBalance = '0.00';
  int miningTimeNumber = 7;
  String miningTime = '';
  String miningAmount = '0';
  final _pswCtr = TextEditingController();
  final FocusNode _pswFocus = FocusNode();
  final _numberCtr = TextEditingController();
  final FocusNode _numberFocus = FocusNode();

  CheckType type = CheckType.coin;
  int coin_id = 0;
  CoinInfoModel currentCoin ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<WallerProvider>(context, listen: false).setCurrentCoin('HBIT');
    currentCoin = Provider.of<WallerProvider>(context, listen: false).currentCoin;
    CurrencyID=currentCoin.coin.id;
    print('Currency:'+currentCoin.coin.name.toString());
    print('CurrencyID:'+currentCoin.coin.id.toString());
    getCoinList(id:CurrencyID);
  }

  void getCoinList({id}) async {
    List<LockupConfigModel> data = await WalletServer.getConfigList(id);

    setState(() {
      if (data.length == 0) {
        Toast.showText('${Tr.of(context).miningNotCurrently}');
        AvailableBalance = '0.00';
        miningTime = '';
        Rate = '3';
        miningAmount = '0';
        Currency = '';
        typeList.clear();

        return;
      }

      ConfigList = data;
      print(ConfigList.length.toString());

      if (typeList.length > 0) {
        typeList.clear();
      }
      miningTime = '${ConfigList[0].day}${Tr.of(context).klineDay}';
      miningTimeNumber = ConfigList[0].day;
      AvailableBalance = ConfigList[0].balance.toString();
      _numberCtr.text = ConfigList[0].number.toString();
      miningAmount = ConfigList[0].number.toString();
      Rate = ConfigList[0].proportion.toString();
      Currency = ConfigList[0].coin;
      coin_id = ConfigList[0].id;
      for (int i = 0; i < ConfigList.length; i++) {
        Map<String, dynamic> map = {
          "name": ConfigList[i].day.toString() + "${Tr.of(context).klineDay}",
          "id": ConfigList[i].day,
          "coin_id": ConfigList[i].id,
          "proportion": ConfigList[i].proportion.toString(),
          "number": ConfigList[i].number.toString(),
          "balance": ConfigList[i].balance.toString()
        };
        typeList.add(map);
      }
      print('${typeList.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    // Currency = '${Tr.of(context).assetChoosecurrency}';
    return Scaffold(
        backgroundColor: Color(0xfffffffff),
        appBar: AppBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png',
                  width: width(22), height: height(36)),
            ),
          ),
          title: Text('${Tr.of(context).miningLock}',
              style: TextStyle(color: kTextColor3, fontSize: sp(32))),
          centerTitle: true,
          elevation: 1,
          actions: [
            Container(
              padding: EdgeInsets.only(right: width(20)),
              alignment: Alignment.center,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Routers.push(context, WalletRouter.MiningList);
                },
                child: Text('${Tr.of(context).miningList}',
                    style: TextStyle(color: kTextColor3, fontSize: 12)),
              ),
            )
          ],
        ),
        endDrawer: CustomDrawer(
          child: Scaffold(
            body: SelectTradeTypeDrawerWidget(
                type: type,
                //onTab: (item) => setState(() => currentType = item),
                onCoinTab: (CoinInfoModel item) {
                  setState(() {
                    CurrencyID = item.coin.id;
                    Currency = item.coin.name;
                    getCoinList(id: CurrencyID);

                    print('Currency:'+Currency.toString());
                    print('CurrencyID:'+CurrencyID.toString());

                  });
                }),
          ),
        ),
        body: SingleChildScrollView(
          child: Consumer2<WallerProvider, ContractAssetProvider>(builder:
              (BuildContext context, WallerProvider model1,
                  ContractAssetProvider model2, Widget child) {
            return Column(
              children: [
                MineListItemWidget(
                  text: Tr.of(context).assetCurrency,
                  image: false,
                  rightText: Currency,
                  onTab: () {
                   // Scaffold.of(context).openEndDrawer();
                  },
                ),
                MineListItemWidget(
                  text: Tr.of(context).miningAvailableBalance,
                  image: false,
                  rightText: '${AvailableBalance}',
                ),
                MineListItemWidget(
                  text: Tr.of(context).miningTime,
                  image: true,
                  rightText: '${miningTime}',
                  onTab: () {
                    if (ConfigList.length == 0) {
                      Toast.showText('${Tr.of(context).miningNotCurrently}');
                    } else {
                      return showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return DayTypeWidget(
                            typeList: typeList,
                            onTab: (index, name, proportion, coin_id, number, balance) {
                              //  print(name);
                              setState(() {
                                miningTime = name;
                                miningTimeNumber = index;
                                AvailableBalance = balance;
                                _numberCtr.text = number;
                                miningAmount = number;
                                Rate = proportion;
                                this.coin_id=coin_id;
                              });
                              Routers.goBack(context);
                            },
                          );
                        },
                      );
                    }
                  },
                ),
                Container(
                  height: height(90),
                  margin: EdgeInsets.symmetric(horizontal: width(40)),
                  child: FocusWidget(
                    focusNode: _numberFocus,
                    child: InputWidget(
                      textAlign: TextAlign.right,
                      focusNode: _numberFocus,
                      controller: _numberCtr,
                      maxHeight: 100,
                      obscureText: false,
                      hintText: '${Tr.of(context).miningNotAmountHint}',
                      prefixIconConstraintsMaxWidth: 200,
                      prefixIconConstraintsMinWidth: 160,
                      prefixIconConstraintsMinHeight: 50,
                      prefixIconConstraintsMaxHeight: 50,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      contentPadding: EdgeInsets.only(bottom: height(12)),
                      hintStyle:
                          TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                      prefixIcon: Container(
                        child: Text('${Tr.of(context).miningAmount}：',
                            style: TextStyle(color: Colors.black,fontSize: sp(28))),
                      ),
                    ),
                  ),
                ),
                MineListItemWidget(
                  // isShowBadge: Provider.of<MineProvider>(context).isShowBadge,
                  text: Tr.of(context).miningRate,
                  image: false,
                  rightText: '${Rate}%',
                ),
                Container(
                  height: height(90),
                  margin: EdgeInsets.symmetric(horizontal: width(40)),
                  child: FocusWidget(
                    focusNode: _pswFocus,
                    child: InputWidget(
                      textAlign: TextAlign.right,
                      focusNode: _pswFocus,
                      controller: _pswCtr,
                      maxHeight: 100,
                      obscureText: true,
                      hintText: Tr.of(context).miningEnterHint,
                      prefixIconConstraintsMaxWidth: 200,
                      prefixIconConstraintsMinWidth: 160,
                      prefixIconConstraintsMinHeight: 50,
                      prefixIconConstraintsMaxHeight: 50,
                      contentPadding: EdgeInsets.only(bottom: height(12)),
                      hintStyle:
                          TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                      prefixIcon: Container(
                        child: Text('${Tr.of(context).moneyPassword}：',
                            style: TextStyle(color: Colors.black,fontSize: sp(28))),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height(100),
                ),
                Container(
                  height: height(90),
                  margin: EdgeInsets.symmetric(horizontal: width(40)),
                  child: MyButton(
                      text: Tr.of(context).miningConfirmLock,
                      onPressed: () => _confirm(model1, model2)),
                ),
                SizedBox(
                  height: height(50),
                ),
                GestureDetector(
                  child: Column(
                children: [
                  Image.asset('images/mine/icon_rule.png',
                      width: width(96), height: height(96)),
                      Text('${Tr.of(context).miningRuleDescription}',
                          style: TextStyle(color: Colors.black,fontSize: sp(28)))
                  ]),
                  onTap: () {
                    Routers.push(context, WalletRouter.RuleDescription);
                  },
                )
              ],
            );
          }),
        ));
  }

  //确认
  _confirm(WallerProvider model1, ContractAssetProvider model2) async {
    MineProvider mineProvider =
        Provider.of<MineProvider>(context, listen: false);
    if (mineProvider.userInfo.payPassword == 0) {
      showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text(''),
              content: Text('${Tr.of(context).assetNoFundpwd}。'),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text('${Tr.of(context).cancel}',
                      style: TextStyle(color: Color(0xff909090),fontSize: sp(28))),
                  onPressed: () => Routers.goBack(context),
                ),
                CupertinoDialogAction(
                  child: Text('${Tr.of(context).assetSet}',
                      style: TextStyle(color: kPrimaryColor,fontSize: sp(28))),
                  onPressed: () {
                    Navigator.pop(context);
                    Routers.push(context, MineRouter.moneyPsw);
                  },
                ),
              ],
            );
          });
    } else {
      if (Currency == '') {
        Toast.showText('${Tr.of(context).assetChoosecurrency}');
      }else if (miningTime == '') {
        Toast.showText('${Tr.of(context).miningLockPeriod}');
      }else if (_numberCtr.text.isEmpty) {
        Toast.showText('${Tr.of(context).miningNotAmountHint}');
      }else if ( double.parse(_numberCtr.text) < double.parse(miningAmount) ) {
        Toast.showText('${Tr.of(context).miningMinAmountHint}');
      } else if (_pswCtr.text.isEmpty) {
        Toast.showText('${Tr.of(context).moneypwdEmptyHint}');
      } else {
        Toast.showLoading('loading...');
        print('Currency:'+currentCoin.coin.name.toString());
        print('coin_id:'+coin_id.toString());
        var data = {
          "config_id": coin_id,
          "number": _numberCtr.text,
          "password": _pswCtr.text,
        };
        WalletServer.ConfirmLockup(data).then((res) {
          model1
            ..getBibiAsset()
            ..getCoinList(coinName: Currency);
          // ..setCurrentCoin('USDT');
          _numberCtr.text= '';
          _pswCtr.text = '';
          //  model2.getContractAsset(coinName: 'USDT');
          // ..setCurrentCoin('USDT');
          Routers.push(context, WalletRouter.MiningList,replace: true, clearStack: false);

          Toast.showSuccess('${Tr.of(context).tradrSuccess}');
        });
      }
    }
  }
}

class MineListItemWidget extends StatelessWidget {
  const MineListItemWidget({
    Key key,
    this.image,
    this.text,
    this.rightText,
    this.onTab,
  }) : super(key: key);
  final bool image;
  final String text;
  final String rightText;
  final Function onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: height(90),
        margin: EdgeInsets.symmetric(horizontal: width(40)),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xffEBEBEB)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: sp(28), color: Colors.black),
              ),
            ),
            Text(
              rightText,
              style: TextStyle(fontSize: sp(28), color: Color(0xff909090)),
            ),
            Visibility(
              child: Icon(Icons.keyboard_arrow_right_sharp,
                  size: sp(40), color: Color(0xffD4D4D4)),
              visible: image,
            )
          ],
        ),
      ),
    );
  }
}

class DayTypeWidget extends StatelessWidget {
  final Function(int type, String name, String proportion,int coin_id, String number,
      String balance) onTab;
  final List typeList;

  const DayTypeWidget({Key key, this.onTab, this.typeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 500,
        minHeight: 400,
      ),
      height: height(400),
      child: Column(
        children: <Widget>[
          Column(
              children: typeList
                  .map((e) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => {
                          onTab(e['id'], e['name'], e['proportion'],e['coin_id'],
                              e['number'], e['balance'])
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.5, color: Color(0xffcccccc)))),
                          margin: EdgeInsets.symmetric(horizontal: width(40)),
                          child: Text(e['name']),
                          height: height(100),
                          alignment: Alignment.center,
                        ),
                      ))
                  .toList()),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {Navigator.pop(context)},
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 0.5, color: Color(0xffcccccc)))),
              margin: EdgeInsets.symmetric(horizontal: width(40)),
              child: Text(Tr.of(context).cancel,
                  style: TextStyle(color: Colors.blue)),
              height: height(100),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
