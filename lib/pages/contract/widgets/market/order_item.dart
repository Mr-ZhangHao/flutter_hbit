/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-12 16:43:19
* @LastEditors: Jack
* @LastEditTime: 2020-08-22 15:30:51
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/widgets/market/order_item.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

typedef cancelButton = void Function(int value);

class OrderItemWidget extends StatelessWidget {
  final cancelButton onTab;
  const OrderItemWidget({
    Key key,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(color: Color(0xffc0c0c0), fontSize: sp(30));
    TextStyle style2 = TextStyle(
        color: Color(0xff646464),
        fontSize: sp(30),
        letterSpacing: -1,
        fontWeight: FontWeight.w600);
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width(24), vertical: height(24)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
            // 设置单侧边框的样式
            color: kBorderColor,
            width: 0.5,
            style: BorderStyle.solid),
      )),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('${Tr.of(context).contractBull}', style: style2),
              Container(
                  width: width(160), child: Text('2020.08.09', style: style2)),
              Container(
                  constraints: BoxConstraints(
                      minWidth: width(100), maxWidth: width(120)),
                  child: Text('0.1234556',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: style2)),
              Container(
                width: width(80),
                child: Text('1213123',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: style2),
              ),
              Container(
                width: width(120),
                alignment: Alignment.centerRight,
                child: SmallButton(
                  color: kPrimaryColor,
                  isBorder: false,
                  fontSize: sp(24),
                  textColor: kTextColorF2,
                  height: height(60),
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  padding: EdgeInsets.symmetric(horizontal: width(4)),
                  text: '${Tr.of(context).contractClose2}',
                  onPressed: () => onTab(1), // 可传参到父组件
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
