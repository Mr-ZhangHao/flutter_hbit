/*
* @message: 登录
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Jack
* @LastEditTime: 2020-08-13 16:52:53
* @Deprecated: 否
* @FilePath: /archimedes/lib/pages/mine/views/account.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/pages/wallet/model/bibi_recored_model.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/constants/index.dart';

class RecordDetailPage extends StatefulWidget {
  final BibiRecored model;
  RecordDetailPage({Key key, this.model}) : super(key: key);

  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<RecordDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png', width: width(22), height: height(36)),
            ),
          ),
          brightness: Brightness.light,
          title: Text(
            '${Tr.of(context).assetBillingDetail}',
            style: TextStyle(color: kTextColor3, fontSize: sp(36)),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(width(40), height(32), width(40), 0),
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(width(30)),
            height: height(650),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(width(8)), boxShadow: [
              BoxShadow(
                  color: Color(0xffE9E9E9),
                  offset: Offset(0.0, height(8)), //阴影xy轴偏移量
                  blurRadius: 24.0, //阴影模糊程度
                  spreadRadius: 1.0 //阴影扩散程度
                  )
            ]),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(0, height(20), 0, height(8)),
                  child: Text('${widget.model.opName ?? ''}',
                      style: TextStyle(color: Color(0xff323232), fontSize: sp(28))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: height(24)),
                      child: Text(
                          "${num.parse(widget.model.number) > 0 ? '+' : ''}${Utils.cutZero(widget.model.number)}",
                          style: TextStyle(color: Color(0xff323232), fontSize: sp(40), fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: height(24)),
                      child: Text('USDT',
                          style: TextStyle(color: Color(0xff323232), fontSize: sp(40), fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(width(13), 0, width(20), 0),
                  decoration: BoxDecoration(border: Border(top: BorderSide(color: Color(0xffEAEAEA), width: 1))),
                  child: Column(
                    children: <Widget>[
                      Visibility(
                        visible: widget.model.opName == '充币' || widget.model.opName == '提币',
                        child: Container(
                          margin: EdgeInsets.only(top: height(24)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text('${widget.model.opName}${Tr.of(context).assetAddress}',
                                    style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                              ),
                              Container(
                                width: width(332),
                                alignment: Alignment.centerRight,
                                child: Text(widget.model.address,
                                    style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.model.coinName == 'USDT' &&
                            (widget.model.opName == '充币' || widget.model.opName == '提币'),
                        child: Container(
                          margin: EdgeInsets.only(top: height(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text('${Tr.of(context).assetChainname}', style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                              ),
                              Container(
                                width: width(332),
                                alignment: Alignment.centerRight,
                                child: Text(widget.model.chainName,
                                    style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: height(24)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text('${Tr.of(context).assetTransactionID}', style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                            ),
                            Container(
                              width: width(332),
                              alignment: Alignment.centerRight,
                              child: Text(widget.model.hash ?? '',
                                  style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: height(34)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text('${Tr.of(context).assetTransactionhour}', style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                            ),
                            Container(
                              width: width(332),
                              alignment: Alignment.centerRight,
                              child: Text(widget.model.createdAt,
                                  style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: height(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text('${Tr.of(context).assetTradingstatus}', style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                            ),
                            Container(
                              width: width(332),
                              alignment: Alignment.centerRight,
                              child: Text(widget.model.status,
                                  style: TextStyle(color: Color(0xffC0C0C0), fontSize: sp(28))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
