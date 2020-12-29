/*
* @message: 文件描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-28 11:00:42
* @LastEditors: Jack
* @LastEditTime: 2020-08-18 17:23:53
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/common/drawer/index.dart
*/
import 'package:HBit/constants/index.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    this.backgroundColor,
    this.elevation = 16.0,
    @required this.child,
    this.widthPercent = 0.8,
    this.callback,
  }) : assert(widthPercent < 1.0 && widthPercent > 0.0);

  final Color backgroundColor;
  final double elevation;
  final Widget child;

  /// 宽度百分比
  final double widthPercent;
  final DrawerCallback callback;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  void initState() {
    if (widget.callback != null) {
      widget.callback(true);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.callback != null) {
      widget.callback(false);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final double _width =
        MediaQuery.of(context).size.width * widget.widthPercent;
    return ConstrainedBox(
      constraints: BoxConstraints.expand(width: _width),
      child: Material(
        color: kBottomBarColor,
        elevation: widget.elevation,
        child: widget.child,
      ),
    );
  }
}
