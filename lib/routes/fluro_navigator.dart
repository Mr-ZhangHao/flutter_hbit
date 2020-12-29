import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart'hide Router;
import 'application.dart';
import 'routes.dart';

class Routers {
  static push(BuildContext context, String path, {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    Application.router
        .navigateTo(context, path, replace: replace, clearStack: clearStack, transition: TransitionType.native);
  }

  //需要页面返回值的跳转
  static pushResult(BuildContext context, String path, Function(Object) function,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    Application.router
        .navigateTo(context, path, replace: replace, clearStack: clearStack, transition: TransitionType.native)
        .then((result) {
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((error) {
      print('$error');
    });
  }

  static void goBack(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  static void goBackWithParams(BuildContext context, result) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context, result);
  }

  static void goWebViewPage(BuildContext context, String title, String url) {
    push(context, '${Routes.webViewPage}?title=${Uri.encodeComponent(title)}&url=${Uri.encodeComponent(url)}',
        clearStack: false);
  }
}
