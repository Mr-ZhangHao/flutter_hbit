import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/utils/screen.dart';

///中间对话框 半透明
showCenterDialog(BuildContext context, Widget child) {
  showGeneralDialog(
    context: context,
    barrierLabel: '',
    barrierDismissible: true,
    transitionDuration: Duration(milliseconds: 300),
    barrierColor: Colors.black.withOpacity(0.7),
    pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      return Center(
        child: child,
      );
    },
  );
}

///中间对话框 半透明
showCenterAnimationDialog(BuildContext context, Widget child) {
  showGeneralDialog(
    context: context,
    barrierLabel: '',
    barrierDismissible: true,
    transitionDuration: Duration(milliseconds: 800),
    barrierColor: Colors.black.withOpacity(0.2),
    pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      print(
          'showCenterAnimationDialog:${animation.value},${secondaryAnimation.value}');
      CurvedAnimation curvedAnimation = CurvedAnimation(
          curve: Curves.bounceOut,
          reverseCurve: Curves.easeInExpo,
          parent: animation);
      return Center(
        child: ScaleTransition(
            scale: Tween(begin: 0.0, end: 1.0).animate(curvedAnimation),
            child: SlideTransition(
                position: Tween(begin: Offset(0.0, 0.0), end: Offset(0.0, 3.0))
                    .animate(secondaryAnimation),
                child: FadeTransition(
                    opacity:
                        Tween(begin: 0.0, end: 1.0).animate(curvedAnimation),
                    child: child))),
      );
    },
  );
}

///中间对话框 半透明(重下面弹出)
showBottomInCenterDialog(BuildContext context, Widget child) {
  showGeneralDialog(
    context: context,
    barrierLabel: '',
    barrierDismissible: true,
    transitionDuration: Duration(milliseconds: 300),
    barrierColor: Colors.black.withOpacity(0.2),
    pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      return SlideTransition(
          position: Tween(begin: Offset(0.0, 2.0), end: Offset(0.0, 0.0))
              .chain(CurveTween(curve: Curves.ease))
              .animate(animation),
          child: Center(
            child: child,
          ));
    },
  );
}

///中间对话框 半透明 点外部不消失
showCenterDialog2(BuildContext context, Widget child) {
  showGeneralDialog(
    context: context,
    barrierLabel: '',
    barrierDismissible: false,
    transitionDuration: Duration(milliseconds: 300),
    barrierColor: Colors.black.withOpacity(0.2),
    pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      return Center(
        child: child,
      );
    },
  );
}

///底部对话框 透明
showBottomDialog(BuildContext context, Widget child) {
  showGeneralDialog(
    context: context,
    barrierLabel: '',
    barrierDismissible: true,
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      return Column(children: <Widget>[
        Expanded(
          child: SizedBox(
            width: width(1),
          ),
        ),
        child
      ]);
    },
  );
}

///底部对话框 透明(从下面弹出)
showBottomInBottomDialog(BuildContext context, Widget child) {
  showGeneralDialog(
    context: context,
    barrierLabel: '',
    barrierColor: Colors.black.withOpacity(0.5),
    barrierDismissible: true,
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      return Column(children: <Widget>[
        Expanded(
          child: SizedBox(
            width: width(1),
          ),
        ),
        SlideTransition(
            position: Tween(begin: Offset(0.0, 2.0), end: Offset(0.0, 0.0))
                .chain(CurveTween(curve: Curves.ease))
                .animate(animation),
            child: child)
      ]);
    },
  );
}

///底部对话框 半透明
showBottomDialog2(BuildContext context, Widget child) {
  showGeneralDialog(
    context: context,
    barrierLabel: '',
    barrierDismissible: true,
    transitionDuration: Duration(milliseconds: 300),
    barrierColor: Colors.black.withOpacity(0.2),
    pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      return Column(children: <Widget>[
        Expanded(
          child: SizedBox(
            width: width(1),
          ),
        ),
        child
      ]);
    },
  );
}


showContainerDialog(BuildContext context, Widget child) {
  showGeneralDialog(
    context: context,
    barrierLabel: '',
    barrierDismissible: true,
    transitionDuration: Duration(milliseconds: 300),
    barrierColor: Colors.black.withOpacity(0.7),
    pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      return Container(
        child: child,
      );
    },
  );
}


///显示菜单
showMenuPop(BuildContext context, Widget child) {
  showGeneralDialog(
    context: context,
    barrierLabel: '',
    barrierDismissible: true,
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      return Row(
        children: <Widget>[
          Spacer(),
          Column(
            children: <Widget>[
              SizedBox(
                height: height(55),
              ),
              child,
              Spacer()
            ],
          ),
          SizedBox(
            width: width(15),
          ),
        ],
      );
    },
  );
}

class ForceDialog extends StatelessWidget {
  final String msg;
  final Function onClick;

  const ForceDialog({Key key, this.msg, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(269),
      decoration: ShapeDecoration(
        color: Color(0xffffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(width(10)),
          ),
        ),
      ),
      child: _buildDialog(context),
    );
  }

  Widget _buildDialog(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: width(30), vertical: height(15)),
          alignment: Alignment.center,
          child: Text(msg,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: sp(16),
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none)),
        ),
        Divider(
          height: height(1),
          color: Color(dividerColor),
        ),
        Container(
          height: height(46),
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Text("确定",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: sp(16),
                        color: Color(0xfFF40C1FF),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none)),
                onTap: () {
                  Navigator.of(context).pop();
                  if (onClick != null) {
                    onClick();
                  }
                },
              )),
            ],
          ),
        ),
      ],
    );
  }
}

///提示对话框
class TsDialog extends StatelessWidget {
  final String msg;
  final Function onClick;

  const TsDialog({Key key, this.msg, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(269),
      decoration: ShapeDecoration(
        color: Color(0xffffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(width(10)),
          ),
        ),
      ),
      child: _buildDialog(context),
    );
  }

  Widget _buildDialog(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: width(30), vertical: height(15)),
          alignment: Alignment.center,
          child: Text(msg,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: sp(16),
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none)),
        ),
        Divider(
          height: height(1),
          color: Color(dividerColor),
        ),
        Container(
          height: height(46),
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Text("取消",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: sp(16),
                        color: Color(0xFF40C1FF),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none)),
                onTap: () {
                  Navigator.of(context).pop();
                },
              )),
              VerticalDivider(
                width: width(1),
                color: Color(dividerColor),
              ),
              Expanded(
                  child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Text("确定",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: sp(16),
                        color: Color(0xfFF40C1FF),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none)),
                onTap: () {
                  Navigator.of(context).pop();
                  if (onClick != null) {
                    onClick();
                  }
                },
              )),
            ],
          ),
        ),
      ],
    );
  }
}
