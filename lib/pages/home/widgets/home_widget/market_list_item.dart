import 'package:HBit/constants/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:HBit/common/i18n/i18n.dart';

class MarketListItem extends StatelessWidget {
  final String symbol;
  final String close;
  final double rate;
  final String number;
  final String total;
  const MarketListItem({
    Key key,
    @required this.symbol,
    @required this.close,
    @required this.rate,
    @required this.number,
    @required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle styleBig = TextStyle(color: kTextColor3, fontWeight: FontWeight.bold);
    TextStyle styleSm = TextStyle(fontSize: sp(20), color: kB4B4B4);
    return Container(
      padding: EdgeInsets.symmetric(vertical: height(20)),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: kDividerColor))),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: width(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[Text(symbol, style: styleBig), Text('${Tr.of(context).home24volume}$number', style: styleSm)],
            ),
          )),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: width(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[Text(close, style: styleBig), Text('${Tr.of(context).home24Amount}\$:$total', style: styleSm)],
            ),
          )),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: width(30), right: width(30)),
            child: Container(
              height: height(50),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: rate > 0 ? kGreenColor : kRedColor,
                borderRadius: kDefaultRadius,
              ),
              child: Text(
                '${rate > 0 ? '+' : ''}${Utils.formatNumber(rate, 2)}%',
                style: TextStyle(color: kWhite),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
