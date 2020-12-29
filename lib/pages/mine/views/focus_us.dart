/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 13:08:24
* @LastEditors: Jack
* @LastEditTime: 2020-08-19 14:16:33
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/views/focus_us.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/toast/dialog_util.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;

class FocusUsPage extends StatelessWidget {
  const FocusUsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.of(context).Follow),
        centerTitle: true,
        elevation: 1,
        leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Routers.goBack(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png', width: width(22), height: height(36)),
            )),
      ),
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: width(40)),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(vertical: height(10), horizontal: width(40)),
              leading: Image.asset('images/mine/tg.png', width: width(68), height: height(68)),
              title: Text('Telegram', style: TextStyle(color: Color(0xff323232), fontSize: sp(32))),
            ),
            CustomDivider(),
            ListTile(
                dense: true,
                contentPadding: EdgeInsets.symmetric(vertical: height(0), horizontal: width(40)),
                leading: Image.asset('images/mine/wx.png', width: width(68), height: height(68)),
                title: Text(Tr.of(context).WeChat, style: TextStyle(color: Color(0xff323232), fontSize: sp(32))),
                subtitle: Row(
                  children: <Widget>[
                    Text('${Tr.of(context).WeChatNumber}: etfget9090'),
                    SizedBox(width: width(20)),
                    InkWell(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: 'etfget9090'));
                        Toast.showText(Tr.of(context).copySuccessfully);
                      },
                      child: Image.asset(
                        'images/mine/copy2.png',
                        width: width(20),
                      ),
                    )
                  ],
                ),
                trailing: InkWell(
                  onTap: () {
                    showCenterAnimationDialog(context, JoinWechartDialog());
                  },
                  child: Image.asset('images/mine/qrcode@3x.png', width: width(44)),
                )),
            CustomDivider(),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(vertical: height(10), horizontal: width(40)),
              leading: Image.asset('images/mine/xl.png', width: width(68), height: height(68)),
              title: Text(Tr.of(context).Weibo, style: TextStyle(color: Color(0xff323232), fontSize: sp(32))),
            ),
            Container(height: height(20), color: Color(0xffF6F7F9)),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(vertical: height(10), horizontal: width(40)),
              leading: Image.asset('images/mine/kf.png', width: width(68), height: height(68)),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(Tr.of(context).customerService, style: TextStyle(color: Color(0xff323232), fontSize: sp(32))),
                  Row(
                    children: <Widget>[
                      Text('Support@etfget.com',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: sp(30), color: Colors.black)),
                      SizedBox(width: width(20)),
                      InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: 'Support@etfget.com'));
                          Toast.showText(Tr.of(context).copySuccessfully);
                        },
                        child: Image.asset(
                          'images/mine/copy2.png',
                          width: width(20),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            CustomDivider(),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(vertical: height(10), horizontal: width(40)),
              leading: Image.asset('images/mine/hz.png', width: width(68), height: height(68)),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(Tr.of(context).marketCollaboration, style: TextStyle(color: Color(0xff323232), fontSize: sp(32))),
                  Row(
                    children: <Widget>[
                      Text('BD@etfget.com',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: sp(30), color: Colors.black)),
                      SizedBox(width: width(20)),
                      InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: 'BD@etfget.com'));
                          Toast.showText(Tr.of(context).copySuccessfully);
                        },
                        child: Image.asset(
                          'images/mine/copy2.png',
                          width: width(20),
                        ),
                      )
                    ],
                  )
                ],
              ),
              // trailing: Text('BD@etfget.com', style: TextStyle(fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}

class JoinWechartDialog extends StatelessWidget {
  const JoinWechartDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey _globalKey = GlobalKey();
    return Material(
      color: kTransprant,
      child: Container(
        width: double.infinity,
        height: width(570),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(horizontal: width(90)),
        child: Column(
          children: <Widget>[
            SizedBox(height: width(40)),
            Text('${Tr.of(context).CommunityHint}', style: TextStyle(color: Colors.black, fontSize: sp(32), fontWeight: FontWeight.bold)),
            SizedBox(height: width(40)),
            GestureDetector(
              onLongPress: () async {
                Map<Permission, PermissionStatus> statuses = await [Permission.storage].request();

                RenderRepaintBoundary boundary = _globalKey.currentContext.findRenderObject();
                ui.Image image = await boundary.toImage();
                ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
                final result = await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
                print(result);
                if (result != null) {
                  Toast.showSuccess('${Tr.of(context).SavedAlbum}');
                } else {
                  Toast.showError('${Tr.of(context).Savefailed}');
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: width(310),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Color(0xff232323)),
                ),
                child: RepaintBoundary(
                  key: _globalKey,
                  child: QrImage(
                    data: 'ashdasdasd',
                    size: width(310),
                  ),
                ),
              ),
            ),
            SizedBox(height: width(40)),
            Text('${Tr.of(context).SaveHint}', style: TextStyle(color: Color(0xff838383), fontSize: sp(30))),
          ],
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(height: 0.5, color: Color(0xffC0C0C0), indent: width(40), endIndent: width(40));
  }
}
