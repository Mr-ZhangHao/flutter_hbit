import 'package:HBit/common/refresh/page_list.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/wallet/model/MiningList_model.dart';
import 'package:HBit/pages/wallet/server/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:HBit/common/i18n/i18n.dart';

class MiningListChildPage extends PageList {
    final int indexs;

    MiningListChildPage(this.indexs, {Key key}) : super(key: key);
  @override
  _MiningListChildPageState createState() => _MiningListChildPageState();
}

class _MiningListChildPageState  extends PageListState<MiningListModel, MiningListChildPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
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
  loadPage({int page, Function(List<MiningListModel>) onSuccess, Function onErr}) async {

    try {
     List<MiningListModel> data = await WalletServer.miningList({
       "status":'${(widget as MiningListChildPage).indexs}',
       "page": page,
       "per_page": 10,
     });
     //  var data = [MiningListModel(), MiningListModel()];
     onSuccess(data);
    } on Exception catch (e, _) {
      onErr();
    }
  }

  @override
  buildItem(MiningListModel model) {
    return MiningListListItem(
      Currency: model.coin,
      startTime: model.star_time,
      endTime: model.end_time,
      quantity: model.number,
      amount: model.profit,
      state: model.status,
    );
  }

  @override
  Widget buildFooter() {
    return SizedBox();
  }

  ///默认空页面
  empty() {
    return Center(
        child: Text("${Tr.of(context).homeNodata}",
            style: TextStyle(
                fontSize: sp(32),
                color: Color(0xff999999),
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none)));
  }
}
class MiningListListItem extends StatelessWidget {
  const MiningListListItem({
    Key key,
    this.Currency,
    this.startTime,
    this.endTime,
    this.quantity,
    this.amount,
    this.state,

  }) : super(key: key);

  final String Currency;
  final String startTime;
  final String endTime;
  final String amount;
  final String quantity;
  final int state;

  @override
  Widget build(BuildContext context) {
    TextStyle styleSm = TextStyle(fontSize: sp(26), color: Color(0xff333333));

    return Container(
        height: height(214),
        margin: EdgeInsets.only(left: width(20),right: width(20),),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.5, color: kDividerColor))),
        child:   Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${Tr.of(context).miningTime}：${startTime} ${Tr.of(context).miningTo} ${endTime}', style: styleSm),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height(22),),
                    Text('${Tr.of(context).miningAmount}：${quantity}'+' ${Currency}', style: styleSm),
                    SizedBox(height: height(22),),
                    Text('${Tr.of(context).contractExpectedReturn}：${amount}'+' ${Currency}', style: styleSm)
                  ],
                ),
                SizedBox(width: width(20),),
                state==1 ?  Image.asset('images/assets/icon_lockup.png',
                    width: width(90), height: height(80)):Image.asset('images/assets/icon_release.png',
                    width: width(90), height: height(80)),
              ],
            )
          ],
        )
    );
  }
}