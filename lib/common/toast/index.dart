/*
* @message: 描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-17 21:58:21
* @LastEditors: Roy
* @LastEditTime: 2020-08-19 14:23:13
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/common/toast/index.dart
*/
import 'package:HBit/constants/index.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator_view/loading_indicator_view.dart';
import 'package:HBit/utils/screen.dart';

class CustomOffsetAnimation extends StatefulWidget {
  final AnimationController controller;
  final Widget child;

  const CustomOffsetAnimation({Key key, this.controller, this.child}) : super(key: key);

  @override
  _CustomOffsetAnimationState createState() => _CustomOffsetAnimationState();
}

class _CustomOffsetAnimationState extends State<CustomOffsetAnimation> {
  Tween<Offset> tweenOffset;
  Tween<double> tweenScale;

  Animation<double> animation;

  @override
  void initState() {
    tweenOffset = Tween<Offset>(
      begin: const Offset(0.0, 0.8),
      end: Offset.zero,
    );
    tweenScale = Tween<double>(begin: 0.3, end: 1.0);
    animation = CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      child: widget.child,
      animation: widget.controller,
      builder: (BuildContext context, Widget child) {
        return FractionalTranslation(
            translation: tweenOffset.evaluate(animation),
            child: ClipRect(
              child: Transform.scale(
                scale: tweenScale.evaluate(animation),
                child: Opacity(
                  child: child,
                  opacity: animation.value,
                ),
              ),
            ));
      },
    );
  }
}

// 自定义loading图标
class CustomLoadWidget extends StatefulWidget {
  final CancelFunc cancelFunc;
  final Color bgColor;
  final String loadText;
  const CustomLoadWidget({Key key, this.cancelFunc, this.bgColor, this.loadText}) : super(key: key);

  @override
  _CustomLoadWidgetState createState() => _CustomLoadWidgetState();
}

class _CustomLoadWidgetState extends State<CustomLoadWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardTheme.color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            LineSpinFadeLoaderIndicator(
              ballColor: kPrimaryColor,
            ),
            SizedBox(height: height(10)),
            Text(
              widget.loadText,
              style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
            )
          ],
        ),
      ),
    );
  }
}

// 带成功的图标
class SuccessTextWidget extends StatelessWidget {
  final String text;
  const SuccessTextWidget({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0),
      child: Container(
        constraints: BoxConstraints(
          minWidth: width(220),
        ),
        child: Card(
          color: Theme.of(context).cardTheme.color,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.check,
                  color: Color(0xff397DFD),
                  size: sp(60),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width(38), vertical: height(28)),
                child: Text(text, style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 带错误的图标
class ErrorTextWidget extends StatelessWidget {
  final String text;
  const ErrorTextWidget({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0),
      child: Card(
        color: Theme.of(context).cardTheme.color,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.close,
                color: Color(0xff397DFD),
                size: sp(60),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width(38), vertical: height(28)),
              child: Text(text, style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color)),
            ),
          ],
        ),
      ),
    );
  }
}

// 文本
class TextWidget extends StatelessWidget {
  final String text;
  const TextWidget({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0),
      child: Card(
        color: Theme.of(context).cardTheme.color,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width(38), vertical: height(28)),
          child: Text(text, style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}

class Toast {
  static showError(String text) {
    BotToast.showCustomText(
      clickClose: true,
      backButtonBehavior: BackButtonBehavior.close,
      ignoreContentClick: true,
      toastBuilder: (_) => ErrorTextWidget(text: text),
    );
  }

  static showSuccess(String text) {
    BotToast.showCustomText(
      clickClose: true,
      backButtonBehavior: BackButtonBehavior.close,
      ignoreContentClick: true,
      toastBuilder: (context) => SuccessTextWidget(text: text),
    );
  }

  static showText(String text) {
    BotToast.showCustomText(
      clickClose: true,
      backButtonBehavior: BackButtonBehavior.close,
      ignoreContentClick: true,
      toastBuilder: (_) => TextWidget(text: text),
    );
  }

  static showLoading(String text) {
    BotToast.showCustomLoading(
        backgroundColor: Colors.black12,
        toastBuilder: (cancelFunc) => CustomLoadWidget(
              cancelFunc: cancelFunc,
              loadText: text,
              // bgColor: Theme.of(context).textTheme.bodyText1.color,
            ));
  }

  static close() {
    BotToast.closeAllLoading();
  }
}

// 自定义弹框
void showAlertDialog(BackButtonBehavior backButtonBehavior,
    {VoidCallback cancel,
    VoidCallback confirm,
    VoidCallback backgroundReturn,
    String message,
    String cancelText = '取消',
    String confirmText = '确定',
    @required BuildContext context}) {
  BotToast.showAnimationWidget(
      clickClose: false,
      allowClick: false,
      onlyOne: true,
      crossPage: true,
      backButtonBehavior: backButtonBehavior,
      wrapToastAnimation: (controller, cancel, child) => Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  cancel();
                  backgroundReturn?.call();
                },
                //The DecoratedBox here is very important,he will fill the entire parent component
                child: AnimatedBuilder(
                  builder: (_, child) => Opacity(
                    opacity: controller.value,
                    child: child,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black26),
                    child: SizedBox.expand(),
                  ),
                  animation: controller,
                ),
              ),
              CustomOffsetAnimation(
                controller: controller,
                child: child,
              )
            ],
          ),
      toastBuilder: (cancelFunc) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            title: Text(message, style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color)),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  cancelFunc();
                  cancel?.call();
                },
                highlightColor: Color(0x55FF8A80),
                splashColor: Color(0x99FF8A80),
                child: Text(
                  cancelText,
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
              FlatButton(
                onPressed: () {
                  cancelFunc();
                  confirm?.call();
                },
                child: Text(confirmText),
              ),
            ],
          ),
      animationDuration: Duration(milliseconds: 300));
}
