/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 16:19:48
* @LastEditors: Jack
* @LastEditTime: 2020-08-19 17:50:35
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/views/notice.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/pages/home/provider/notice_provider.dart';
import 'package:HBit/pages/home/routes/index.dart';
import 'package:HBit/providers/provider_widget.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NoticesPage extends StatefulWidget {
  NoticesPage({Key key}) : super(key: key);

  @override
  _NoticesPageState createState() => _NoticesPageState();
}

class _NoticesPageState extends State<NoticesPage>
    with SingleTickerProviderStateMixin {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  onRefresh() {
    print('onRefresh');
    // 刷新完成
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.of(context).searcheAnnouncement),
        centerTitle: true,
        elevation: 0,
      ),
      body: ProviderWidget<NoticesProvider>(
        model: NoticesProvider(),
        onModelReady: (model) => model.initData(),
        builder: (context, model, _) {
          return SmartRefresher(
            controller: _refreshController,
            header: WaterDropHeader(),
            footer: ClassicFooter(),
            onRefresh: model.refresh,
            onLoading: model.loadMore,
            enablePullUp: true,
            enablePullDown: true,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(child: TopNoticeWidget()),
                SliverToBoxAdapter(child: TitleWidget()),
                SliverFixedExtentList(
                  itemExtent: height(100),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return NoticesItemWidget(
                        index: index,
                        onTab: () {
                          Routers.push(context, HomeRouter.noticeDetail);
                        },
                      );
                    },
                    childCount: model.list.length,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class NoticesItemWidget extends StatelessWidget {
  final int index;
  final Function onTab;
  const NoticesItemWidget({
    Key key,
    this.index,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width(30)),
        padding: EdgeInsets.symmetric(horizontal: width(30)),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 0.5, color: Color(0xffD8D8D8)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset('images/home/laba.png',
                fit: BoxFit.fill, width: width(44), height: height(44)),
            SizedBox(width: width(15)),
            Expanded(
                child: Text(
              'BitMore 官网已上线…BitMore 官网已上线…',
              style: TextStyle(fontSize: sp(28), color: Color(0xff323232)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
            SizedBox(width: width(10)),
            Text(
              '2020年7月31日',
              style: TextStyle(fontSize: sp(24), color: Color(0xffB9B9B9)),
            )
          ],
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding:
          EdgeInsets.symmetric(horizontal: width(30), vertical: height(30)),
      child: Text(Tr.of(context).searcheHistoricalAnnouncement,
          style: TextStyle(fontSize: sp(30), fontWeight: FontWeight.w500)),
    );
  }
}

class TopNoticeWidget extends StatelessWidget {
  const

  TopNoticeWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(30)),
      constraints: BoxConstraints(
        minHeight: height(650),
        maxHeight: height(700),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset('images/home/top.png',
              width: double.infinity, height: height(100)),
          Expanded(
            child: Column(
              children: <Widget>[
                Text('关于BitMore合约交易最新版本上'),
                Text(
                    """       由于受当前国内币圈热潮影响，币币交易、 合约交易大热，故此BitMore合约平台服务器将于 2020年8月31日凌晨正式开放。
                  请广大用户提高警 惕防范诈骗，一切信息以我司官方公布为准。否则， 因此给您造成任何经济损失均由您自行承担，与我 司无关。 请广大用户知悉。给各位造成的不便敬请谅解
                """),
                Text("特此公告！ 2020年7月31日")
              ],
            ),
          ),
          Image.asset('images/home/bottom.png',
              width: double.infinity, height: height(66)),
        ],
      ),
    );
  }
}
