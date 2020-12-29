import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/refresh/page_list.dart';
import 'package:HBit/pages/contract/model/contract_order_model.dart';
import 'package:HBit/pages/wallet/widgets/RecordItemWidget.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class RecordList extends PageList {
  RecordList({Key key}) : super(key: key);

  @override
  _RecordListState createState() => _RecordListState();
}

class _RecordListState extends PageListState<ContractOrderModel, RecordList> {
  @override
  void initState() {
    loadData(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildList(context);
  }

  @override
  buildItem(ContractOrderModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(24)),
      child: RecordItemWidget(),
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
    return SizedBox();
  }

  ///加载数据
  @override
  loadPage({int page, Function(List<ContractOrderModel>) onSuccess, Function onErr}) async {
    onSuccess([
      ContractOrderModel(),
      ContractOrderModel(),
    ]);
  }
}
