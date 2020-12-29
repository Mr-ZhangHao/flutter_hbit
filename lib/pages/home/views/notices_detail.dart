/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 16:19:48
* @LastEditors: Jack
* @LastEditTime: 2020-08-19 17:58:22
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/views/notices_detail.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class NoticesDetailPage extends StatefulWidget {
  NoticesDetailPage({Key key}) : super(key: key);

  @override
  _NoticesDetailPageState createState() => _NoticesDetailPageState();
}

class _NoticesDetailPageState extends State<NoticesDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.of(context).searcheAnnouncement),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        constraints: BoxConstraints(
          minHeight: Screen.height,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset('images/home/top.png',
                width: double.infinity, height: height(100)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text('关于BitMore合约交易最新版本上'),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: width(30)),
                      child: Text(
                          """       由于受当前国内币圈热潮影响，币币交易、 合约交易大热，故此BitMore合约平台服务器将于 2020年8月31日凌晨正式开放。
    请广大用户提高警 惕防范诈骗，您造成任何经济损失均由您自行承担，与我 司无关。 请广大用户知悉。给各位造成的不便敬请谅解 由于受当前国内币圈热潮影响，币币交易、 合约交易大热，故此BitMore合约平台服务器将于 2020年8月31日凌晨正式开放。
    请广大用户提高警 惕防范诈骗，，与我 司无关。 请广大用户知悉。给各位造成的不便敬请谅解 由于受当前国内币圈热潮影响，币币交易、 合约交易大热，故此BitMore合约平台服务器将于 2020年8月31日凌晨正式开放。
    请广大用户提高警 惕防范诈骗，一切信息以我司官方公布为准。否则， 因此给您造成任何经济损失均由您自行承担，与我 司无关。 请广大用户知悉。给各位造成的不便敬请谅解
                          """),
                    ),
                    Text("特此公告！ 2020年7月31日")
                  ],
                ),
              ),
            ),
            Image.asset('images/home/bottom.png',
                width: double.infinity, height: height(66)),
          ],
        ),
      ),
    );
  }
}
