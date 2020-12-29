import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/tabbar/indicator.dart';
import 'package:HBit/common/toast/drop-down.dart';
import 'package:HBit/pages/contract/model/cmarket_model.dart';
import 'package:HBit/pages/contract/provider/contract_common_provider.dart';
import 'package:HBit/pages/contract/widgets/all_order/current_entrust.dart';
import 'package:HBit/pages/contract/widgets/all_order/current_plan.dart';
import 'package:HBit/pages/contract/widgets/all_order/entrust_history.dart';
import 'package:HBit/pages/contract/widgets/all_order/history_list.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/screen.dart';

class ContractRecordPage extends StatefulWidget {
  ContractRecordPage({Key key}) : super(key: key);

  @override
  _ContractRecordPageState createState() => _ContractRecordPageState();
}

class _ContractRecordPageState extends State<ContractRecordPage> with SingleTickerProviderStateMixin {
  List<String> tabbarList = ['当前委托', '历史委托', '当前计划', '历史计划'];

  TabController _tabController;

  int selectCoinId = 0;
  String coinName = "";
  bool isShow = false;
  //这里就是关键的代码，定义一个key
  GlobalKey<ContractEntrustListState> contractEntrustListState = GlobalKey<ContractEntrustListState>();
  GlobalKey<ContractPlanListState> contractPlanListState = GlobalKey<ContractPlanListState>();
  GlobalKey<PlanHistroyListState> planHistroyListState = GlobalKey<PlanHistroyListState>();
  GlobalKey<EntrustHistroyListState> entrustHistroyListState = GlobalKey<EntrustHistroyListState>();
  List<CMarketModel> marketList = [];
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: tabbarList.length, initialIndex: 0);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((mag) async {
      ContractCommonProvider model = Provider.of<ContractCommonProvider>(context, listen: false);
      await model.loadData();
      setState(() => coinName = model.marketItem.symbol);
      model.setSymboleAndType(model.marketItem.symbol, 0, 0);
    });
  }

  /// 更新用户状态
  void updateState(fn) {
    if (mounted) {
      setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    tabbarList = ['${Tr.of(context).tradrCurrentEntrust}', '${Tr.of(context).contractHistoricalEntrust}', '${Tr.of(context).contractCurrentPlan}', '${Tr.of(context).contractHistoricalPlan}'];
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async => Routers.goBackWithParams(context, ''),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset('images/mine/back@2x.png', width: width(22), height: height(36)),
              )),
          title: Consumer<ContractCommonProvider>(
            builder: (BuildContext context, ContractCommonProvider model, Widget child) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() => marketList = model.marketList);
                  setState(() => isShow = !isShow);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      model.symbole?.replaceAll('_', "/")?.toUpperCase(),
                      style: TextStyle(color: Color(0xff333333), fontSize: sp(32)),
                    ),
                    child
                  ],
                ),
              );
            },
            child: Container(
              width: width(40),
              height: height(30),
              child: Image.asset('images/contract/xiala.png'),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            PreferredSize(
              preferredSize: Size.fromHeight(width(70)),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.symmetric(vertical: BorderSide(width: width(1), color: Color(0xffEAEAEA)))),
                child: TabBar(
                  labelColor: Color(0xff126DFF),
                  unselectedLabelColor: Color(0xff999999),
                  indicator: TabBarIndicator(),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: EdgeInsets.symmetric(vertical: width(10)),
                  indicatorColor: Color(0xff333333),
                  controller: _tabController,
                  tabs: buildTabList(),
                  onTap: (int index) {
                    ContractCommonProvider model = Provider.of<ContractCommonProvider>(context, listen: false);
                    model.setSymboleAndType(model.symbole, model.selectCoinId, index);
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: height(90)),
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  ContractEntrustList(key: contractEntrustListState, reloadData: () => reloadData()),
                  EntrustHistroyList(key: entrustHistroyListState, reloadData: () => reloadData()),
                  ContractPlanList(key: contractPlanListState, reloadData: () => reloadData()),
                  PlanHistroyList(key: planHistroyListState, reloadData: () => reloadData()),
                ],
              ),
            ),
            Visibility(
              visible: isShow,
              child: DropDown(
                  // list: model.marketList,
                  list: marketList,
                  selectType: Provider.of<ContractCommonProvider>(context, listen: true).selectCoinId,
                  type: 1,
                  onSelect: (e) async {
                    print(e);
                    print(_tabController.index);
                    ContractCommonProvider model = Provider.of<ContractCommonProvider>(context, listen: false);
                    model.setSymboleAndType(e['coin_name'], e['type'], _tabController.index);
                    setState(() => isShow = !isShow);
                    if (model.currentIndex == 0) {
                      contractEntrustListState.currentState.loadData(1);
                    } else if (model.currentIndex == 1) {
                      entrustHistroyListState.currentState.loadData(1);
                    } else if (model.currentIndex == 2) {
                      contractPlanListState.currentState.loadData(1);
                    } else {
                      planHistroyListState.currentState.loadData(1);
                    }
                  }),
            ),
          ],
        )
        // endDrawer: ShaiXuanDrawer(
        //   onTab: (e) {},
        // ),
        );
  }

  List<Padding> buildTabList() {
    return tabbarList.map(
      (e) {
        return Padding(
            padding: EdgeInsets.only(bottom: 4), child: Text(e, maxLines: 1, style: TextStyle(fontSize: sp(25))));
      },
    ).toList();
  }

  void reloadData() {
    if (_tabController.index == 0) {
      contractEntrustListState.currentState.loadData(1);
    } else if (_tabController.index == 1) {
      entrustHistroyListState.currentState.loadData(1);
    } else if (_tabController.index == 2) {
      contractPlanListState.currentState.loadData(1);
    } else {
      planHistroyListState.currentState.loadData(1);
    }
  }
}
