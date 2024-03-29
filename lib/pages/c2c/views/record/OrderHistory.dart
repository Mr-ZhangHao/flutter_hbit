import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/tabbar/indicator.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/c2c/views/record/OrderHistoryChildPage.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory>with SingleTickerProviderStateMixin {
  List<String> tabbarList = ['未完成', '已完成','已取消'];
  TabController _tabController;

  int selectCoinId = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabbarList.length);
    _tabController.index = 0;
    // _tabController.addListener(() {
    //   if ( _tabController.index==0) {
    //      _orderListState.currentState.loadData(1);
    //   } else {
    //     _orderListState1.currentState.loadData(1);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {

    tabbarList = [Tr.of(context).c2cUndone, Tr.of(context).assetcompleted,Tr.of(context).c2cCancelled];

    return Scaffold(
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
        title: Text('${Tr.of(context).tradrHistoricalOrders}',
            style: TextStyle(color: kTextColor3, fontSize: sp(32))),
        centerTitle: true,
        elevation: 1,

      ),
      body: Column(
        children: [
          Container(
            height: width(100),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                    vertical: BorderSide(
                        width: width(1), color: Color(0xffEAEAEA)))),
            child: TabBar(
              labelColor: Color(0xff126DFF),
              unselectedLabelColor: Color(0xff999999),
              indicator: TabBarIndicator(),
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.symmetric(vertical: width(10)),
              indicatorColor: Color(0xff333333),
              controller: _tabController,
              tabs: tabbarList
                  .map(
                    (e) => Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(
                    e,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: sp(30),
                    ),
                  ),
                ),
              )
                  .toList(),
              onTap: (int index) {
                _tabController.index = index;
                setState(() {});
              },
            ),
          ),
          Expanded(child:     Container(
            height: double.infinity,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                /*             OrderList('current', symbol, side, model2,
                    key: _orderListState),
                OrderList('history', symbol, side, model2,
                    key: _orderListState1),*/
                OrderHistoryChildPage(1,0,0),
                OrderHistoryChildPage(4,0,0),
                OrderHistoryChildPage(0,0,0),
              ],
            ),
          ),)

        ],
      ),
    );
  }
}
