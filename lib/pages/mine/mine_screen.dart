/*
* @message: 个人中心
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Roy
* @LastEditTime: 2020-09-27 18:20:32
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/mine_screen.dart
*/
import 'dart:io';

import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/common/update/index.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/login/provider/user_provider.dart';
import 'package:HBit/pages/login/server/index.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/pages/mine/routes/index.dart';
import 'package:HBit/providers/gloable_provider.dart';
import 'package:HBit/providers/local_provider.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/routes/routes.dart';
import 'package:HBit/utils/sp_utils.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:HBit/pages/mine/server/index.dart';

class MineScreen extends StatefulWidget {
  MineScreen({Key key}) : super(key: key);

  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MineProvider model = Provider.of<MineProvider>(context, listen: false);

    return Scaffold(
        backgroundColor: kWhite,
        body: CustomScrollView(
          // physics: new NeverScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              title: Text(Tr.of(context).mine,
                  style: TextStyle(color: kWhite, fontSize: sp(36))),
              leading: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Routers.goBack(context),
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset('images/mine/back@3x.png',
                        width: width(22), height: height(36)),
                  )),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(150),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width(40), vertical: height(0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          " Hi，${Utils.hiddenMiddle(model.userInfo?.username, 3, 4) ?? '------'}",
                          style: TextStyle(fontSize: sp(48), color: kWhite)),
                      Row(
                        children: <Widget>[
                          Text('  UID: ${model.userInfo?.id ?? '-----'}',
                              style:
                                  TextStyle(fontSize: sp(24), color: kWhite)),
                          SizedBox(width: height(20)),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                  text: model.userInfo?.id.toString()));
                              Toast.showSuccess(
                                  Tr.of(context).copySuccessfully);
                            },
                            child: Image.asset('images/mine/copy@3x.png',
                                width: width(24), height: height(24)),
                          )
                        ],
                      ),
                      SizedBox(height: height(33)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () =>
                                  Routers.push(context, MineRouter.security),
                              child: Card(
                                shadowColor: Color(0xffDEDEDE),
                                elevation: 5,
                                child: Container(
                                  height: height(130),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image(
                                        image: AssetImage('images/mine/aq.png'),
                                        width: width(56),
                                        height: height(56),
                                      ),
                                      SizedBox(width: width(20)),
                                      Text(Tr.of(context).securityCenter,
                                          style: TextStyle(
                                              color: Color(0xff909090),
                                              fontSize: sp(28)))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                // print(model.userInfo.kycStatus);
                                if (model.userInfo.kycStatus == 0) {
                                  Routers.push(
                                      context, MineRouter.identityType);
                                } else {
                                  Routers.push(
                                      context, MineRouter.vertifyStatus);
                                }
                              },
                              child: Card(
                                shadowColor: Color(0xffDEDEDE),
                                elevation: 5,
                                child: Container(
                                  height: height(130),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image(
                                        image: AssetImage('images/mine/rz.png'),
                                        width: width(56),
                                        height: height(56),
                                      ),
                                      SizedBox(width: width(20)),
                                      Text(Tr.of(context).authentication,
                                          style: TextStyle(
                                              color: Color(0xff909090),
                                              fontSize: sp(28)))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                InkWell(
                  onTap: () {
                    ///切换语言
                    print("languageCode:" + Tr.locales.countryCode);
                    if (Tr.locales.countryCode == 'HK') {
                      Provider.of<LocalProvider>(context, listen: false)
                          .switchLocale(2);
                      SetLang('hk');
                    } else if (Tr.locales.countryCode == 'US') {
                      Provider.of<LocalProvider>(context, listen: false)
                          .switchLocale(3);
                      SetLang('en');

                    }
                    /*else{
                      Provider.of<LocalProvider>(context,listen: false).switchLocale(1);
                    }*/
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: width(30)),
                    child: Image.asset('images/mine/ch.png',
                        width: width(80), height: width(48), fit: BoxFit.fill),
                  ),
                )
              ],
              centerTitle: true,
              floating: true,
              //是否随着滑动隐藏标题
              snap: true,
              //与floating结合使用
              pinned: true,
              //是否固定在顶部
              brightness: Brightness.light,
              expandedHeight: height(330) + MediaQuery.of(context).padding.top,
              flexibleSpace: FlexibleSpaceBar(
                // collapseMode: CollapseMode.parallax,
                background: UserHeaderWidget(model: model),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Card(
                  margin: EdgeInsets.symmetric(horizontal: width(47)),
                  shadowColor: Color(0xffDEDEDE),
                  elevation: 5,
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      MineListItemWidget(
                        text: Tr.of(context).myAssets,
                        image: 'images/mine/zichan.png',
                        onTab: () {
                          Provider.of<GloableProvider>(context, listen: false)
                              .setCurrIndex(4);
                          Routers.push(context, Routes.home);
                        },
                      ),
                      MineListItemWidget(
                        text: Tr.of(context).rateStandard,
                        image: 'images/mine/f.png',
                        onTab: () {
                          // Provider.of<GloableProvider>(context, listen: false).setCurrIndex(3);
                          Routers.push(context, MineRouter.rate);
                        },
                      ),
                      MineListItemWidget(
                        text: Tr.of(context).promotion,
                        image: 'images/mine/qrcode.png',
                        onTab: () => Routers.push(context, MineRouter.share),
                      ),
                 /*     MineListItemWidget(
                        text: Tr.of(context).Follow,
                        image: 'images/mine/gz.png',
                        onTab: () => Routers.push(context, MineRouter.focusUs),
                      ),*/
                      MineListItemWidget(
                        text: Tr.of(context).helpCenter,
                        image: 'images/mine/help.png',
                        onTab: () => Routers.goWebViewPage(
                            context,
                            Tr.of(context).helpCenter,
                            Provider.of<MineProvider>(context, listen: false)
                                .userInfo
                                .helpUrl),
                      ),
                      MineListItemWidget(
                        isVersion: true,
                        isShowBadge:
                            Provider.of<MineProvider>(context).isShowBadge,
                        text: Tr.of(context).version,
                        image: 'images/mine/v.png',
                        onTab: Provider.of<MineProvider>(context).isShowBadge
                            ? () => UpdateUtil().checkVersion(context)
                            : () =>
                                Toast.showText(Tr.of(context).latestVersion),
                      ),


                      MineListItemWidget(
                        text: Tr.of(context).signOut,
                        image: 'images/mine/logout.png',
                        onTab: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: Text(Tr.of(context).signOutHint,
                                      style: TextStyle(fontSize: sp(32))),
                                  actions: <Widget>[
                                    CupertinoDialogAction(
                                      child: Text(Tr.of(context).cancel),
                                      onPressed: () => Routers.goBack(context),
                                    ),
                                    CupertinoDialogAction(
                                        child: Text(Tr.of(context).determine,
                                            style: TextStyle(
                                                color: Color(0xff909090))),
                                        onPressed: logout),
                                  ],
                                );
                              });
                        },
                      )
                    ],
                  )),
                ),
                SizedBox(height: height(60)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width(47)),
                  child: Text(
                    Tr.of(context).mineHint,
                    style:
                        TextStyle(color: Color(0xff6E7581), fontSize: sp(24)),
                  ),
                ),
                SizedBox(height: height(30)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width(47)),
                  child: Text(
                    Tr.of(context).mineHint2,
                    style:
                        TextStyle(color: Color(0xff6E7581), fontSize: sp(24)),
                  ),
                ),
                SizedBox(height: height(30)),
              ]),
            )
          ],
        ));
  }

  void logout() async {
    await LoginServer.logout();
    Provider.of<UserProvider>(context, listen: false).setIsLogin(false);
    await SpUtils.sp.clear();
    Routers.push(context, '/login', replace: true, clearStack: true);
  }

  Future<String> SetLang( String lang) async {
   await  MineServer.setLang(lang);
  }
}


class MineListItemWidget extends StatelessWidget {
  const MineListItemWidget({
    Key key,
    this.image,
    this.text,
    this.onTab,
    this.isShowBadge = false,
    this.isVersion = false,
  }) : super(key: key);
  final String image;
  final String text;
  final bool isShowBadge;
  final bool isVersion;
  final Function onTab;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: sp(28), color: Color(0xff909090));
    return GestureDetector(
      onTap: onTab,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: height(100),
        margin: EdgeInsets.symmetric(horizontal: width(40)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xffEBEBEB)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Visibility(
                  child: Image.asset(image,
                      fit: BoxFit.fill, width: width(44), height: width(44)),
                  visible: image != '',
                ),
                Visibility(
                  child: SizedBox(width: width(28)),
                  visible: image != '',
                ),
                Text(text, style: style),
              ],
            ),
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Visibility(
                      visible: isShowBadge,
                      child: Container(
                        width: width(12),
                        height: width(12),
                        margin: EdgeInsets.only(right: width(10)),
                        decoration: BoxDecoration(
                          color: Color(0xffF74F4F),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isVersion,
                      child: Text(
                          Platform.isAndroid
                              ? GlobalConfig.andVersionName
                              : GlobalConfig.iosVersionName,
                          style: style),
                    )
                  ],
                ),
                SizedBox(width: width(10)),
                Image.asset('images/mine/next@3x.png',
                    fit: BoxFit.fill, width: width(22), height: width(33)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class UserHeaderWidget extends StatelessWidget {
  final MineProvider model;

  const UserHeaderWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(40), vertical: width(0)),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/mine/banner.png'), fit: BoxFit.fill)),
      // child: ,
    );
  }
}

/// 异形背景
// class BottomClipper extends CustomClipper<Path> {
//   @override
//   getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, 0);
//     path.lineTo(0, size.height - 50);

//     var p1 = Offset(size.width / 2, size.height);
//     var p2 = Offset(size.width, size.height - 50);
//     path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
//     path.lineTo(size.width, size.height - 50);
//     path.lineTo(size.width, 0);
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper oldClipper) {
//     return false;
//   }
// }
