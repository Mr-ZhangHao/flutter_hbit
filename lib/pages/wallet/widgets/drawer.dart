/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-18 18:02:09
* @LastEditors: Roy
* @LastEditTime: 2020-08-20 14:45:57
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/view/shaixuan_drawer.dart
*/
import 'package:HBit/common/drawer/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/pages/wallet/model/coin_info_model.dart';
import 'package:HBit/pages/wallet/provider/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/button/index.dart';
import '../../../constants/index.dart';
import '../../../utils/screen.dart';

class RecoredDrawer extends StatefulWidget {
  const RecoredDrawer({
    Key key,
    this.onTab,
  }) : super(key: key);
  final ValueChanged<Map<String, dynamic>> onTab;

  @override
  _ShaiXuanDrawerState createState() => _ShaiXuanDrawerState();
}

enum CheckType { trade, coin }

class _ShaiXuanDrawerState extends State<RecoredDrawer> with SingleTickerProviderStateMixin {
  List dateList = [
    {"title": "最近7天", "index": 1},
    {"title": "7天至1个月", "index": 2},
    {"title": "7天至3个月", "index": 3}
  ];

  int dataSelectType = 1;

  Map currentType = {'title': '全部', "index": 0};

  CoinInfoModel coinInfo;

  CheckType type = CheckType.trade;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    dateList = [
      {"title": "${Tr.of(context).asset7Day}", "index": 1},
      {"title": "${Tr.of(context).asset7o1month}", "index": 2},
      {"title": "${Tr.of(context).asset7o3month}", "index": 3}
    ];

    currentType = {'title': '${Tr.of(context).tradrAll}', "index": 0};
    return CustomDrawer(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _contentView(),
            _footerView(),
          ],
        ),
        endDrawer: CustomDrawer(
          child: Scaffold(
            body: SelectTradeTypeDrawerWidget(
                type: type,
                onTab: (item) => setState(() => currentType = item),
                onCoinTab: (CoinInfoModel item) => setState(() => coinInfo = item)),
          ),
        ),
      ),
    );
  }

  Widget _contentView() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: height(70), left: width(40)),
            alignment: Alignment.centerLeft,
            child: Text('${Tr.of(context).assetDate}', style: TextStyle(fontSize: sp(30))),
          ),
          SizedBox(height: height(20)),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: dateList
                  .map((e) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => {
                          setState(() {
                            dataSelectType = e['index'];
                          })
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xffEFF8FE),
                              borderRadius: BorderRadius.circular(5),
                              image: dataSelectType == e['index']
                                  ? DecorationImage(image: AssetImage('images/trade/select.png'), fit: BoxFit.fill)
                                  : null),
                          height: width(70),
                          width: width(140),
                          child: Text(e['title'],
                              style: TextStyle(
                                  color: dataSelectType == e['index'] ? kPrimaryColor : Color(0xff323232),
                                  fontSize: sp(24))),
                        ),
                      ))
                  .toList()),
          Container(
            margin: EdgeInsets.only(top: height(20), left: width(40)),
            alignment: Alignment.centerLeft,
            child: Text('${Tr.of(context).assetTransactionType}', style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(30))),
          ),
          Builder(
            builder: (context) {
              return Container(
                margin: EdgeInsets.only(top: height(20), left: width(40), right: width(40)),
                padding: EdgeInsets.symmetric(horizontal: width(20)),
                height: height(80),
                decoration:
                    BoxDecoration(color: Color(0xffEDEDED), borderRadius: BorderRadius.all(Radius.circular(width(10)))),
                child: InkWell(
                  onTap: () {
                    setState(() => type = CheckType.trade);
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('${Tr.of(context).assetChoosetype}', style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(30))),
                      Row(
                        children: <Widget>[
                          Text(currentType['title'], style: TextStyle(color: kTextColor3, fontSize: sp(30))),
                          Image.asset('images/contract/right_jiantou.png', width: width(40), height: height(50))
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Container(
            margin: EdgeInsets.only(top: height(20), left: width(40)),
            alignment: Alignment.centerLeft,
            child: Text('${Tr.of(context).assetCurrency}', style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(30))),
          ),
          Builder(
            builder: (context) {
              return Container(
                margin: EdgeInsets.only(top: height(20), left: width(40), right: width(40)),
                padding: EdgeInsets.symmetric(horizontal: width(20)),
                height: height(80),
                decoration:
                    BoxDecoration(color: Color(0xffEDEDED), borderRadius: BorderRadius.all(Radius.circular(width(10)))),
                child: InkWell(
                  onTap: () {
                    setState(() => type = CheckType.coin);
                     Scaffold.of(context).openEndDrawer();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('${Tr.of(context).assetChoosetype}', style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(30))),
                      Row(
                        children: <Widget>[
                          Text(coinInfo?.coin?.name ?? '${Tr.of(context).tradrAll}', style: TextStyle(color: kTextColor3, fontSize: sp(30))),
                          Image.asset('images/contract/right_jiantou.png', width: width(40), height: height(50))
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _footerView() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: height(90),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: width(1), color: Color(0xffD3D3D3)),
          ),
        ),
        child: Row(children: <Widget>[
          Expanded(
            child: SmallButton(
              color: kTransprant,
              textColor: kPrimaryColor,
              isBorder: false,
              borderWidth: 0,
              borderColor: kTransprant,
              height: height(90),
              borderRadius: BorderRadius.all(Radius.circular(width(0))),
              text: '${Tr.of(context).TradrReset}',
              onPressed: () {
                setState(() {
                  coinInfo = CoinInfoModel();
                  currentType = {'title': '${Tr.of(context).tradrAll}', "index": 0};
                  dataSelectType = 1;
                });
              },
            ),
          ),
          Expanded(
            child: SmallButton(
              color: kPrimaryColor,
              textColor: Colors.white,
              isBorder: false,
              borderWidth: 0,
              borderColor: kTransprant,
              height: height(90),
              borderRadius: BorderRadius.all(Radius.circular(width(0))),
              text: '${Tr.of(context).Confirm}',
              onPressed: () {
                widget.onTab({"coin_id": coinInfo?.coinId ?? '', "type": currentType['index'], "time": dataSelectType});
                Navigator.of(context).pop();
              },
            ),
          ),
        ]),
      ),
    );
  }
}

class SelectTradeTypeDrawerWidget extends StatefulWidget {
  const SelectTradeTypeDrawerWidget({
    Key key,
    this.onTab,
    this.type,
    this.onCoinTab,
  }) : super(key: key);

  final CheckType type;
  final Function(Map item) onTab;
  final Function(CoinInfoModel coin) onCoinTab;

  @override
  _SelectTradeTypeDrawerWidgetState createState() => _SelectTradeTypeDrawerWidgetState();
}

class _SelectTradeTypeDrawerWidgetState extends State<SelectTradeTypeDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    List typeList = [
      {"title": '${Tr.of(context).assetRecharge}', "index": 1},
      {"title": '${Tr.of(context).assetWithdrawal}', "index": 2},
      {"title": '${Tr.of(context).assetTransfer1}', "index": 3},
      {"title": '${Tr.of(context).assetTransfer2}', "index": 4},
    ];

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: height(70), left: width(40)),
            alignment: Alignment.centerLeft,
            child: Text(widget.type == CheckType.trade ? '${Tr.of(context).assetChoosetype}' : '${Tr.of(context).assetChoosecurrency}', style: TextStyle(fontSize: sp(30))),
          ),
          Visibility(
            visible: widget.type == CheckType.trade,
            child: Expanded(
              child: ListView.builder(
                itemCount: typeList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      widget.onTab(typeList[index]);
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      height: height(80),
                      padding: EdgeInsets.symmetric(horizontal: width(40)),
                      child: Text(typeList[index]['title'], style: TextStyle(color: kTextColor9)),
                    ),
                  );
                },
              ),
            ),
            replacement: Expanded(
              child: Consumer<WallerProvider>(
                builder: (BuildContext context, WallerProvider model, Widget child) {
                  return ListView.builder(
                    itemCount: model.coinInfoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          widget.onCoinTab(model.coinInfoList[index]);
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: height(80),
                          padding: EdgeInsets.symmetric(horizontal: width(40)),
                          child: Text(model.coinInfoList[index].coin.name, style: TextStyle(color: kTextColor9)),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
