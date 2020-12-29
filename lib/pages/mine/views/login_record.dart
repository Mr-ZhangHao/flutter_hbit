/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 11:03:58
* @LastEditors: Jack
* @LastEditTime: 2020-08-19 13:40:21
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/views/login_record.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/refresh/page_list.dart';
import 'package:HBit/pages/mine/model/login_history_model.dart';
import 'package:HBit/pages/mine/server/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class LoginRecordPage extends PageList {
  LoginRecordPage({Key key}) : super(key: key);
  @override
  _LoginRecordPageState createState() => _LoginRecordPageState();
}

class _LoginRecordPageState extends PageListState<LoginHistoryModel, LoginRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Tr.of(context).HistoryLogin),
        elevation: 1,
        leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Routers.goBack(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png', width: width(22), height: height(36)),
            )),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: width(40)),
        child: Column(
          children: <Widget>[
            LoginRecordListItem(
              leading: Tr.of(context).interviewTime,
              leadingStyle: TextStyle(fontWeight: FontWeight.bold),
              value: Tr.of(context).equipment,
            ),
            Expanded(child: buildList(context))
          ],
        ),
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
  loadPage({int page, Function(List<LoginHistoryModel>) onSuccess, Function onErr}) async {
    try {
      List<LoginHistoryModel> data = await MineServer.getLogiHistory(page);

      // var data = [LoginHistoryModel(), LoginHistoryModel()];
      onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(LoginHistoryModel model) {
    return LoginRecordListItem(
      leading: model.createdAt,
      value: model.client,
    );
  }

  @override
  Widget buildFooter() {
    return SizedBox();
  }

  @override
  empty() {
    return SizedBox();
  }
}

class LoginRecordListItem extends StatelessWidget {
  const LoginRecordListItem({
    Key key,
    this.leading,
    this.value,
    this.leadingStyle = const TextStyle(color: Color(0xff323232), fontWeight: FontWeight.normal),
    this.valueStyle = const TextStyle(color: Color(0xff323232), fontWeight: FontWeight.normal),
  }) : super(key: key);

  final String leading;
  final String value;
  final TextStyle leadingStyle;
  final TextStyle valueStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(100),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: Color(0xffEBEBEB)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(leading, style: leadingStyle),
          Text(value, style: valueStyle),
        ],
      ),
    );
  }
}
