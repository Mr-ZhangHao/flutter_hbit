/*
* @message: tabBar 底部导航按钮以及显示的页面
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-11 16:50:49
* @LastEditors: Jack
* @LastEditTime: 2020-08-26 10:06:10
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/common/tabbar/index.dart
*/

import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/update/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/c2c/c2c_screen.dart';
import 'package:HBit/pages/contract/contract_screen.dart';
import 'package:HBit/pages/home/home_screen.dart';
// import 'package:HBit/pages/home/home.dart';
import 'package:HBit/pages/login/login_screen.dart';
import 'package:HBit/pages/login/provider/user_provider.dart';
import 'package:HBit/pages/trade/trade_screen.dart';
import 'package:HBit/pages/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
// import 'package:HBit/components/update/index.dart';

import 'package:HBit/providers/gloable_provider.dart';
import 'package:HBit/providers/provider_widget.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/sp_utils.dart';

class BottomTabBar extends StatefulWidget {
  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  GlobalKey bottomNavigationBarKey = GlobalKey();



    String coin = '币币';
    String home = '首页';
    String contract = '合约';
    String assets = '资产';

  List<BottomNavigationBarItem> list = [
    BottomNavigationBarItem(
      icon: Image.asset('images/tabBar/home01.png', width: width(44), height: width(44)),
      activeIcon: Image.asset('images/tabBar/home02.png', width: width(44), height: width(44)),
      title: Text('首页'),
    ),    BottomNavigationBarItem(
      icon: Image.asset('images/tabBar/c2c01.png', width: width(44), height: width(44)),
      activeIcon: Image.asset('images/tabBar/c2c02.png', width: width(44), height: width(44)),
      title: Text('法币'),
    ),
    BottomNavigationBarItem(
      icon: Image.asset('images/tabBar/bibi01.png', width: width(44), height: width(44)),
      activeIcon: Image.asset('images/tabBar/bibi02.png', width: width(44), height: width(44)),
      title: Text('币币'),
    ),
    BottomNavigationBarItem(
      icon: Image.asset('images/tabBar/heyue01.png', width: width(44), height: width(44)),
      activeIcon: Image.asset('images/tabBar/heyue02.png', width: width(44), height: width(44)),
      title: Text('合约'),
    ),
    BottomNavigationBarItem(
      icon: Image.asset('images/tabBar/zican01.png', width: width(44), height: width(44)),
      activeIcon: Image.asset('images/tabBar/zican02.png', width: width(44), height: width(44)),
      title: Text('资产'),
    ),
  ];
  final List<Widget> _pageList = [
    HomeScreen(), // 首页
    C2c_screen(), // 币币
    TradeScreen(), // 币币
    ContractScreen(), // 合约
    WalletScreen(), // 自残
  ];

  DateTime _lastPressed;

  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    UpdateUtil().checkVersion(context);
  }

  @override
  Widget build(BuildContext context) {
    list = [
      BottomNavigationBarItem(
        icon: Image.asset('images/tabBar/home01.png', width: width(44), height: width(44)),
        activeIcon: Image.asset('images/tabBar/home02.png', width: width(44), height: width(44)),
        title: Text(Tr.of(context).mainHome),
      ),
      BottomNavigationBarItem(
        icon: Image.asset('images/tabBar/c2c01.png', width: width(44), height: width(44)),
        activeIcon: Image.asset('images/tabBar/c2c02.png', width: width(44), height: width(44)),
        title: Text(Tr.of(context).mainOtc),
      ),
      BottomNavigationBarItem(
        icon: Image.asset('images/tabBar/bibi01.png', width: width(44), height: width(44)),
        activeIcon: Image.asset('images/tabBar/bibi02.png', width: width(44), height: width(44)),
        title: Text(Tr.of(context).mainCoin),
      ),
      BottomNavigationBarItem(
        icon: Image.asset('images/tabBar/heyue01.png', width: width(44), height: width(44)),
        activeIcon: Image.asset('images/tabBar/heyue02.png', width: width(44), height: width(44)),
        title: Text(Tr.of(context).mainContract),
      ),
      BottomNavigationBarItem(
        icon: Image.asset('images/tabBar/zican01.png', width: width(44), height: width(44)),
        activeIcon: Image.asset('images/tabBar/zican02.png', width: width(44), height: width(44)),
        title: Text(Tr.of(context).mainAssets),
      ),
    ];
    final String token = SpUtils.sp.getString('token');
    final bool isLogin = token != null && token != '';
    return WillPopScope(
      onWillPop: () async => showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(title: Text(Tr.of(context).homeQuitHint, style: TextStyle(color: Colors.black87)), actions: <Widget>[
                RaisedButton(child: Text(Tr.of(context).homeQuit), onPressed: () => Navigator.of(context).pop(true)),
                RaisedButton(child: Text(Tr.of(context).cancel), onPressed: () => Navigator.of(context).pop(false)),
              ])),
      child: ProviderWidget<UserProvider>(
        model: UserProvider(),
        builder: (BuildContext context, UserProvider userModel, Widget child) {
          if (isLogin) {
            return Container(
                child: Consumer<GloableProvider>(
                    builder: (_, provider, __) => Scaffold(
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          body: this._pageList[provider.bottomCurrIndex],
                          bottomNavigationBar: BottomNavigationBar(
                            key: bottomNavigationBarKey,
                            backgroundColor: Theme.of(context).bottomAppBarTheme.color,
                            type: BottomNavigationBarType.fixed, //可以有多个按钮
                            currentIndex: provider.bottomCurrIndex,
                            selectedItemColor: Theme.of(context).tabBarTheme.labelColor,
                            unselectedItemColor: kTextColor6,
                            selectedFontSize: sp(24),
                            unselectedFontSize: sp(24),
                            onTap: (int index) {
                              provider.setCurrIndex(index);
                            },
                            items: this.list,
                          ),
                        )));
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
