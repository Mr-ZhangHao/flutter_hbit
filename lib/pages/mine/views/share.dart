/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 14:55:20
* @LastEditors: Jack
* @LastEditTime: 2020-09-04 15:35:56
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/views/share.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/routes/routes.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:HBit/common/button/index.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;

class SharePage extends StatefulWidget {
  SharePage({Key key}) : super(key: key);

  @override
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WrapContainer(
      child: Scaffold(
        backgroundColor: kTransprant,
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: kTransprant,
          title: Text(Tr.of(context).inviteFriends, style: TextStyle(color: Colors.white)),
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Routers.goBack(context),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset('images/mine/back@3x.png', width: width(22), height: height(36)),
              )),
        ),
        body: RepaintBoundary(
          key: _globalKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: width(410),
                  left: width(40),
                  right: width(40),
                  child: Card(
                    elevation: 5,
                    shadowColor: Color(0xff7EB9F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    margin: EdgeInsets.only(bottom: height(30)),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: height(50), top: height(60)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(Tr.of(context).WelcomeRegister, style: TextStyle(fontSize: sp(48), fontWeight: FontWeight.bold)),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(vertical: height(20)),
                            child: QrImage(data: Provider.of<MineProvider>(context).userInfo.link, size: width(310)),
                          ),
                          SizedBox(height: width(20)),
                          Text('${Tr.of(context).InvitationCode}:${Provider.of<MineProvider>(context).userInfo.pid.toString()}', style: TextStyle(fontSize: sp(32), color: Color(0xff323232))),
                          SizedBox(height: width(20)),
                          Text(Tr.of(context).inviteHint, style: TextStyle(fontSize: sp(32), color: Color(0xff323232))),
                          SizedBox(height: width(20)),
                          LinearGradientButton(
                            width: width(270),
                            height: width(80),
                            text: Tr.of(context).SaveAlbum,
                            textSize: sp(28),
                            beginColor: Colors.white,
                            endColor: Colors.white,
                            textColor: kPrimaryColor,
                            shadowColor: Colors.white,
                            borderColor: kPrimaryColor,
                            paddingTop: 0,
                            paddingBottom: 0,
                            onPressed: () async {
                              Map<Permission, PermissionStatus> statuses = await [Permission.storage].request();

                              RenderRepaintBoundary boundary = _globalKey.currentContext.findRenderObject();
                              ui.Image image = await boundary.toImage();
                              ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
                              final result = await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
                              if (result != null) {
                                Toast.showSuccess(Tr.of(context).SavedAlbum);
                              } else {
                                Toast.showError(Tr.of(context).Savefailed);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Image.asset('images/mine/top@2x.png', height: width(554), fit: BoxFit.fill),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WrapContainer extends StatelessWidget {
  final Widget child;
  const WrapContainer({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff1528A4),
            Color(0xff160B34),
          ],
        ),
      ),
      child: child,
    );
  }
}
