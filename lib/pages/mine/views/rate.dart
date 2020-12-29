import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/mine/widgets/contract_rate_list.dart';
import 'package:HBit/pages/mine/widgets/fee_rate.dart';
import 'package:HBit/pages/mine/widgets/trade_rate_list.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class RatePage extends StatefulWidget {
  RatePage({Key key}) : super(key: key);

  @override
  _RatePageState createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> with SingleTickerProviderStateMixin {
  List<String> tabs = ['币币费率', '合约费率', '提币手续费'];

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: tabs.length, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tabs = ['${Tr.of(context).CurrencyRate}', '${Tr.of(context).ContractRate}', '${Tr.of(context).WithdrawalFee}'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Tr.of(context).rateStandard),
        leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Routers.goBack(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png', width: width(22), height: height(36)),
            )),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(width(96)),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.5, color: Color(0xffe5e5e5)),
                bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5)),
              ),
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: kPrimaryColor,
                indicatorColor: kPrimaryColor,
                unselectedLabelStyle: TextStyle(color: Color(0xff909090)),
                // labelPadding: EdgeInsets.only(left: width(40), right: width(40)),
                unselectedLabelColor: Color(0xff333333),
                tabs: tabs.map((e) => Tab(text: e)).toList(),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[TradeRateList(), ContractRateList(), FeeRateList()],
      ),
    );
  }
}
