/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-18 18:02:09
* @LastEditors: Roy
* @LastEditTime: 2020-09-10 16:05:46
* @Deprecated: 否
* @FilePath: /HBit_flutter/lib/pages/trade/widgets/order/right_drawer.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/drawer/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class RightDrawer extends StatefulWidget {
  const RightDrawer({
    Key key,
    this.onTab,
    this.selectType,
  }) : super(key: key);
  final ValueChanged<String> onTab;
  final String selectType;

  @override
  _RightDrawerState createState() => _RightDrawerState();
}

class _RightDrawerState extends State<RightDrawer> with SingleTickerProviderStateMixin {
  bool isShow = true;

  List list = ['全部', '买入', '卖出'];

  String selectType;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectType = widget.selectType;
    });
  }

  @override
  Widget build(BuildContext context) {
    list = ['${Tr.of(context).tradrAll}', '${Tr.of(context).tradrBuy}', '${Tr.of(context).tradrSell}'];
    return CustomDrawer(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _headerView(),
            _footerView(),
          ],
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
              style: TextStyle(fontSize: sp(30)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height(20), left: width(40), bottom: height(20)),
            alignment: Alignment.centerLeft,
            child: Text('${Tr.of(context).tradrDirection}', style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(30))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: list
                .map((e) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => {
                        setState(() {
                          selectType = e;
                        })
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffEFF8FE),
                            borderRadius: BorderRadius.circular(5),
                            image: selectType == e
                                ? DecorationImage(image: AssetImage('images/trade/select.png'), fit: BoxFit.fill)
                                : null),
                        height: width(70),
                        width: width(140),
                        child: Text(e,
                            style: TextStyle(
                                color: selectType == e ? kPrimaryColor : Color(0xff323232), fontSize: sp(24))),
                      ),
                    ))
                .toList(),
          )
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
                widget.onTab(selectType);
                Navigator.of(context).pop();
              },
            ),
          ),
        ]),
      ),
    );
  }
}
