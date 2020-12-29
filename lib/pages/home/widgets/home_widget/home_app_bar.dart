/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-10-26 10:41:56
* @LastEditors: Roy
* @LastEditTime: 2020-10-26 14:59:24
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/widgets/home_widget/home_app_bar.dart
*/
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:HBit/common/i18n/i18n.dart';

class HomeAppBar extends StatelessWidget {
  final Function onTab;
  const HomeAppBar({
    Key key,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MineProvider>(
      builder: (BuildContext context, MineProvider model, Widget child) {
        return PreferredSize(
          preferredSize: Size.fromHeight(width(100)),
          child: SliverAppBar(
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            floating: false,
            pinned: true,
            snap: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: width(18)),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: GestureDetector(
                      onTap: onTab, child: Image.asset('images/home/avatar.png', width: width(60), height: height(60))),
                ),
                Expanded(
                  child: Text('Hi,${Utils.hiddenMiddle(model.userInfo?.username, 3, 4)}',
                      style: TextStyle(color: Color(0xff323232), fontSize: sp(34))),
                ),

              ],
            ),
            actions: <Widget>[
              IconButton(
                color: Color(0xff323232),
                icon: ImageIcon(AssetImage('images/home/server.png')),
                onPressed: () {
                  print('chatUrl:'+ model.userInfo.chatUrl);
                  Routers.goWebViewPage(context, Tr.of(context).homeCustomerService, model.userInfo.chatUrl);
                },
              ),
              // IconButton(
              //   color: Color(0xff323232),
              //   icon: ImageIcon(AssetImage('images/home/person.png')),
              //   onPressed: onTab,
              // ),
            ],
            // flexibleSpace: Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(colors: [
            //       Color(0xFF00D8FF),
            //       Color(0xFF003BCF),
            //     ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            //   ),
            // ),
          ),
        );
      },
    );
  }
}
