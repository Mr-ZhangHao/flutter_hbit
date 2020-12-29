import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class ClinchDetailPage extends StatefulWidget {
  ClinchDetailPage({Key key}) : super(key: key);

  @override
  _ClinchDetailPageState createState() => _ClinchDetailPageState();
}

class _ClinchDetailPageState extends State<ClinchDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('${Tr.of(context).contractTransactionDetail}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(width(30)),
          decoration: BoxDecoration(
            color: Color(0xffF4F7FB),
            border: Border(top: BorderSide(width: width(1), color: Color(0xff126DFF))),
          ),
          margin: EdgeInsets.symmetric(horizontal: width(40), vertical: height(40)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: RichText(
                      text: TextSpan(
                text: '${Tr.of(context).contractCloseBull}',
                style: TextStyle(fontSize: sp(30), color: kRedColor),
                children: [TextSpan(text: '·${Tr.of(context).contractUserEntrust}', style: TextStyle(fontSize: sp(30), color: kTextColor7))],
              ))),
              Container(
                margin: EdgeInsets.symmetric(vertical: width(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: textLabel('${Tr.of(context).TradrVolume}(${Tr.of(context).assetHand})', sp(26), TextAlign.left, kLineColor2)),
                    Expanded(child: textLabel('${Tr.of(context).TradrAverageprice}', sp(26), TextAlign.left, kLineColor2)),
                    Expanded(child: textLabel('${Tr.of(context).tradrFee}(USDT)', sp(26), TextAlign.right, kLineColor2)),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: textLabel('1', sp(30), TextAlign.left, kTextColor3)),
                    Expanded(child: textLabel('1', sp(30), TextAlign.left, kTextColor3)),
                    Expanded(child: textLabel('1', sp(30), TextAlign.right, kTextColor3)),
                  ],
                ),
              ),
              lableView('${Tr.of(context).contractEntrustType}', 'GTC', Color(0xffC0C0C0)),
              Container(
                margin: EdgeInsets.only(top: height(20)),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(width: height(1), color: kLineColor2)),
                ),
              ),
              lableView('${Tr.of(context).contractTransactionTime}', '2020-08-26 15:04', Color(0xffC0C0C0)),
              lableView('${Tr.of(context).contractTransactionPrice}', 'T 0.11326', Color(0xffC0C0C0)),
              lableView('${Tr.of(context).TradrVolume}', '1 ${Tr.of(context).assetHand}', Color(0xffC0C0C0)),
              lableView('${Tr.of(context).tradrFee}', '-0.00453040 USDT', Color(0xffD45151)),
            ],
          ),
        ),
      ),
    );
  }

  Widget textLabel(String text, double fontSize, TextAlign textAlign, Color color) {
    return Text(text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
        ),
        textAlign: textAlign);
  }

  Widget lableView(String leftText, String rightText, Color color) {
    return Container(
      margin: EdgeInsets.only(top: height(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          textLabel(leftText, sp(26), TextAlign.left, color),
          textLabel(rightText, sp(26), TextAlign.right, color)
        ],
      ),
    );
  }
}
