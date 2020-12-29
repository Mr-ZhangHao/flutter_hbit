import 'package:HBit/common/event/c2cListEvent.dart';
import 'package:HBit/common/tabbar/indicator.dart';
import 'package:HBit/pages/c2c/model/C2cCurrency_model.dart';
import 'package:HBit/pages/c2c/views/C2cListPage.dart';
import 'package:HBit/pages/c2c/views/c2c_right_drawer.dart';
import 'package:HBit/routes/application.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:HBit/pages/c2c/model/C2cCoins_model.dart';
import 'package:HBit/pages/c2c/provider/index.dart';
import 'package:provider/provider.dart';

class c2cSellBody extends StatefulWidget {
  const c2cSellBody({
    Key key,
  }) : super(key: key);

  @override
  _c2cSellBodyState createState() => _c2cSellBodyState();
}

class _c2cSellBodyState extends State<c2cSellBody>  with SingleTickerProviderStateMixin {
  List tabbarList = [];
  List<C2cCoinsModel> C2cList = [];
  List<Widget> tabView = [];
  TabController _tabController;
  int currentIndex = 0;
  C2cCurrencyModel currencyModel ;
  String selectPayType = '';
  String selectCurrency = 'TWD';
  int PaymentID = 0 ;
  int currencyID = 0 ;
  List<C2cCurrencyModel> c2cCurrencyModel = [];

  @override
  void initState() {
    super.initState();

    C2cList = Provider
        .of<C2cProvider>(context, listen: false)
        .paymentInfo;

    for (int i = 0; i < C2cList.length; i++) {
      tabbarList.add(C2cList[i].name);
    }
    c2cCurrencyModel= Provider.of<C2cProvider>(context, listen: false)
        .c2cCurrencyModel;
    for (int i = 0; i < c2cCurrencyModel
        .length; i++) {
      if (c2cCurrencyModel[i].currency == selectCurrency) {
        setState(() {
          currencyID = c2cCurrencyModel[i].id;
          currencyModel = c2cCurrencyModel[i];
        });

      }

    }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: C2cAppBarWidget(),
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: _tabController,
        children: _C2cList(C2cList),
      ),
      endDrawer: C2cRightDrawer(
        currencyModel: currencyModel,
        selectPayType: selectPayType,
        onTab: (e) async {

        },
        onCurrencyTab: (e) async {
          setState(() {
            currencyModel = e;
            currencyID=currencyModel.id;
            Application.eventBus.fire(c2cListEvent(PaymentID,currencyID,currencyModel));
          });
        },
      ),
    );
  }

  List<Widget> _C2cList(List<C2cCoinsModel> model) {
    if (tabView.length == 0) {
      for (int i = 0; i < model.length; i++) {
        tabView.add(C2cListPage(1,model[i].id,model[i].name, model[i].name,currencyModel,currencyID,PaymentID));
      }
    }
    return tabView;
  }

  AppBar C2cAppBarWidget() {
    return AppBar(
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Container(
          width: width(150),
          height: height(80),
          alignment: Alignment.centerLeft,
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
        actions: <Widget>[
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width(20)),
                  child: Image.asset('images/c2c/c2c_screen.png', width: width(48), height: height(48))),
            );
          }),
        ]
    );
  }

}
