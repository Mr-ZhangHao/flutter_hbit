/*
* @message: 普通委托
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-22 21:35:24
* @LastEditors: Roy
* @LastEditTime: 2020-09-07 16:15:12
* @Deprecated: 否
* @FilePath: /HBit_flutter/lib/pages/contract/widgets/nomarl_entrust.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/contract/provider/contract_provider.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

import 'market/contract_left.dart';
import 'market/contract_right.dart';
import 'market/order_item.dart';

/// 普通委托
class NomarlEntrustWidget extends StatefulWidget {
  const NomarlEntrustWidget({
    Key key,
  }) : super(key: key);

  @override
  _NomarlEntrustWidgetState createState() => _NomarlEntrustWidgetState();
}

class _NomarlEntrustWidgetState extends State<NomarlEntrustWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.zero,
          sliver: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ContractLeft(planType: PlanType.normal),
              ContractRight(model2: ContractOrderProvider()),
            ],
          ),
        ),
        SliverPadding(padding: EdgeInsets.zero, sliver: TabList()),
        // 是一个所有子元素高度都为50像素的列表
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              // 创建列表项
              return OrderItemWidget();
            },
            // 50个列表项
            childCount: 50,
          ),
        )
      ],
      // child: Container(
      //     color: Colors.white,
      //     padding: EdgeInsets.symmetric(horizontal: width(24)),
      //     child: Column(
      //       children: <Widget>[
      //         Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             ContractLeft(planType: PlanType.normal),
      //             ContractRight(model2: OrderRecordProvider()),
      //           ],
      //         ),
      //         TabList(),
      //         Expanded(
      //             child: ListView.builder(
      //           itemExtent: 80,
      //           itemBuilder: (context, index) {
      //             return OrderItemWidget();
      //           },
      //           itemCount: 2,
      //         ))
      //       ],
      //     )),
    );
  }
}

class TabList extends StatefulWidget {
  TabList({Key key}) : super(key: key);

  @override
  _TabListState createState() => _TabListState();
}

class _TabListState extends State<TabList> {
  List<String> tabbarList = ['仓位', '当前跟单', '当前委托', '当前计划'];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {

    tabbarList = ['${Tr.of(context).contractPositions}', '${Tr.of(context).contractCurrentOrder}', '${Tr.of(context).tradrCurrentEntrust}', '${Tr.of(context).contractCurrentPlan}'];

    return SizedBox(
      height: height(88),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tabbarList.length,
          itemBuilder: (context, index) => buildTabItem(index)),
    );
  }

  Widget buildTabItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              tabbarList[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectIndex == index ? kPrimaryColor : kTextColor2,
                  fontSize: sp(30)),
            ),
            Container(
              height: 2,
              margin: EdgeInsets.only(top: height(20)),
              width: width(44),
              color: selectIndex == index ? kPrimaryColor : kTransprant,
            )
          ],
        ),
      ),
    );
  }
}
