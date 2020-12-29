import 'package:HBit/common/i18n/i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/utils/screen.dart';

///分页列表
class PageList extends StatefulWidget {
  final bool recommend;

  ///是否开启分页
  final bool enablePullUp;
  const PageList({Key key, this.recommend = false, this.enablePullUp = true}) : super(key: key);
  @override
  PageListState createState() => PageListState();
}

class PageListState<M, T extends PageList> extends State<PageList> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  ///当前第几页
  int currentPage = 0;
  List<M> items = [];

  bool isLoading = false;
  int pageCount = 10;

  ///刷新列表
  void loadData(int page) {
    setState(() {
      isLoading = true;
    });
    loadPage(
        page: page,
        onSuccess: (list) {
          if (page == 1) {
            items.clear();
          }
          items.addAll(list);
          if (mounted) setState(() {});
          currentPage = page;
          _refreshController.refreshCompleted();
          _refreshController.loadComplete();
          if (items.length < pageCount) {
            _refreshController.loadNoData();
          }
          isLoading = false;
          if (mounted) setState(() {});
        },
        onErr: () {
          _refreshController.loadNoData();
          _refreshController.refreshCompleted();
          _refreshController.loadComplete();

          isLoading = false;
          if (mounted) setState(() {});
        });
  }

  bool get isEnablePullUp => true;
  bool get isEnablePullDown => true;

  Widget buildList(BuildContext context) {
    return SmartRefresher(
      enablePullDown: isEnablePullDown,
      enablePullUp: isEnablePullUp,
      header: WaterDropHeader(
        complete: Text("已刷新",
            style: TextStyle(
                fontSize: sp(32),
                color: Color(0xff999999),
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none)),
      ),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("release to load more");
          } else {
            body = buildFooter();
          }
          return Container(
            height: height(55),
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: () {
        loadData(1);
      },
      onLoading: () {
        loadData(currentPage + 1);
      },
      child: items.isEmpty
          ? GestureDetector(
              behavior: HitTestBehavior.opaque,
        /*      onTap: () {
                loadData(1);
              },*/
              child: isLoading
                  ? Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : empty(),
            )
          : _buildList(),
    );
  }

  Widget _buildList() {
    if (widget.recommend) {
      return _recommendGridView();
    }
    return ListView.separated(
      physics: isEnablePullDown ? BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) => buildItem(items[i]),
      itemCount: items.length,
      separatorBuilder: (context, i) => builderDivider(),
    );
  }

  ///默认空页面
  empty() {
    return Center(
        child: Text("${Tr.of(context).homeNodata}",
            style: TextStyle(
                fontSize: sp(32),
                color: Color(0xff999999),
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none)));
  }

  ///默认列表项
  Widget buildItem(M item) {
    return Card(child: Center(child: Text(item.toString())));
  }

  ///默认列表项
  Widget buildFooter() {
    return Center(child: Text(' '));
  }

  ///默认加载数据
  void loadPage({int page, Function(List<M>) onSuccess, Function onErr}) {
    onSuccess([]);
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

  builderDivider() {
    return Divider(height: height(1), color: Color(dividerColor), indent: width(15), endIndent: width(15));
  }

  GridView _recommendGridView() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: width(18)).add(EdgeInsets.only(top: height(5))),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: width(15), crossAxisSpacing: width(15), childAspectRatio: 0.72),
      itemBuilder: (BuildContext context, int index) => buildItem(items[index]),
      itemCount: items.length,
    );
  }
}
