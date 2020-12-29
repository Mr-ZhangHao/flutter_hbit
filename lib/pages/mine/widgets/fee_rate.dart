import 'package:HBit/common/refresh/page_list.dart';
import 'package:HBit/pages/mine/model/rate_model.dart';
import 'package:HBit/pages/mine/server/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class FeeRateList extends PageList {
  FeeRateList({Key key}) : super(key: key);
  @override
  _FeeRateListState createState() => _FeeRateListState();
}

class _FeeRateListState extends PageListState<FeeModel, FeeRateList> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.white,
      child: buildList(context),
    );
  }

  @override
  void initState() {
    loadData(1);
    super.initState();
  }

  ///加载数据
  @override
  loadPage({int page, Function(List<FeeModel>) onSuccess, Function onErr}) async {
    try {
      var res = await MineServer.getRate(page);
      List<FeeModel> rates = (res['data']['withdraw'] as List).map((e) => FeeModel.fromJson(e)).toList();
      // var data = [FeeModel(), FeeModel()];
      onSuccess(rates);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(FeeModel model) {
    TextStyle style = TextStyle(fontSize: sp(28), color: Color(0xff909090));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(30), vertical: width(20)),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: Color(0xffebebeb)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(vertical: width(40)),
              child: Row(
                children: <Widget>[
                  Text(model.name,
                      style: TextStyle(color: Color(0xff323232), fontSize: sp(32), fontWeight: FontWeight.bold)),
                  Visibility(
                    visible: model.tip.length > 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width(10), vertical: height(5)),
                      margin: EdgeInsets.only(left: width(20)),
                      decoration: BoxDecoration(
                        color: Color(0xffc6c6c6),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        model.tip,
                        style: TextStyle(color: Colors.white, fontSize: sp(28)),
                      ),
                    ),
                  )
                ],
              )),
          Row(
            children: <Widget>[
              Expanded(
                  child: Row(children: <Widget>[
                Text('提币手续费：', style: style),
                Expanded(
                  child: Text(model.fee.toString(), maxLines: 1, overflow: TextOverflow.ellipsis, style: style),
                )
              ])),
              SizedBox(width: width(30)),
              Expanded(
                  child: Row(children: <Widget>[
                Text('单笔限额：', style: style),
                Expanded(
                    child: Text(model.singleMax.toString(), maxLines: 1, overflow: TextOverflow.ellipsis, style: style))
              ]))
            ],
          ),
          SizedBox(height: width(20)),
          Row(
            children: <Widget>[
              Expanded(
                  child: Row(children: <Widget>[
                Text('最小提币量：', style: style),
                Expanded(child: Text(model.min.toString(), maxLines: 1, overflow: TextOverflow.ellipsis, style: style))
              ])),
              SizedBox(width: width(30)),
              Expanded(
                  child: Row(children: <Widget>[
                Text('每日限额：', style: style),
                Expanded(
                    child: Text(model.dayMax.toString(), maxLines: 1, overflow: TextOverflow.ellipsis, style: style))
              ]))
            ],
          ),
        ],
      ),
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

  @override
  bool get wantKeepAlive => true;
}
