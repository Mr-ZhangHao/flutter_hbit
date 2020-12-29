import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/pages/wallet/widgets/assets_bibi.dart';
import 'package:HBit/pages/wallet/widgets/assets_contract.dart';
import 'package:flutter/material.dart'hide Router;
import 'package:flutter/cupertino.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/wallet/routes/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:fluro/fluro.dart';

enum AssetsType { currency, contract }

class WalletScreen extends StatefulWidget {
  WalletScreen({Key key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> with SingleTickerProviderStateMixin {
  AssetsType assetsType = AssetsType.currency;

  List tabbarList = ['币币资产', '合约资产'];

  TabController _tabController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabbarList.length);
    _tabController.addListener(() => _onTabChanged());
  }

  _onTabChanged() {
    if (_tabController.indexIsChanging) {
      if (this.mounted) {
        this.setState(() => currentIndex = _tabController.index);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    tabbarList = ['${Tr.of(context).assetCoin}', '${Tr.of(context).assetContract}'];
    return Scaffold(
        appBar: homeAppBarWidget(),
        backgroundColor: Colors.white,
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[BibiBody(), ContractBody()],
        ));
  }

  AppBar homeAppBarWidget() {
    return AppBar(
      elevation: 0,
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Container(
        width: width(400),
        margin: EdgeInsets.only(left: width(20)),
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(width(35))), color: kTextColor4),
        child: TabBar(
          controller: _tabController,
          indicatorColor: kTransprant,
          labelPadding: EdgeInsets.zero,
          tabs: <Widget>[
            Container(
                width: width(196),
                height: height(58),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: currentIndex == 0 ? kDefaultShadow : null,
                    borderRadius: BorderRadius.all(Radius.circular(width(35))),
                    color: currentIndex == 0 ? kWhite : kTransprant),
                child: Text("${Tr.of(context).assetCoin}",
                    style: TextStyle(color: currentIndex == 0 ? kPrimaryColor : kTextColor3, fontSize: sp(30)))),
            Container(
                width: width(196),
                height: height(58),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: currentIndex == 1 ? kDefaultShadow : null,
                    borderRadius: BorderRadius.all(Radius.circular(width(35))),
                    color: currentIndex == 1 ? kWhite : kTransprant),
                child: Text(Tr.of(context).assetContract,
                    style: TextStyle(color: currentIndex == 1 ? kPrimaryColor : kTextColor3, fontSize: sp(30))))
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(right: width(20)),
          alignment: Alignment.center,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (currentIndex == 0) {
                Routers.push(context, WalletRouter.recordBibi);
              } else {
                Routers.push(context, WalletRouter.recordContract);
              }
            },
            child: Text(currentIndex == 0 ? '${Tr.of(context).assetCoinrecord}' : '${Tr.of(context).assetContractrecord}', style: TextStyle(color: kTextColor3, fontSize: 12)),
          ),
        )
      ],
    );
  }
}
