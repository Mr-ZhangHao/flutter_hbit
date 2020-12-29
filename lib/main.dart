/*
* @message: 入口文件
* @Author: 徐士杰
* @Email: shijie10086@163.com
* @Github: shijie10086@163.com
* @Date: 2020-03-24 10:08:21
* @LastEditors: Jack
* @LastEditTime: 2020-08-26 17:17:24
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/main.dart
*/
import 'dart:io';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/providers/local_provider.dart';
import 'package:HBit/providers/provider_manager.dart';
import 'package:HBit/providers/theme_provider.dart';
import 'package:HBit/routes/application.dart';
import 'package:HBit/routes/routes.dart';
import 'package:HBit/utils/sp_utils.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:event_bus/event_bus.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'constants/index.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtils.init();
  //设置安卓状态栏透明
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: kTransprant, //设置为透明
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
  );

}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final bool isFirst = SpUtils.sp.getBool('isFirst');
    print("isFirst:"+isFirst.toString());
    if(isFirst==null){
      //首次初始化本地 语言
      Provider.of<LocalProvider>(context,listen: false).switchLocale(3);
    }

    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
    Application.eventBus = EventBus();


    return Consumer2<ThemeProvider, LocalProvider>(
      builder: (context, themeModel, localModel, child) {
        return MaterialApp(
          title: 'HBit',
          navigatorKey: navigatorKey,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Application.router.generator,
          theme: themeModel.themeData(),
          darkTheme: themeModel.themeData(platformDarkMode: false),
          initialRoute: Routes.splash,
          locale: localModel.locale,
          localizationsDelegates: const [
            Tr.delegate,
            RefreshLocalizations.delegate, //下拉刷新
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: Tr.delegate.supportedLocales,
          ///当传入的是不支持的语种，可以根据这个回调，返回相近,并且支持的语种
          localeResolutionCallback: (local, support) {
            ///当前软件支行的语言 也就是[supportedLocales] 中配制的语种
            if (support.contains(local)) {
              print('support  $local');
              return local;
            }
            ///如果当前软件运行的手机环境不在 [supportedLocales] 中配制的语种范围内
            ///返回一种默认的语言环境，这里使用的是中文
            print('no_support local is $local and support is $support');
            return const Locale('zh', 'CN');
          },
        );
      },
    );
  }

}
