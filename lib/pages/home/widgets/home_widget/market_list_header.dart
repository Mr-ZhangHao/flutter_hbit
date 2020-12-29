import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/home/widgets/home_widget/contract_list.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:HBit/common/i18n/i18n.dart';

class MarketListHeader extends StatelessWidget {
  final Function onPriceTab;
  final Function onRateTab;
  final Sorting priceAscending;
  final Sorting rateAscending;

  const MarketListHeader({Key key, this.onPriceTab, this.onRateTab, this.priceAscending, this.rateAscending})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextStyle sty1 = TextStyle(fontSize: sp(28), color: Color(0xffc2c2c2));
    return Container(
      margin: EdgeInsets.only(top: width(8)),
      child: Row(
        children: <Widget>[
          Expanded(child: Padding(padding: EdgeInsets.only(left: width(30)), child: Text(Tr.of(context).homeName, style: sty1))),
          Expanded(child: SortItem(ascending: priceAscending, text: Tr.of(context).homeLatestprice, sty1: sty1, onTab: onPriceTab)),
          Expanded(child: SortItem(ascending: rateAscending, text: Tr.of(context).homeChange, sty1: sty1, onTab: onRateTab)),
        ],
      ),
    );
  }
}

class SortItem extends StatelessWidget {
  final TextStyle sty1;
  final String text;
  final Function onTab;
  final Sorting ascending;

  const SortItem({Key key, this.sty1, this.text, this.onTab, this.ascending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
          padding: EdgeInsets.only(left: width(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(text, style: sty1),
              Container(
                width: width(40),
                height: width(20),
                alignment: Alignment.centerLeft,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: -1.5,
                      child: Icon(
                        Icons.arrow_drop_up,
                        color: ascending == Sorting.ascending ? kPrimaryColor : Color(0xffd8d8d8),
                        size: sp(38),
                      ),
                    ),
                    Positioned(
                      top: -1.5,
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: ascending == Sorting.descending ? kPrimaryColor : Color(0xffd8d8d8),
                        size: sp(38),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
