import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/trade/model/order_model.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget(this.model,{
    Key key,
  }) : super(key: key);
  final OrderModel model;
  @override
  Widget build(BuildContext context) {
    TextStyle st = TextStyle(color: Color(0xffC0C0C0), fontSize: sp(26));
    TextStyle st2 = TextStyle(
        color: Color(0xFFBABABA),
        fontSize: sp(30),
        letterSpacing: -1,
        fontWeight: FontWeight.w500);
    return Container(
      padding: EdgeInsets.only(
          left: width(24), right: width(24), bottom: height(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: height(40)),
          RichText(
              text: TextSpan(
                  text: model.side == 'BUY'?'${Tr.of(context).tradrBuy} ':'${Tr.of(context).tradrSell} ',
                  style: TextStyle(color: model.side == 'BUY'? kGreenColor : kRedColor, fontSize: sp(36)),
                  children: [
                TextSpan(
                    text: model.symbol,
                    style:
                        TextStyle(color: Color(0xff646464), fontSize: sp(30))),
                TextSpan(
                    text: model.createdAt,
                    style:
                        TextStyle(color: Color(0xffc0c0c0), fontSize: sp(24)))
              ])),
          SizedBox(height: height(36)),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(child: Text('${Tr.of(context).tradrEntrustprice}(${model.symbol.split('/').last})', style: st)),
                      ),
                      Expanded(
                          child: Container(child: Text('${Tr.of(context).tradrEntrustAmount}(${model.symbol.split('/').first})', style: st))),
                      Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              // color: Colors.blue,
                              child: Text('${Tr.of(context).TradrTotalTurnover}(${model.symbol.split('/').last})',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: st))),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height(16)),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            child: Text(Utils.formatNum(model.price),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: st2)),
                      ),
                      Expanded(
                          child: Container(
                              child: Text(Utils.formatNum(model.number),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: st2))),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(Utils.formatNum(model.total),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: st2))),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height(34)),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(child: Text('${Tr.of(context).TradrAverageprice}(${model.symbol.split('/').last})', style: st)),
                      ),
                      Expanded(
                          child: Container(child: Text('${Tr.of(context).TradrVolume}(${model.symbol.split('/').first})', style: st))),
                      Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              // color: Colors.blue,
                              child: Text('${Tr.of(context).tradrFee}(${model.symbol.split('/').first})',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: st))),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height(16)),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            child: Text(double.parse(model.total)==0?'-':Utils.formatNum(double.parse(model.total)/double.parse(model.dealNumber)),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: st2)),
                      ),
                      Expanded(
                          child: Container(
                              child: Text(Utils.formatNum(model.dealNumber),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: st2))),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(model.fee,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: st2))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
