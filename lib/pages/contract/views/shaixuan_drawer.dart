/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-18 18:02:09
* @LastEditors: Roy
* @LastEditTime: 2020-08-20 14:45:57
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/view/shaixuan_drawer.dart
*/
import 'package:HBit/common/drawer/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

import '../../../common/button/index.dart';
import '../../../constants/index.dart';
import '../../../utils/screen.dart';

class ShaiXuanDrawer extends StatefulWidget {
  const ShaiXuanDrawer({
    Key key,
    this.onTab,
  }) : super(key: key);
  final ValueChanged<String> onTab;

  @override
  _ShaiXuanDrawerState createState() => _ShaiXuanDrawerState();
}

class _ShaiXuanDrawerState extends State<ShaiXuanDrawer>
    with SingleTickerProviderStateMixin {
  bool isShow = true;

  List list = ['全部', '开多', '开空', '平多', '平空', '强制减多', '强制减空'];

  String selectType = "全部";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    list = ['${Tr.of(context).tradrAll}', '${Tr.of(context).contractOpenLong}', '${Tr.of(context).contractOpenShort}',
      '${Tr.of(context).contractCloseLong}', '${Tr.of(context).contractCloseShort}', '${Tr.of(context).contractForced1}', '${Tr.of(context).contractForced2}'];
    selectType = "${Tr.of(context).tradrAll}";
    return CustomDrawer(
      child: Scaffold(
        body: Visibility(
          visible: isShow,
          child: Stack(
            children: <Widget>[
              _headerView(),
              _footerView(),
            ],
          ),
          replacement: _selectView(),
        ),
      ),
    );
  }

  Widget _headerView() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: height(70), left: width(40)),
            alignment: Alignment.centerLeft,
            child: Text(
              '${Tr.of(context).TradrFilter}',
              style: TextStyle(
                fontSize: sp(30),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height(20), left: width(40)),
            alignment: Alignment.centerLeft,
            child: Text(
              '${Tr.of(context).assetTransactionType}',
              style: TextStyle(
                color: Color(0xffC0C0C0),
                fontSize: sp(30),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: height(20), left: width(40), right: width(40)),
            padding: EdgeInsets.symmetric(horizontal: width(20)),
            height: height(80),
            decoration: BoxDecoration(
                color: Color(0xffEDEDED),
                borderRadius: BorderRadius.all(Radius.circular(width(10)))),
            child: InkWell(
              onTap: () {
                setState(() {
                  isShow = false;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${Tr.of(context).assetChoosetype}',
                    style: TextStyle(
                      color: Color(0xffC0C0C0),
                      fontSize: sp(30),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        selectType,
                        style: TextStyle(
                          color: kTextColor3,
                          fontSize: sp(30),
                        ),
                      ),
                      Container(
                        width: width(40),
                        height: height(50),
                        child: Image.asset('images/contract/right_jiantou.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerView() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: height(90),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: width(1), color: Color(0xffD3D3D3)),
          ),
        ),
        child: Row(children: <Widget>[
          Expanded(
            child: SmallButton(
              color: kTransprant,
              textColor: kPrimaryColor,
              isBorder: false,
              borderWidth: 0,
              borderColor: kTransprant,
              height: height(90),
              borderRadius: BorderRadius.all(Radius.circular(width(0))),
              text: '${Tr.of(context).TradrReset}',
              onPressed: () {
                setState(() {
                  selectType = "${Tr.of(context).tradrAll}";
                });
              },
            ),
          ),
          Expanded(
            child: SmallButton(
              color: kPrimaryColor,
              textColor: Colors.white,
              isBorder: false,
              borderWidth: 0,
              borderColor: kTransprant,
              height: height(90),
              borderRadius: BorderRadius.all(Radius.circular(width(0))),
              text: '${Tr.of(context).Confirm}',
              onPressed: () {
                setState(() {
                  widget.onTab(selectType);
                });
                Navigator.of(context).pop();
              },
            ),
          ),
        ]),
      ),
    );
  }

  Widget _selectView() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: height(70), left: width(40)),
            alignment: Alignment.centerLeft,
            child: Text(
              '${Tr.of(context).assetChoosetype}',
              style: TextStyle(
                fontSize: sp(30),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.centerLeft,
                  height: height(80),
                  padding: EdgeInsets.symmetric(horizontal: width(40)),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectType = list[index];
                        isShow = true;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          list[index],
                          style: TextStyle(color: kTextColor9),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
