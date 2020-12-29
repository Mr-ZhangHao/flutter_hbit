/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-19 17:58:05
* @LastEditors: Roy
* @LastEditTime: 2020-09-07 20:53:47
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/widgets/market/contract_share_popup.dart
*/

import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;

import '../../../../utils/screen.dart';

class ShareImagepopup extends StatefulWidget {
  ShareImagepopup({Key key}) : super(key: key);
  @override
  _ShareImagepopupState createState() => _ShareImagepopupState();
}

class _ShareImagepopupState extends State<ShareImagepopup> {
  @override
  void initState() {
    super.initState();
  }

  GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: height(150),
              left: width(60),
              right: width(60),
              child: RepaintBoundary(
                  key: _globalKey,
                  child: Container(
                      width: double.infinity,
                      height: height(830),
                      decoration: BoxDecoration(
                        color: Color(0xff094FBF),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: height(400),
                            child: Image.asset('images/contract/bg.png',
                                fit: BoxFit.fill),
                          ),
                          Positioned(
                            left: width(50),
                            right: width(50),
                            top: height(380),
                            height: height(280),
                            child: contentView(),
                          ),
                          Positioned(
                            left: width(50),
                            right: width(50),
                            bottom: height(20),
                            height: height(120),
                            child: appInfoView(),
                          ),
                        ],
                      )))),
          Positioned(
            left: width(0),
            bottom: width(0),
            right: width(0),
            child: footerView(),
          ),
        ],
      ),
    );
  }

  Widget contentView() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(width(10))),
        color: Color(0xff0D49AA),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text('+0.88%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: sp(45),
                  )),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                'ADA/USDT',
                style: TextStyle(color: Color(0x8cffffff), fontSize: sp(20)),
                textAlign: TextAlign.center,
              )),
              Expanded(
                  child: Text(
                '${Tr.of(context).contractOpeningPrice}',
                style: TextStyle(color: Color(0x8cffffff), fontSize: sp(20)),
                textAlign: TextAlign.center,
              )),
              Expanded(
                  child: Text(
                '${Tr.of(context).contractCurrentPrice}',
                style: TextStyle(color: Color(0x8cffffff), fontSize: sp(20)),
                textAlign: TextAlign.center,
              ))
            ],
          ),
          SizedBox(
            height: height(10),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                '${Tr.of(context).contractBull}',
                style: TextStyle(color: Colors.white, fontSize: sp(20)),
                textAlign: TextAlign.center,
              )),
              Expanded(
                  child: Text(
                'T 0.11',
                style: TextStyle(color: Colors.white, fontSize: sp(20)),
                textAlign: TextAlign.center,
              )),
              Expanded(
                  child: Text(
                'T 0.11',
                style: TextStyle(color: Colors.white, fontSize: sp(20)),
                textAlign: TextAlign.center,
              ))
            ],
          ),
          SizedBox(
            height: height(15),
          ),
        ],
      ),
    );
  }

  Widget appInfoView() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: width(60),
                    height: height(60),
                    child: Image.asset('images/contract/logo.png',
                        fit: BoxFit.fill),
                  ),
                  Text('ETF.TOP',
                      style: TextStyle(color: Colors.white, fontSize: sp(50))),
                ],
              ),
              SizedBox(height: height(10)),
              Text('Easy to Get Easy to Exchange',
                  style: TextStyle(color: Colors.white, fontSize: sp(24))),
            ],
          ),
          QrImage(
            padding: EdgeInsets.all(1),
            foregroundColor: kGreenColor,
            backgroundColor: Colors.white,
            data: 'ashdasdasd',
            size: width(90),
          ),
        ],
      ),
    );
  }

  Widget itemView(String image, String text, Function callback) {
    return Container(
      child: InkWell(
        onTap: () {
          callback();
        },
        child: Column(
          children: <Widget>[
            Container(
              width: width(70),
              height: height(70),
              child: Image.asset(image),
            ),
            Text(
              text,
            ),
          ],
        ),
      ),
    );
  }

  Widget footerView() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      height: height(230),
      child: Column(
        children: <Widget>[
          Container(
            height: height(130),
            padding: EdgeInsets.only(top: width(20)),
            alignment: Alignment.center,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: itemView('images/contract/save.png', '${Tr.of(context).contractSavePicture}', () {
                    saveImage();
                  }),
                ),
                Expanded(
                    child: itemView(
                        'images/contract/share_image.png', '分享', () {
                          Toast.showText('${Tr.of(context).contractNotOpen}');
                        })),
              ],
            ),
          ),
          Container(
            height: height(90),
            width: double.infinity,
            alignment: Alignment.center,
            child: InkWell(
                onTap: () {
                  Routers.goBack(context);
                },
                child: Text('${Tr.of(context).contractknow}',
                    style:
                        TextStyle(color: Color(0xff126DFF), fontSize: sp(28)))),
          ),
        ],
      ),
    );
  }

  void saveImage() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final result =
        await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
    print(result);
    if (result != null) {
      Toast.showSuccess('${Tr.of(context).contractSavedSuccessfully}');
    } else {
      Toast.showError('${Tr.of(context).Savefailed}');
    }
  }
}
