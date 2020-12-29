/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-17 20:40:09
* @LastEditors: Jack
* @LastEditTime: 2020-08-17 20:49:50
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/widgets/market/price_popover.dart
*/
import 'package:HBit/constants/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:cool_ui/cool_ui.dart';
import 'package:flutter/material.dart';

class PricePopoverButton extends StatelessWidget {
  final Widget text;
  final List<String> items;
  final Function onActive;
  const PricePopoverButton({
    Key key,
    this.text,
    this.items,
    this.onActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPopoverButton(
        popoverWidth: width(250),
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Row(
            children: <Widget>[
              text,
              SizedBox(width: width(20)),
              ImageIcon(
                AssetImage('images/home/arrow.png'),
                size: sp(20),
                color: Colors.grey,
              )
            ],
          ),
        ),
        popoverBuild: (BuildContext context) {
          return CupertinoPopoverMenuList(
            children: items
                .asMap()
                .keys
                .map((e) => CupertinoPopoverMenuItem(
                      isTapClosePopover: true,
                      onTap: () {
                        onActive((items[e]));
                        return false;
                      },
                      child: Container(
                        height: height(75),
                        alignment: Alignment.center,
                        child: Text(
                          items[e],
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kTextColor3),
                        ),
                      ),
                    ))
                .toList(),
          );
        });
  }
}
