/*
* @message: 主页HOME
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Roy
* @LastEditTime: 2020-10-26 15:46:51
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/home_screen.dart
*/
import 'dart:async';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/home/provider/index.dart';
import 'package:HBit/pages/home/routes/index.dart';
import 'package:HBit/pages/home/views/searchdelegate/search_delegate.dart';
import 'package:HBit/pages/home/widgets/home_widget/banner.dart';
import 'package:HBit/pages/home/widgets/home_widget/contract_list.dart';
import 'package:HBit/pages/home/widgets/home_widget/home_app_bar.dart';
import 'package:HBit/pages/home/widgets/home_widget/home_market_charts.dart';
import 'package:HBit/pages/home/widgets/home_widget/marked_list.dart';
import 'package:HBit/pages/home/widgets/home_widget/noties.dart';
import 'package:HBit/pages/home/widgets/home_widget/share_banner.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/pages/mine/routes/index.dart';
import 'package:HBit/routes/application.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/pages/c2c/provider/index.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;
  RefreshController _refreshController = RefreshController();
 // List<String> _tabs = [Tr.of(navigatorKey.currentState.context).homeOptional,Tr.of(navigatorKey.currentState.context).homeContract, Tr.of(navigatorKey.currentState.context).homeCoin];
  List<String> _tabs = ['自选','币币','合约'];
  Timer timer;
  @override
  void dispose() {
    super.dispose();
    if(timer!=null){
      timer?.cancel();

    }

    if(_scrollViewController!=null){
      _scrollViewController.dispose();

    }
    if(_tabController!=null){
      _tabController.dispose();

    }
    if(_refreshController!=null){
      _refreshController.dispose();


    }


  }

  onRefresh() {
    print('onRefresh');
    // 刷新完成
    _refreshController.refreshCompleted();
  }

  onLoadMore() {
    return null;
  }



  @override
  void initState() {
    super.initState();

    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(vsync: this, length: _tabs.length, initialIndex: 1);
    Provider.of<HomeProvider>(context, listen: false).getData();
    Provider.of<C2cProvider>(context, listen: false).getCoinsList();

    WidgetsBinding.instance.addPostFrameCallback((mag) {
      Provider.of<C2cProvider>(context, listen: false).getC2cCurrencyList();
      Provider.of<MineProvider>(context, listen: false).getUserInfo();
      Provider.of<HomeProvider>(context, listen: false).getBanner();
      Provider.of<HomeProvider>(context, listen: false).getNotices();
      if (GlobalConfig.isTimer) {
        timer = Timer.periodic(Duration(seconds: 20), (timer) {
          Provider.of<HomeProvider>(context, listen: false).getData();
        });
      } else {
        Provider.of<HomeProvider>(context, listen: false).getData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _tabs = [Tr.of(context).homeOptional, Tr.of(context).homeCoin,Tr.of(context).homeContract];

    return Scaffold(
      // appBar: homeAppBarWidget(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            HomeAppBar(
              onTab: () {
               timer?.cancel();
                //Routers.push(context, MineRouter.mine);
                Routers.pushResult(context, MineRouter.mine, (val) {
                  if (GlobalConfig.isTimer) {
                    timer = Timer.periodic(Duration(seconds: 30), (timer) {
                      Provider.of<HomeProvider>(context, listen: false).getData();
                    });
                  } else {
                    Provider.of<HomeProvider>(context, listen: false).getData();
                  }
                });
              },
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              if (index == 0) {
                return SwiperBanner();
              } else if (index == 1) {
                return NoticesBarWidget();
              } else if (index == 2) {
                return HomeMarketCharts(h: width(260));
              } else {
                return ShareBanner(h: width(170));
              }
            }, childCount: 4)),
          ];
        },
        body: Container(
          color: kWhite,
          child: Column(
            children: <Widget>[
              HomeTabBarWrap(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TabBar(
                        isScrollable: true,
                        // labelPadding: EdgeInsets.only(left: width(40), right: width(40)),
                        labelColor: Theme.of(context).tabBarTheme.labelColor,
                        unselectedLabelColor: Color(0xff323232),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Theme.of(context).tabBarTheme.labelColor,
                        controller: _tabController,
                        tabs: _buildTabs(),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      color: Color(0xffC2C2C2),
                      onPressed: () {
                        Routers.push(context, HomeRouter.search);

                      },
                    )
                  ],
                ),
              ),
              _tabBarView()
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabBarView() {
    return Expanded(
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: width(40)),
        decoration: BoxDecoration(color: kWhite),
        child: TabBarView(
          controller: _tabController,
          children: [
            MarketListView(0),
            MarketListView(2),
            ContractListView(),
          ],
        ),
      ),
      flex: 1,
    );
  }

  List<Widget> _buildTabs() {
    return _tabs
        .asMap()
        .keys
        .map((i) => Container(
              alignment: Alignment.centerLeft,
              child: Text(
                _tabs[i],
                style: TextStyle(fontSize: sp(32)),
              ),
            ))
        .toList();
  }
}

class HomeTabBarWrap extends StatelessWidget {
  final Widget child;
  const HomeTabBarWrap({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: width(80),
        decoration: BoxDecoration(boxShadow: kDefaultShadow, color: kWhite),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffF8FDFF),
          ),
          child: child,
        ));
  }
}
