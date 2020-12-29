/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 10:45:10
* @LastEditors: Jack
* @LastEditTime: 2020-09-04 16:08:19
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/views/security.dart
*/


import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/c2c/routes/index.dart';
import 'package:HBit/pages/mine/model/user_model.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/pages/mine/routes/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart'hide Router;

class SecurityPage extends StatelessWidget {
  const SecurityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserInfoModel user = Provider.of<MineProvider>(context).userInfo;
    print(user.tfaType);
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.of(context).securityCenter),
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListItemWidget(
              leading: Tr.of(context).loginPassword,
              linkText: Tr.of(context).modify,
              linkColor: kPrimaryColor,
              onTab: () => Routers.push(context, MineRouter.loginPsw),
            ),
            SizedBox(height: height(20)),
            ListItemWidget(
              leading: Tr.of(context).CellPhone,
              linkText: null == user.mobile ? Tr.of(context).unbounded : Tr.of(context).Bound ,
              linkColor: null == user.mobile ? kPrimaryColor : Color(0xff909090),
              onTab: user.mobile != null ? null : () => Routers.push(context, MineRouter.bindPhone),
            ),
            ListItemWidget(
              leading: Tr.of(context).mailbox,
              linkText: null == user.email ? Tr.of(context).unbounded : Tr.of(context).Bound ,
              linkColor: null == user.email ? kPrimaryColor : Color(0xff909090),
              onTab: user.email != null ? null : () => Routers.push(context, MineRouter.bindEmail),
            ),
            ListItemWidget(
              leading: Tr.of(context).GoogleAuthentication,
              linkText: user.gaSecret == 1 ? Tr.of(context).Bound : Tr.of(context).unbounded,
              linkColor: user.gaSecret == 0 ? kPrimaryColor : Color(0xff909090),
              onTab: user.gaSecret == 1 ? null : () => Routers.push(context, MineRouter.bindGoogle),
            ),
            ListItemWidget(
              leading: Tr.of(context).moneyPassword,
              linkText: user.payPassword == 0 ? Tr.of(context).GoToSet  : Tr.of(context).Tomodify,
              linkColor: kPrimaryColor,
              onTab: () {
                if (user.payPassword == 0) {
                  Routers.push(context, MineRouter.moneyPsw); // 设置
                } else {
                  Routers.push(context, MineRouter.changeMoneyPsw); // 修改
                }
              },
            ),
            SizedBox(height: height(20)),
            ListItemWidget(
              leading: Tr.of(context).c2cSet,
              linkText: "${Tr.of(context).c2cManagement}",
              linkColor: kPrimaryColor,
              onTab: () {
                Routers.push(context, C2CRouter.BindPayment); // 设置
              },
            ),
            SizedBox(height: height(20)),
            // ListItemWidget(
            //   leading: '防钓鱼码',
            //   linkText: '去绑定',
            //   linkColor: kPrimaryColor,
            //   onTab: () => Routers.push(context, MineRouter.unPhishing),
            // ),
            ListItemWidget(
              leading: Tr.of(context).HistoryLogin,
              linkText: '   ',
              linkColor: kPrimaryColor,
              onTab: () => Routers.push(context, MineRouter.loginRecord),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final Function onTab;
  final String leading;
  final String linkText;
  final Color linkColor;
  const ListItemWidget({
    Key key,
    this.onTab,
    this.leading,
    this.linkText,
    this.linkColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: height(100),
        decoration: BoxDecoration(
            color: Colors.white, border: Border(bottom: BorderSide(width: 0.5, color: Color(0xffEBEBEB)))),
        padding: EdgeInsets.symmetric(horizontal: width(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(leading, style: TextStyle(color: Color(0xff909090))),
            Container(
              child: Row(
                children: <Widget>[
                  Text(linkText, style: TextStyle(color: linkColor)),
                  SizedBox(width: width(20)),
                  Image.asset('images/mine/next@3x.png', fit: BoxFit.fill, width: width(22), height: width(33)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
