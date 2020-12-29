/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-19 17:58:05
* @LastEditors: Roy
* @LastEditTime: 2020-09-15 16:16:19
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/widgets/market/contract_popup.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:flutter/material.dart';

import '../../../../common/button/index.dart';
import '../../../../constants/index.dart';
import '../../../../utils/screen.dart';

class WareHouseView extends StatefulWidget {
  WareHouseView({Key key, this.onSelect, this.title, this.numHand}) : super(key: key);
  final Function onSelect;
  final String title;
  final String numHand;
  @override
  _WareHouseViewState createState() => _WareHouseViewState();
}

class _WareHouseViewState extends State<WareHouseView> {
  String numHand = '20';
  @override
  void initState() {
    super.initState();
    setState(() {
      numHand = widget.numHand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Material(
        //创建透明层
        type: MaterialType.transparency, //透明类型
        child: Container(
          // height: width(440),
          width: double.infinity,
          padding: EdgeInsets.only(bottom: height(40), left: width(45), right: width(45)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(width(2)), topRight: Radius.circular(width(2))),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: height(40)),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                  Text(
                    widget.title,
                    style: TextStyle(color: Color(0xff323232), fontWeight: FontWeight.bold, fontSize: sp(32)),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "${Tr.of(context).contractClose}",
                        style: TextStyle(color: Color(0xff9BAECA), fontWeight: FontWeight.bold, fontSize: sp(30)),
                      )),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: height(30)),
                child: Text(
                  "${Tr.of(context).contractSelectMultiple}",
                  style: TextStyle(color: Color(0xff323232), fontWeight: FontWeight.bold, fontSize: sp(30)),
                ),
              ),
              // _contentView('当前杠杆倍数最高可开','0'),
              // _contentView('当前仓位所需保证金','0USDT'),
              // _contentView('保证金需追加','0USDT'),
              SizedBox(height: height(20)),
              PercentageButton(
                numInput: numHand,
                onSelect: (e) {
                  setState(() {
                    numHand = e['id'].toString();
                  });
                },
              ),
              Container(
                margin: EdgeInsets.only(top: height(50)),
                width: double.infinity,
                child: SmallButton(
                  color: kPrimaryColor,
                  isBorder: false,
                  fontSize: sp(30),
                  textColor: kTextColorF2,
                  height: height(90),
                  borderRadius: BorderRadius.all(Radius.circular(height(45))),
                  text: '${Tr.of(context).Confirm}',
                  onPressed: () {
                    widget.onSelect(numHand);
                    Navigator.of(context).pop();
                  }, // 可传参到父组件
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleView() {
    return Container(
      alignment: Alignment.center,
      height: width(90),
      child: Text(
        widget.title,
        style: TextStyle(
            color: Color(0xff333333), fontSize: sp(32), fontWeight: FontWeight.normal, decoration: TextDecoration.none),
      ),
    );
  }

  Widget _numView() {
    return Container(
      margin: EdgeInsets.only(top: height(20)),
      height: width(90),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: width(20)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(width(10))),
        border: Border.all(color: Color(0xffEBEBEB), width: width(1)),
        color: Color(0xffF7F7F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(numHand),
          Text('X | ${Tr.of(context).contractMaximumMultiple}100X'),
        ],
      ),
    );
  }
}

Widget _contentView(String leftText, String rightText) {
  return Container(
    margin: EdgeInsets.only(top: height(15)),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
      Text(
        leftText,
        style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(30)),
      ),
      Text(
        rightText,
        style: TextStyle(color: Color(0xff333333), fontSize: sp(30)),
      ),
    ]),
  );
}

class PercentageButton extends StatefulWidget {
  PercentageButton({Key key, this.onSelect, this.numInput}) : super(key: key);
  final Function onSelect;
  final String numInput;
  @override
  _PercentageButtonState createState() => _PercentageButtonState();
}

class _PercentageButtonState extends State<PercentageButton> {
  List<dynamic> list = [
    {"id": 20, "num": "20X"},
    {"id": 25, "num": "25X"},
    {"id": 50, "num": "50X"},
    {"id": 100, "num": "100X"}
  ];

  /// 当前选中的百分比
  num _currentHand = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: list
          .asMap()
          .keys
          .map(
            (index) => Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(height(30))),
                  color: widget.numInput == list[index]['id'].toString() ? Color(0xff126DFF) : Color(0xffF5F5F5),
                  // image: DecorationImage(
                  //     image: widget.numInput == list[index]['id'].toString()
                  //         ? AssetImage('images/contract/hand.png')
                  //         : AssetImage('images/contract/hand_gray.png'),
                  //     fit: BoxFit.fill),
                ),
                margin: EdgeInsets.only(right: width(10)),
                child: SmallButton(
                  color: kTransprant,
                  isBorder: false,
                  borderColor: kTransprant,
                  borderWidth: width(0),
                  fontSize: sp(24),
                  textColor: widget.numInput == list[index]['id'].toString() ? Color(0xffffffff) : kTextColor9,
                  height: height(60),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  text: list[index]['num'],
                  onPressed: () => _itemClick(index),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  _itemClick(index) {
    setState(() => _currentHand = index);
    widget.onSelect(list[index]);
  }
}
