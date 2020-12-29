import 'dart:convert';

import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/wallet/model/record_contract.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';

import 'package:HBit/pages/wallet/routes/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';

class RecordContractItemWidget extends StatelessWidget {
  final RecordContract model;
  const RecordContractItemWidget({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // String item = json.encode(model);
        // Routers.push(context, "${WalletRouter.recordDetail}?param=${Uri.encodeComponent(item)}");
      },
      child: Container(
          margin: EdgeInsets.only(top: height(32)),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(width(8)), boxShadow: [
            BoxShadow(
                color: Color(0xffE9E9E9),
                offset: Offset(0.0, height(8)), //阴影xy轴偏移量
                blurRadius: 24.0, //阴影模糊程度
                spreadRadius: 1.0 //阴影扩散程度
                )
          ]),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: width(30), horizontal: height(20)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(model.type,
                          style: TextStyle(color: Color(0xff323232), fontSize: sp(28), fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      child: Text('${Tr.of(context).assetcompleted}', style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                    ),
                  ],
                ),
                SizedBox(height: width(20)),
                Divider(color: Color(0xffeaeaea), height: 1),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('${Tr.of(context).assetAmount}', style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("${Tr.of(context).assetHand}", style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text("${Tr.of(context).tradrFee}", style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: width(20)),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "${num.parse(model.changeNumber) > 0 ? '+' : ''}${Utils.cutZero(model.changeNumber)}",
                            style: TextStyle(
                                color: num.parse(model.changeNumber) < 0 ? kRedColor : kGreenColor,
                                fontSize: sp(30),
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(model.hand,
                            style: TextStyle(color: Colors.black, fontSize: sp(30), fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(Utils.cutZero(model.fee),
                            style: TextStyle(color: Colors.black, fontSize: sp(30), fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: width(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('${Tr.of(context).assetRemarks}:  ${model.note}', style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(26))),
                    Text(model.createdAt, style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(26))),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
