import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/tabbar/indicator.dart';
import 'package:HBit/pages/c2c/routes/index.dart';
import 'package:HBit/pages/c2c/views/c2cBuyBody.dart';
import 'package:HBit/pages/c2c/views/c2cSellBody.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class C2c_screen extends StatefulWidget {

  C2c_screen({Key key}) : super(key: key);
  @override
  _C2c_screenState createState() => _C2c_screenState();
}

class _C2c_screenState extends State<C2c_screen> with SingleTickerProviderStateMixin {


  List tabbarList = ['购买', '出售'];

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
  Widget build(BuildContext context) {
    tabbarList = ['${Tr.of(context).c2cBuy}', '${Tr.of(context).c2cSell}'];
    return Scaffold(
        appBar: C2cAppBarWidget(),
        backgroundColor: Colors.white,
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[c2cBuyBody(), c2cSellBody()],
        ));
  }

  AppBar C2cAppBarWidget() {
    return AppBar(
      elevation: 1,
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: false,

      title:Center(
        child: Container(
          width: width(260),
          height: height(80),
          alignment: Alignment.center,
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
      ),
      actions: <Widget>[

        GestureDetector(
          onTap: (){
            Routers.push(context, C2CRouter.orderHistory);
          },
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/c2c/c2c_record.png', width: width(48), height: height(48)),
              SizedBox(width: width(20),)
            ],
          ),
        )
      ],
    );
  }
}
