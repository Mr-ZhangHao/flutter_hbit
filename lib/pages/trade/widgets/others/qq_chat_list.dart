/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-13 17:30:08
* @LastEditors: Jack
* @LastEditTime: 2020-08-15 20:18:25
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/trade/widgets/others/qq_chat_list.dart
*/
/*
 * Author: Jpeng
 * Email: peng8350@gmail.com
 * Time:  2019-07-11 17:55
 */
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'RuningHeader.dart';

class QQChatList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QQChatListState();
  }
}

const String myUrl =
    "https://avatars1.githubusercontent.com/u/19425362?s=400&u=1a30f9fdf71cc9a51e20729b2fa1410c710d0f2f&v=4";

class _QQChatListState extends State<QQChatList> {
  RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
  }

  onRefresh() {
    print('onRefresh');
    _refreshController.refreshCompleted();
  }

  onLoadMore() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        header: RuningHeader(),
        footer: ClassicFooter(),
        onRefresh: onRefresh,
        onLoading: onLoadMore,
        enablePullUp: false,
        child: Center(
          child: Text('asasdasd'),
        ),
      ),
    );
  }
}
