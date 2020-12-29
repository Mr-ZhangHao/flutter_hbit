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
import 'package:HBit/common/refresh/page_list.dart';
import 'package:HBit/pages/wallet/model/bibi_recored_model.dart';
import 'package:HBit/pages/wallet/server/index.dart';
import 'package:HBit/pages/wallet/widgets/RecordItemWidget.dart';
import 'package:HBit/pages/wallet/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/constants/index.dart';

class RecordBibiPage extends PageList {
  RecordBibiPage({Key key}) : super(key: key);

  @override
  _RecordBibiPageState createState() => _RecordBibiPageState();
}

class _RecordBibiPageState extends PageListState<BibiRecored, RecordBibiPage> {
  Map params = {"coin_id": '', "type": 0, "time": 0};

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
        brightness: Brightness.light,
        title: Text(
          '${Tr.of(context).assetCoinrecord}',
          style: TextStyle(color: kTextColor3, fontSize: sp(36)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        actions: <Widget>[
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () => Scaffold.of(context).openEndDrawer(),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width(20)),
                  child: ImageIcon(AssetImage('images/contract/shaixuan.png'), size: sp(44))),
            );
          })
        ],
      ),
      body: buildList(context),
      endDrawer: RecoredDrawer(
        onTab: (map) {
          setState(() => params = map);
          loadData(1);
        },
      ),
    );
  }

  @override
  void initState() {
    loadData(1);
    super.initState();
  }

  ///加载数据
  @override
  loadPage({int page, Function(List<BibiRecored>) onSuccess, Function onErr}) async {
    try {
      List<BibiRecored> list = await WalletServer.bibiRecord({
        "coin_id": params['coin_id'],
        "type": params['type'],
        "time": params['time'],
        "page": page,
        "per_page": 10,
      });
      onSuccess(list);
    } catch (e) {
      onErr(e);
    }
  }

  @override
  buildItem(BibiRecored model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(24)),
      child: RecordItemWidget(model: model),
    );
  }

  @override
  empty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/contract/no_record.png',
            width: width(230),
            height: width(230),
            fit: BoxFit.contain,
          ),
          SizedBox(height: height(20)),
          Text('${Tr.of(context).homeNodata}', style: TextStyle(color: Color(0xffDBDBDB)))
        ],
      ),
    );
  }

  @override
  buildFooter() {
    return SizedBox(
      child: Text('${Tr.of(context).assetNoMore}'),
    );
  }
}
