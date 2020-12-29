import 'dart:io';

import 'package:HBit/common/toast/index.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_upgrade/flutter_app_upgrade.dart';
import 'package:fsuper/fsuper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/core/network/http.dart';
import 'package:HBit/utils/screen.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateUtil {
  ///应用更新
  checkVersion(BuildContext context) async {
    try {
      ///获取后台版本号
      var version = await getVersion();

      ///本地版本号小于线上版本号
      int localV = 0;
      int onlineV = 0;
      String content = '';
      String onlineVersionName = '';
      String url = '';
      if (Platform.isAndroid) {
        onlineV = version['verCode'];
        onlineVersionName = version['android'];
        content = version['contentAndroid'];
        url = version['contentAndroidUrl'];
        localV = GlobalConfig.andVersionCode;
      } else {
        onlineV = version['iosCode'];
        url = version['contentIosUrl'];
        onlineVersionName = version['ios'];
        content = version['contentIos'];
        localV = GlobalConfig.iosVersionCode;
      }
      if (localV < onlineV) {
        showCenterDialog(
            context,
            Update(
              codeName: onlineVersionName,
              content: content,
              url: url,
              iosUrl: url,
            ));
      }
    } catch (e, s) {
      print("$e$s");
    }
  }

  Future getVersion() async {
    var response = await http.get('/api/versions/info');
    return response.data['data'];
  }

  ///中间对话框 半透明
  showCenterDialog(BuildContext context, Widget child,
      {bool dismissOutClick = true}) {
    showGeneralDialog(
      context: context,
      barrierLabel: '',
      barrierDismissible: dismissOutClick,
      transitionDuration: Duration(milliseconds: 300),
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: child,
        );
      },
    );
  }
}

class Update extends StatefulWidget {
  final String codeName;
  final String content;
  final String url;

  final String iosUrl;

  const Update({Key key, this.codeName, this.content, this.url, this.iosUrl})
      : super(key: key);

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  bool isDownLoading = false;
  double _downloadProgress = 0.01;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Material(
        child: Container(
          width: width(600),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                width: width(600),
                height: width(419),
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.all(Radius.circular(height(30))),
                    image: DecorationImage(
                        image: AssetImage('images/splash/version_bg.png'),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: EdgeInsets.only(left: width(370), top: width(143)),
                  child: FSuper(
                    text: "V${widget?.codeName}",
                    textColor: Colors.white,
                    textSize: sp(20),
                    textAlignment: Alignment.center,
                    width: width(76),
                    height: height(30),
                    corner: Corner.all(height(15)),
                    backgroundColor: Color(0xffFF78B1),
                    textStyle: FontStyle.normal,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: width(40), vertical: height(40)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("${widget?.content}",
                        style: TextStyle(
                            fontSize: sp(28),
                            color: Color(0xff333333),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            height: 1.7,
                            letterSpacing: width(2))),
                    SizedBox(
                      height: height(100),
                    ),
                    Visibility(
                      visible: !isDownLoading,
                      child: Center(
                        child: FSuper(
                          width: width(380),
                          height: height(80),
                          text: '立即更新',
                          textColor: Color(0xff3A7EFE),
                          textSize: sp(36),
                          textWeight: FontWeight.w400,
                          textAlignment: Alignment.center,
                          strokeColor: Color(0xff3A7EFE),
                          strokeWidth: height(2),
                          corner: Corner.all(height(40)),
                          onClick: () {
                            ///是安卓，直接下载
                            if (Platform.isAndroid) {
                              setState(() {
                                isDownLoading = true;
                                _downloadApk('${widget?.url}');
                              });
                            } else if (Platform.isIOS) {
                              ///ios，跳转下载页
                              _openBrower('${widget?.iosUrl}');
                            }
                          },
                        ),
                      ),
                      replacement: Column(
                        children: <Widget>[
                          LinearPercentIndicator(
                            lineHeight: 14.0,
                            percent: _downloadProgress,
                            backgroundColor: Colors.grey,
                            progressColor: kPrimaryColor,
                            padding: EdgeInsets.all(width(2)),
                          ),
                          SizedBox(
                            height: height(15),
                          ),
                          Text("更新中...",
                              style: TextStyle(
                                fontSize: sp(28),
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                                height: 1,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height(10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //打开外部浏览器
  _openBrower(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _downloadApk(String url) async {
    String path = (await getExternalStorageDirectory()).path + "/retail.apk";

    try {
      var dio = Dio();
      await dio.download(url, path, onReceiveProgress: (int count, int total) {
        if (total == -1) {
          _downloadProgress = 0.01;
        } else {
          _downloadProgress = count / total.toDouble();
        }
        setState(() {});
        if (_downloadProgress == 1) {
          //下载完成，跳转到程序安装界面
          FlutterUpgrade.installAppForAndroid(path);
        }
      });
    } catch (e) {
      Toast.showError('$e');
      print('$e');
    }
  }
}
