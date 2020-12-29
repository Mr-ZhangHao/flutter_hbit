/*
* @message: 文件描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-26 11:48:01
* @LastEditors: Mike
* @LastEditTime: 2020-05-29 17:37:41
* @Deprecated: 否
* @FilePath: /KMEX_Flutter/lib/common/refresher_footer.dart
*/
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefresherFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Text("上拉加载");
        } else if (mode == LoadStatus.loading) {
          body = CupertinoActivityIndicator();
        } else if (mode == LoadStatus.failed) {
          body = Text("加载失败！点击重试！");
        } else if (mode == LoadStatus.canLoading) {
          body = Text("松手,加载更多!");
        } else {
          body = Text("没有更多!");
        }
        return Container(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }
}

