import 'package:HBit/common/refresh/page_list.dart';
import 'package:HBit/pages/mine/model/rate_model.dart';
import 'package:HBit/pages/mine/server/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class ContractRateList extends PageList {
  ContractRateList({Key key}) : super(key: key);
  @override
  _ContractRateListState createState() => _ContractRateListState();
}

class _ContractRateListState extends PageListState<RateModel, ContractRateList> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(30)),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: width(90),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5)),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(child: Text('合约', textAlign: TextAlign.left)),
                Expanded(child: Text('Maker', textAlign: TextAlign.center)),
                Expanded(child: Text('Taker', textAlign: TextAlign.right)),
              ],
            ),
          ),
          Expanded(
            child: buildList(context),
          )
        ],
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
  loadPage({int page, Function(List<RateModel>) onSuccess, Function onErr}) async {
    try {
      var res = await MineServer.getRate(page);
      List<RateModel> rates = (res['data']['contract'] as List).map((e) => RateModel.fromJson(e)).toList();
      // var data = [RateModel(), RateModel()];
      onSuccess(rates);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(RateModel model) {
    TextStyle style = TextStyle(fontSize: sp(28), color: Color(0xff909090));
    return Container(
      height: width(90),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5)),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(child: Text(model.symbol, style: style, textAlign: TextAlign.left)),
          Expanded(child: Text(model.maker, style: style, textAlign: TextAlign.center)),
          Expanded(child: Text(model.taker, style: style, textAlign: TextAlign.right)),
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
