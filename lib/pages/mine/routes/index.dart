/*
* @message: 主页路由控制
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-02-27 20:08:46
* @LastEditors: Jack
* @LastEditTime: 2020-09-04 18:45:48
* @Deprecated: 否
* @FilePath: /HBit_flutter/lib/pages/mine/routes/index.dart
*/
import 'package:HBit/pages/mine/mine_screen.dart';
import 'package:HBit/pages/mine/views/bind_email.dart';
import 'package:HBit/pages/mine/views/bind_google.dart';
import 'package:HBit/pages/mine/views/bind_phone.dart';
import 'package:HBit/pages/mine/views/edit_money_psw.dart';
import 'package:HBit/pages/mine/views/edit_login_psw.dart';
import 'package:HBit/pages/mine/views/focus_us.dart';
import 'package:HBit/pages/mine/views/identity_auth1.dart';
import 'package:HBit/pages/mine/views/identity_auth2.dart';
import 'package:HBit/pages/mine/views/identity_auth3.dart';
import 'package:HBit/pages/mine/views/identity_type.dart';
import 'package:HBit/pages/mine/views/login_record.dart';
import 'package:HBit/pages/mine/views/money_psw.dart';
import 'package:HBit/pages/mine/views/rate.dart';
import 'package:HBit/pages/mine/views/security.dart';
import 'package:HBit/pages/mine/views/share.dart';
import 'package:HBit/pages/mine/views/un_phishing.dart';
import 'package:HBit/pages/mine/views/vertify_status.dart';
import 'package:fluro/fluro.dart';
import 'package:HBit/routes/router_init.dart';

class MineRouter implements IRouterProvider {
  static String mine = '/mine';
  static String security = '/security';
  static String loginPsw = '/loginPsw';
  static String bindPhone = '/bindPhone';
  static String bindEmail = '/bindEmail';
  static String bindGoogle = '/bindGoogle';
  static String moneyPsw = '/moneyPsw';
  static String unPhishing = '/unPhishing';
  static String loginRecord = '/loginRecord';
  static String focusUs = '/focusUs';
  static String share = '/share';
  static String auth1 = '/auth1';
  static String auth2 = '/auth2';
  static String auth3 = '/auth3';
  static String changeMoneyPsw = '/changeMoneyPsw';
  static String identityType = '/identityType';
  static String vertifyStatus = '/vertifyStatus';
  static String rate = '/rate';

  @override
  void initRouter(FluroRouter router) {
    // 我的
    router.define(mine, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      // Map<String, dynamic> item = json.decode(params['param'].first);
      // NoticeModel noticeModel = NoticeModel.fromJson(item);
      return MineScreen();
    }));
    // 安全中心
    router.define(security, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return SecurityPage();
    }));
    // 登录密码
    router.define(loginPsw, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return EditLoginPswPage();
    }));

    // 绑定手机
    router.define(bindPhone, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return BindPhonePage();
    }));
    // 绑定邮箱
    router.define(bindEmail, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return BindEmailPage();
    }));

    // 绑定邮箱
    router.define(bindGoogle, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return BindGooglePage();
    }));

    // 资金密码
    router.define(moneyPsw, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return MoneyPswPage();
    }));

    // 防钓鱼
    router.define(unPhishing, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return UnPhishingpage();
    }));

    // 登录历史
    router.define(loginRecord, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return LoginRecordPage();
    }));

    // 关注我们
    router.define(focusUs, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return FocusUsPage();
    }));

    // share
    router.define(share, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return SharePage();
    }));

    // 身份认证
    router.define(auth1, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return IdentityAuth1Page();
    }));

    // 身份认证
    router.define(auth2, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return IdentityAuth2Page();
    }));

    // 护照认证
    router.define(auth3, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return IdentityAuth3Page();
    }));
    router.define(identityType, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return IdentityTypePage();
    }));

    // 修改资金密码
    router.define(changeMoneyPsw, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return EditMoneyPswPage();
    }));

    // 修改资金密码
    router.define(vertifyStatus, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return VertifyStatusPage();
    }));

    // 修改资金密码
    router.define(rate, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      return RatePage();
    }));
  }
}
