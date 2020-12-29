/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-14 11:42:45
* @LastEditors: Jack
* @LastEditTime: 2020-08-15 20:17:48
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/RuningHeader.dart
*/
/*
 * Author: Jpeng
 * Email: peng8350@gmail.com
 * Time:  2019-05-26 23:09
 */

import 'package:HBit/utils/screen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;

class RuningHeader extends RefreshIndicator {
  @override
  State<StatefulWidget> createState() {
    return RuningHeaderState();
  }
}

class RuningHeaderState extends RefreshIndicatorState<RuningHeader>
    with TickerProviderStateMixin {
  AnimationController _scaleAnimation;
  AnimationController _offsetController;
  Tween<Offset> offsetTween;

  @override
  void initState() {
    _scaleAnimation = AnimationController(vsync: this);
    _offsetController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    offsetTween = Tween(end: Offset(0.6, 0.0), begin: Offset(0.0, 0.0));
    super.initState();
  }

  @override
  void onOffsetChange(double offset) {
    if (!floating) {
      _scaleAnimation.value = offset / 80.0;
    }
    super.onOffsetChange(offset);
  }

  @override
  void resetValue() {
    _scaleAnimation.value = 0.0;
    _offsetController.value = 0.0;
  }

  @override
  void dispose() {
    _scaleAnimation.dispose();
    _offsetController.dispose();
    super.dispose();
  }

  @override
  Future<void> endRefresh() {
    return _offsetController.animateTo(1.0).whenComplete(() {});
  }

  @override
  Widget buildContent(BuildContext context, RefreshStatus mode) {
    return SlideTransition(
      child: ScaleTransition(
        child: (mode != RefreshStatus.idle || mode != RefreshStatus.canRefresh)
            ? Image.asset(
                "images/login/custom_2.gif",
                width: width(100),
                height: height(100),
              )
            : Image.asset(
                "images/login/custom_1.jpg",
                width: width(100),
                height: height(100),
              ),
        scale: _scaleAnimation,
      ),
      position: offsetTween.animate(_offsetController),
    );
  }
}
