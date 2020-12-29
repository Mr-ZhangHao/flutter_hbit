
import 'package:HBit/pages/c2c/routes/index.dart';
import 'package:HBit/pages/login/routes/index.dart';
import 'package:HBit/pages/mine/routes/index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart'hide Router;
import 'package:HBit/pages/home/routes/index.dart';
import 'package:HBit/pages/login/login_screen.dart';
import 'package:HBit/pages/trade/routes/index.dart';
import 'package:HBit/pages/wallet/routes/index.dart';
import 'package:HBit/common/tabbar/index.dart';
import 'package:HBit/pages/splash/splash_page.dart';
import 'package:HBit/routes/router_init.dart';
import 'package:HBit/routes/webView.dart';
import 'package:provider/provider.dart';
import '../pages/contract/routes/index.dart';
import '404.dart';

class Routes {
  static String home = '/home';
  static String splash = 'splash';
  static String login = '/login';
  static String webViewPage = '/webViewPage';
  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(FluroRouter router) {


    /// 指定路由跳转错误返回页 404页
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      debugPrint('未找到目标页');
      return WidgetNotFound();
    });

    router.define(splash,
        handler: Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) => SplashPage()));
    router.define(home,
        handler: Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) => BottomTabBar()));
    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      final String title = params['title']?.first;
      final String url = params['url']?.first;
      return WebViewPage(title: title, url: url);
    }));

    router.define(login,
        handler: Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) => LoginScreen()));
    _listRouter.clear();
    _listRouter.add(HomeRouter());
    _listRouter.add(MineRouter());
    _listRouter.add(C2CRouter());
    _listRouter.add(WalletRouter());
    _listRouter.add(TradeRouter());
    _listRouter.add(ContractRouter());
    _listRouter.add(LoginRouter());

    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
