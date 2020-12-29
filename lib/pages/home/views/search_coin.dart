import 'dart:async';

import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/main.dart';
import 'package:HBit/pages/home/model/search_coin_model.dart';
import 'package:HBit/pages/home/provider/index.dart';
import 'package:HBit/pages/home/server/index.dart';
import 'package:HBit/pages/trade/routes/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/sp_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchCoinPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchCoinPageState();
  }
}

class _SearchCoinPageState extends State<SearchCoinPage> {
  final _searchCtr = TextEditingController(text: '');
  String _searchText = '';
  final FocusNode _searchFocus = FocusNode();
  Timer _timer;
  //设置节流周期为390毫秒
  Duration durationTime = Duration(milliseconds: 300);

  List<SearchCoinModel> resultList = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((mag) {
      Provider.of<HomeProvider>(context, listen: false).getHotCoins();
      Provider.of<HomeProvider>(context, listen: false).getHistoryCoins();
      // print('-----------------------------');
      // print(json.encode(dataList) is String);
      // print(json.decode(json.encode(dataList)) is String);
      // print('-----------------------------');
    });
    _searchCtr.addListener(() {
      setState(() {
        _searchText = _searchCtr.text.trim();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _searchCtr.clear();
    _searchCtr.dispose();
    super.dispose();
  }

  onSearch(val) {
    if (val.toString().trim().length > 0) {
      setState(() {
        _timer?.cancel();
        _timer = Timer(durationTime, () async {
          //搜索函数
          try {
            List<SearchCoinModel> resultList = await HomeServer.searchCoin(val);
            setState(() {
              this.resultList = resultList;
            });
          } catch (e) {
            print(e);
          }
        });
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Consumer<HomeProvider>(
          builder: (BuildContext context, HomeProvider model, Widget child) {
            return TextFileWidget(
                focus: _searchFocus,
                controller: _searchCtr,
                onCancel: () {
                  setState(() {
                    _searchText = '';
                    _searchCtr.text = '';
                  });
                },
                onChanged: (val) => onSearch(val));
          },
        ),
        leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Routers.goBack(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png', width: width(22), height: height(36)),
            )),
      ),
      body: _searchText.length == 0
          ? Column(
              children: <Widget>[
                Consumer<HomeProvider>(
                  builder: (BuildContext context, model, Widget child) {
                    return HotSearchWidget(
                      dataList: model.hotCoins ?? [],
                      onTab: (val) {
                        // print(val);
                        setState(() {
                          _searchText = val;
                          _searchCtr.text = val;
                        });
                        onSearch(val);
                      },
                    );
                  },
                ),
                Consumer<HomeProvider>(
                  builder: (BuildContext context, HomeProvider model, Widget child) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: model.historyCoins.length + 1,
                        itemBuilder: (context, index) {
                          if (index < model.historyCoins.length) {
                            return GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                Routers.push(context,
                                    "${TradeRouter.kline}?coinName=${model.historyCoins[index]}_USDT&coinID=${model.historyCoins[index]}_USDT&type=trade");
                                print('跳到币的详情${model.historyCoins[index]}');
                              },
                              child: CoinListItem(text: model.historyCoins[index]),
                            );
                          } else if (model.historyCoins.length > 0) {
                            return GestureDetector(
                              onTap: () async {
                                var res = await SpUtils.getStringList('searchHistory');
                                print(res);
                                await SpUtils.setStringList('searchHistory', []);
                                Provider.of<HomeProvider>(context, listen: false).getHistoryCoins();
                              },
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: height(40)),
                                alignment: Alignment.center,
                                child: Text(
                                  Tr.of(context).searcheClearRecord,
                                  style: TextStyle(fontSize: sp(24), color: Color(0xff999999)),
                                ),
                              ),
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    );
                  },
                )
              ],
            )
          : SearchResults(results: resultList),
    );
  }
}

class SearchResults extends StatelessWidget {
  final List<SearchCoinModel> results;
  const SearchResults({
    Key key,
    this.results,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return results.length > 0
        ? ListView.builder(
            itemCount: results?.length ?? 0,
            itemBuilder: (context, index) {
              // TradeByModel item = model.list[index];
              return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    print('跳到币的详情${results[index].name}');
                    List<String> historyCoins = Provider.of<HomeProvider>(context, listen: false).historyCoins.toList();
                    Routers.push(context,
                        "${TradeRouter.kline}?coinName=${results[index].name}_USDT&coinID=${results[index].name}_USDT&type=trade");
                    print(historyCoins);
                    historyCoins.add(results[index].name);
                    Set<String> list = new Set();
                    list.addAll(historyCoins);
                    print(list.toList());
                    await SpUtils.setStringList('searchHistory', list.toList());
                    Provider.of<HomeProvider>(context, listen: false).getHistoryCoins();
                  },
                  child: CoinListItem(text: results[index].name));
            })
        : Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: height(50)),
                  child: Image.asset(
                    'images/contract/no_record.png',
                    width: width(230),
                    height: width(230),
                    fit: BoxFit.contain,
                  ),
                ),
                Text(Tr.of(context).searcheNoRecord, style: TextStyle(color: Color(0xffc9c9c9)))
              ],
            ),
          );
  }
}

class CoinListItem extends StatelessWidget {
  final String text;
  const CoinListItem({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(100),
      margin: EdgeInsets.symmetric(horizontal: width(44)),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: Color(0xffDDDDDD)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(color: Color(0xff333333), fontSize: sp(28)),
          ),
          Image.asset(
            'images/home/fx.png',
            height: height(22),
            width: width(22),
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}

class HotSearchWidget extends StatelessWidget {
  final List<String> dataList;
  final Function(String) onTab;
  const HotSearchWidget({
    Key key,
    @required this.dataList,
    @required this.onTab,
  }) : super(key: key);
// Text('热门搜索'),
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: width(30), top: height(20), bottom: height(24)),
          alignment: Alignment.centerLeft,
          child: Text(Tr.of(context).searcheHot, style: TextStyle(color: Color(0xff999999), fontSize: sp(24))),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: width(30)),
            height: height(80),
            child: GridView.builder(
              itemCount: dataList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => onTab(dataList[index]),
                  child: HotItem(text: dataList[index]),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  //水平单个子Widget之间间距
                  mainAxisSpacing: height(20),
                  //垂直单个子Widget之间间距
                  crossAxisSpacing: width(10),
                  childAspectRatio: 4.5),
            ))
      ],
    );
  }
}

class HotItem extends StatelessWidget {
  final String text;
  const HotItem({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xffEBEBEB),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(text, style: TextStyle(color: Color(0xff666666), fontSize: sp(24))),
    );
  }
}

///搜索控件widget
class TextFileWidget extends StatelessWidget {
  final FocusNode focus;
  final TextEditingController controller;
  final Function onCancel;
  final Function onChanged;
  const TextFileWidget({
    Key key,
    this.focus,
    this.controller,
    @required this.onCancel,
    this.onChanged,
  }) : super(key: key);

  Widget buildTextField() {
    //theme设置局部主题
    return FocusWidget(
      focusNode: focus,
      child: TextField(
        controller: controller,
        focusNode: focus,
        cursorColor: Color(0xffc2c2c2), //设置光标
        onChanged: (val) {
          onChanged(val);
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: height(18)),
            fillColor: Colors.white,
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Color(0xffC2C2C2), size: sp(44)),
            hintText: Tr.of(navigatorKey.currentContext).searcheCurrency,
            hintStyle: TextStyle(fontSize: sp(28), color: Color(0xffc2c2c2))),
        style: TextStyle(fontSize: sp(28), color: Color(0xff323232)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget editView() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: width(20)),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.5), //灰色的一层边框
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            boxShadow: [BoxShadow(offset: Offset(1, 1), color: Color(0xffCDCDCD), blurRadius: 5.0, spreadRadius: -1)]),
        alignment: Alignment.center,
        height: height(60),
        child: buildTextField(),
      );
    }

    var cancleView = Text(Tr.of(context).cancel, style: TextStyle(color: kPrimaryColor, fontSize: sp(28)));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: editView(),
          flex: 1,
        ),
        GestureDetector(
          onTap: onCancel,
          child: Padding(
            padding: EdgeInsets.only(left: width(30)),
            child: cancleView,
          ),
        )
      ],
    );
  }
}
