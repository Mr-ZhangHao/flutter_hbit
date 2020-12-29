// 自定义一个类继承Flutter 的 SearchDelegate 搜索组件
import 'package:HBit/pages/home/views/searchdelegate/search_results.dart';
import 'package:HBit/pages/home/views/searchdelegate/search_suggestions.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 模拟数据源
const searchList = ['BTC/USDT', 'BTC/HUSD', 'ETH/BTC', 'HT/BTC'];

const recentSuggest = [];
// "BTC/USDT", "BTC/HUSD"

class SearchBarDelegate extends SearchDelegate {
  SearchBarDelegate({Key key})
      : super(
          searchFieldLabel: '请输入币种名称',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  // @override
  // ThemeData appBarTheme(BuildContext context) {
  //   assert(context != null);
  //   final ThemeData theme = Theme.of(context);
  //   assert(theme != null);
  //   return theme.copyWith(
  //     primaryColor: theme.scaffoldBackgroundColor,
  //     primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
  //     primaryTextTheme: theme.textTheme,
  //   );
  // }

  @override // 构建右侧的图标。实现点击清除框的效果
  List<Widget> buildActions(BuildContext context) {
    return [
      InkWell(
          onTap: () => close(context, null),
          child: Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(25), left: ScreenUtil().setWidth(25)),
            child: Center(
              child: Text(
                '取消',
                style: TextStyle(fontSize: ScreenUtil().setSp(28)),
              ),
            ),
          )),
    ];
  }

  @override // 构建左侧的图标.
  Widget buildLeading(BuildContext context) {
    // return Icon(Icons.search, size: ScreenUtil().setSp(70));
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Routers.goBack(context),
        child: Container(
          alignment: Alignment.center,
          child: Image.asset('images/mine/back@2x.png', width: width(22), height: height(36)),
        ));
  }

  @override // 搜索后返回的内容组件
  Widget buildResults(BuildContext context) {
    if (query.length > 0) {
      return SearchResults(coinName: query);
    }
    return Container(
      child: Center(
        child: Text('没有相关币种'),
      ),
    );
  }

  @override //搜索返回来的列表
  Widget buildSuggestions(BuildContext context) {
    return SearchSuggestions();
  }
}
