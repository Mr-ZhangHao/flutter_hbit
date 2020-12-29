/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-09-07 11:34:17
* @LastEditors: Roy
* @LastEditTime: 2020-09-16 17:56:51
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/common/contract/index.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void unwindView(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('${Tr.of(context).contractSpeedSellHint1}'),
          content: Column(
            children: <Widget>[
              SizedBox(
                height: height(20),
              ),
              Text(
                '${Tr.of(context).contractSpeedSellHint2}',
                style: TextStyle(color: Color(0xff323232), fontSize: sp(30)),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: height(40),
              ),
              Text(
                '${Tr.of(context).contractSpeedSellHint3}',
                style: TextStyle(color: Color(0xffFF7A1B), fontSize: sp(24)),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('${Tr.of(context).determine}', style: TextStyle(color: Color(0xff126DFF))),
              onPressed: () {
                Routers.goBack(context);
              },
            ),
          ],
        );
      });
}

// 设置止损价低于或者高于当前价，出现错误提示：
/*
  price1:委托价
  price2:强平价
  type:0 为<=  1为>=
   */
void lossView(BuildContext context, String price1, String price2, int type) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: RichText(
              text: TextSpan(
                  text: '${Tr.of(context).contractSpeedSellHint4}',
                  style: TextStyle(color: Color(0xff323232), fontSize: sp(30)),
                  children: [
                TextSpan(
                    text: price1,
                    style:
                        TextStyle(color: Color(0xff006CFF), fontSize: sp(30)),
                    children: [
                      TextSpan(
                          text: type == 0 ? '${Tr.of(context).contractSpeedSellHint5}' : '${Tr.of(context).contractSpeedSellHint55}',
                          style: TextStyle(
                              color: Color(0xff323232), fontSize: sp(30)),
                          children: [
                            TextSpan(
                                text: price2,
                                style: TextStyle(
                                    color: Color(0xff006CFF), fontSize: sp(30)),
                                children: [
                                  TextSpan(
                                      text: '${Tr.of(context).contractSpeedSellHint6}',
                                      style: TextStyle(
                                          color: Color(0xff323232),
                                          fontSize: sp(30)))
                                ])
                          ])
                    ])
              ])),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('${Tr.of(context).determine}', style: TextStyle(color: Color(0xff126DFF))),
              onPressed: () {
                Routers.goBack(context);
              },
            ),
          ],
        );
      });
}

// 确认委托
/*
  price1:价格
  price2:价格
   */
void confirmEntreust(
    BuildContext context, String price1, String price2, Function onClick) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('${Tr.of(context).contractConfirmOrder}'),
          content: Column(
            children: <Widget>[
              RichText(
                  text: TextSpan(
                      text: '${Tr.of(context).contractSpeedSellHint7}',
                      style:
                          TextStyle(color: Color(0xff323232), fontSize: sp(30)),
                      children: [
                    TextSpan(
                        text: price1,
                        style: TextStyle(
                            color: Color(0xff006CFF), fontSize: sp(30)),
                        children: [
                          TextSpan(
                              text: '${Tr.of(context).contractSpeedSellHint8}',
                              style: TextStyle(
                                  color: Color(0xff323232), fontSize: sp(30)),
                              children: [
                                TextSpan(
                                    text: price2,
                                    style: TextStyle(
                                        color: Color(0xff006CFF),
                                        fontSize: sp(30)),
                                    children: [
                                      TextSpan(
                                          text: '${Tr.of(context).contractSpeedSellHint9}',
                                          style: TextStyle(
                                              color: Color(0xff323232),
                                              fontSize: sp(30)))
                                    ])
                              ])
                        ])
                  ])),
              SizedBox(
                height: height(40),
              ),
              Text(
                '${Tr.of(context).contractSpeedSellHint14}',
                style: TextStyle(color: Color(0xff9EA6B4), fontSize: sp(24)),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('${Tr.of(context).cancel}', style: TextStyle(color: Color(0xff909090))),
              onPressed: () {
                Routers.goBack(context);
              },
            ),
            CupertinoDialogAction(
              child: Text('${Tr.of(context).determine}', style: TextStyle(color: Color(0xff126DFF))),
              onPressed: () {
                onClick();
              },
            ),
          ],
        );
      });
}

// 确认委托 价格错误时
/*
  price1:价格
  price2:价格
   */
void confirmEntreustPriceError(
    BuildContext context, String price1, String price2) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('${Tr.of(context).contractConfirmOrder}'),
          content: Column(
            children: <Widget>[
              RichText(
                  text: TextSpan(
                      text: '${Tr.of(context).contractSpeedSellHint11}',
                      style:
                          TextStyle(color: Color(0xff323232), fontSize: sp(30)),
                      children: [
                    TextSpan(
                        text: price1,
                        style: TextStyle(
                            color: Color(0xff006CFF), fontSize: sp(30)),
                        children: [
                          TextSpan(
                              text: '${Tr.of(context).contractSpeedSellHint12}',
                              style: TextStyle(
                                  color: Color(0xff323232), fontSize: sp(30)),
                              children: [
                                TextSpan(
                                    text: price2,
                                    style: TextStyle(
                                        color: Color(0xff006CFF),
                                        fontSize: sp(30)),
                                    children: [
                                      TextSpan(
                                          text: '${Tr.of(context).contractSpeedSellHint13}',
                                          style: TextStyle(
                                              color: Color(0xff323232),
                                              fontSize: sp(30)))
                                    ])
                              ])
                        ])
                  ])),
              SizedBox(
                height: height(40),
              ),
              Text(
                '${Tr.of(context).contractSpeedSellHint14}',
                style: TextStyle(color: Color(0xff9EA6B4), fontSize: sp(24)),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('${Tr.of(context).cancel}', style: TextStyle(color: Color(0xff909090))),
              onPressed: () {
                Routers.goBack(context);
              },
            ),
            CupertinoDialogAction(
              child: Text(''),
            ),
          ],
        );
      });
}

// 确认委托 当执行价高于当前价进行买入时得提醒
/*
  price1:价格
  price2:价格
   */
void confirmEntreustPriceMore(
    BuildContext context, String price1, String price2) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('${Tr.of(context).contractConfirmOrder}'),
          content: Column(
            children: <Widget>[
              RichText(
                  text: TextSpan(
                      text: '${Tr.of(context).contractSpeedSellHint11}',
                      style:
                          TextStyle(color: Color(0xff323232), fontSize: sp(30)),
                      children: [
                    TextSpan(
                        text: price1,
                        style: TextStyle(
                            color: Color(0xff006CFF), fontSize: sp(30)),
                        children: [
                          TextSpan(
                              text: '${Tr.of(context).contractSpeedSellHint12}',
                              style: TextStyle(
                                  color: Color(0xff323232), fontSize: sp(30)),
                              children: [
                                TextSpan(
                                    text: price2,
                                    style: TextStyle(
                                        color: Color(0xff006CFF),
                                        fontSize: sp(30)),
                                    children: [
                                      TextSpan(
                                          text: '${Tr.of(context).contractSpeedSellHint13}',
                                          style: TextStyle(
                                              color: Color(0xff323232),
                                              fontSize: sp(30)))
                                    ])
                              ])
                        ])
                  ])),
              SizedBox(
                height: height(40),
              ),
              Text(
                '${Tr.of(context).contractSpeedSellHint14}',
                style: TextStyle(color: Color(0xff9EA6B4), fontSize: sp(24)),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('${Tr.of(context).cancel}', style: TextStyle(color: Color(0xff909090))),
              onPressed: () {
                Routers.goBack(context);
              },
            ),
          ],
        );
      });
}

//委托成功提示
void entrustSuccess(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Text(
            '${Tr.of(context).contractSpeedSellHint15}',
            style: TextStyle(color: Color(0xff323232), fontSize: sp(30)),
            textAlign: TextAlign.left,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('${Tr.of(context).contractknow}', style: TextStyle(color: Color(0xff126DFF))),
              onPressed: () {
                Routers.goBack(context);
              },
            ),
          ],
        );
      });
}

// 止盈止损提示

void checkFullStopPopup(BuildContext context) {
  int selectType = 0;
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Column(
            children: <Widget>[
              RichText(
                  text: TextSpan(
                      text: '${Tr.of(context).contractSpeedSellHint16}',
                      style:
                          TextStyle(color: Color(0xff323232), fontSize: sp(30)),
                      children: [
                    TextSpan(
                        text: '${Tr.of(context).contractBestPrice}',
                        style: TextStyle(
                            color: Color(0xff006CFF), fontSize: sp(30)),
                        children: [
                          TextSpan(
                              text: '${Tr.of(context).contractSpeedSellHint17}',
                              style: TextStyle(
                                  color: Color(0xff323232), fontSize: sp(30)),
                              children: [
                                TextSpan(
                                    text: '${Tr.of(context).contractSpeedSellHint18}',
                                    style: TextStyle(
                                        color: Color(0xff323232),
                                        fontSize: sp(30)))
                              ])
                        ])
                  ])),
              SizedBox(
                height: height(40),
              ),
              Text(
                '${Tr.of(context).contractSpeedSellHint19}',
                style: TextStyle(color: Color(0xffFF7A1B), fontSize: sp(24)),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: height(20),
              ),
              // Row(
              //   children: <Widget>[
              //     Container(
              //       margin: EdgeInsets.only(right: width(20)),
              //       width: width(25),
              //       height: height(25),
              //       child: CupertinoDialogAction(
              //         onPressed: () {
              //           selectType = 1;
              //         },
              //         child: Image.asset('images/contract/noselect.png'),
              //       ),
              //     ),
              //     Text(
              //       '不再提示',
              //       style:
              //           TextStyle(color: Color(0xffA3A2A2), fontSize: sp(24)),
              //       textAlign: TextAlign.left,
              //     ),
              //   ],
              // ),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('${Tr.of(context).contractknow}', style: TextStyle(color: Color(0xff126DFF))),
              onPressed: () {
                Routers.goBack(context);
              },
            ),
          ],
        );
      });
}

void entrustInstructions(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('${Tr.of(context).contractSpeedSellHint20}'),
          content: Column(
            children: <Widget>[
              SizedBox(
                height: height(10),
              ),
              Text(
                '${Tr.of(context).contractSpeedSellHint21}',
                style: TextStyle(
                  fontSize: sp(30),
                  color: Color(0xff323232),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: height(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${Tr.of(context).contractUnderstandMore}',
                    style: TextStyle(
                      fontSize: sp(24),
                      color: Color(0xff126DFF),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width(10)),
                    width: width(25),
                    height: height(25),
                    child: Image.asset('images/contract/more.png'),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('${Tr.of(context).contractknow}', style: TextStyle(color: Color(0xff126DFF))),
              onPressed: () {
                Routers.goBack(context);
              },
            ),
          ],
        );
      });
}

// 取消委托

void cancelEntreust(
    BuildContext context,  Function onClick) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('${Tr.of(context).contractPrompt}'),
          content: Column(
            children: <Widget>[
              RichText(
                  text: TextSpan(
                text: '${Tr.of(context).tradrCancelHint}?',
                style: TextStyle(color: Color(0xff323232), fontSize: sp(30)),
              )),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('${Tr.of(context).cancel}', style: TextStyle(color: Color(0xff909090))),
              onPressed: () {
                Routers.goBack(context);
              },
            ),
            CupertinoDialogAction(
              child: Text('${Tr.of(context).Confirm}', style: TextStyle(color: Color(0xff126DFF))),
              onPressed: () {
                Routers.goBack(context);
                onClick();
              },
            ),
          ],
        );
      });
}
