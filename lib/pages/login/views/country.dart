import 'dart:async';

import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/main.dart';
import 'package:HBit/pages/login/model/country_map.dart';
import 'package:HBit/pages/login/server/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:HBit/pages/login/model/country_model.dart';

class countryPage extends StatefulWidget {
  @override
  _countryPageState createState() => _countryPageState();
}

class _countryPageState extends State<countryPage> {
  final _searchCtr = TextEditingController(text: '');
  String _searchText = '';
  final FocusNode _searchFocus = FocusNode();
  Timer _timer;

  //设置节流周期为390毫秒
  Duration durationTime = Duration(milliseconds: 300);

  List<CountryModel> resultList = [];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
        _getData();

    _searchCtr.addListener((){
      print("controller的监听方法："+_searchCtr.text);
      if(_searchCtr.text==''||_searchCtr.text.isEmpty||_searchCtr.text.length==0){
        List<CountryModel> resultList = [];
        if(resultList.length>0){
          resultList.clear();
        }
        for(var i=0; i < countrys_cn.toList().length;i++){
          CountryModel  countryModel =new CountryModel();
          countryModel.name = countrys_cn[i];
          countryModel.areaCode =  areaCode[i];
          countryModel.nameUS =  countrys_en[i];

          resultList.add(countryModel);
        }
        setState(() {
          this.resultList = resultList;
        });
      }
    });
  }

  void _getData(){

    for(var i=0; i < countrys_cn.toList().length;i++){
      CountryModel  countryModel =new CountryModel();
      countryModel.name = countrys_cn[i];
      countryModel.areaCode =  areaCode[i];
      countryModel.nameUS =  countrys_en[i];
      resultList.add(countryModel);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text(Tr.of(context).chooseCountry),
        elevation: 1,
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFileWidget(
              focus: _searchFocus,
              controller: _searchCtr,
              onCancel: () {
                setState(() {
                  _searchText = '';
                  _searchCtr.text = '';


                });
              },
              onChanged: (val) {
                onSearch(val);
              } ),
          _searchText.length == 0
              ? Expanded(
                  child: ListView.builder(
                      itemCount: resultList?.length ?? 0,
                      itemBuilder: (context, index) {
                        // TradeByModel item = model.list[index];
                        return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () async {
                              print('跳到注册页${resultList[index].name}');
                              List myList = [resultList[index].name,resultList[index].areaCode,resultList[index].nameUS,];
                              Routers.goBackWithParams(context, myList);

                              /*           List<String> historyCoins = Provider.of<HomeProvider>(context, listen: false).historyCoins.toList();
                Routers.push(context,
                    "${TradeRouter.kline}?coinName=${results[index].name}_USDT&coinID=${results[index].name}_USDT&type=trade");
                print(historyCoins);
                historyCoins.add(results[index].name);
                Set<String> list = new Set();
                list.addAll(historyCoins);
                print(list.toList());
                await SpUtils.setStringList('searchHistory', list.toList());
                Provider.of<HomeProvider>(context, listen: false).getHistoryCoins();*/
                            },
                            child: CountryListItem(
                              text: resultList[index].name+' '+resultList[index].nameUS,
                              areaCode: resultList[index].areaCode,
                            ));
                      }))
              : SearchResults(results: resultList),
        ],
      ),
    );
  }

  onSearch(val) {
    if (val.toString().trim().length > 0) {
      setState(() {
        _timer?.cancel();
        _timer = Timer(durationTime, () async {
          //搜索函数
          try {
            List<CountryModel> resultList = [];
              if(resultList.length>0){
                resultList.clear();
              }
            for(var i=0; i < countrys_cn.toList().length;i++){
              if(countrys_cn[i].contains(val)){
                CountryModel  countryModel =new CountryModel();
                countryModel.name = countrys_cn[i];
                countryModel.areaCode =  areaCode[i];
                countryModel.nameUS =  countrys_en[i];
                resultList.add(countryModel);
              }
            }
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
}

class SearchResults extends StatelessWidget {
  final List<CountryModel> results;

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
                    //      print('跳到币的详情${results[index].name}');
                    /*           List<String> historyCoins = Provider.of<HomeProvider>(context, listen: false).historyCoins.toList();
                Routers.push(context,
                    "${TradeRouter.kline}?coinName=${results[index].name}_USDT&coinID=${results[index].name}_USDT&type=trade");
                print(historyCoins);
                historyCoins.add(results[index].name);
                Set<String> list = new Set();
                list.addAll(historyCoins);
                print(list.toList());
                await SpUtils.setStringList('searchHistory', list.toList());
                Provider.of<HomeProvider>(context, listen: false).getHistoryCoins();*/
                  },
                  child: CountryListItem(
                    text: results[index].name+' '+results[index].nameUS,
                    areaCode: results[index].areaCode,
                  ));
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
                Text(Tr.of(context).searcheNoRecord,
                    style: TextStyle(color: Color(0xffc9c9c9)))
              ],
            ),
          );
  }
}

class CountryListItem extends StatelessWidget {
  final String text;
  final String areaCode;

  const CountryListItem({
    Key key,
    this.text,
    this.areaCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(100),
      margin: EdgeInsets.symmetric(horizontal: width(44)),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xffDDDDDD)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Color(0xff333333), fontSize: sp(30)),
            ),
          ),
          Text(
            areaCode,
            style: TextStyle(color: Color(0xffBDBDBD), fontSize: sp(30)),
          ),
        ],
      ),
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
        cursorColor: Color(0xffc2c2c2),
        //设置光标
        onChanged: (val) {
          onChanged(val);
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: height(18)),
            fillColor: Colors.white,
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Color(0xffC2C2C2), size: sp(44)),
            hintText: Tr.of(navigatorKey.currentContext).chooseCountryHint,
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
        margin: EdgeInsets.symmetric(horizontal: width(20),vertical: height(20)),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.5), //灰色的一层边框
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(1, 1),
                  color: Color(0xffCDCDCD),
                  blurRadius: 5.0,
                  spreadRadius: -1)
            ]),
        alignment: Alignment.center,
        height: height(88),
        child: buildTextField(),
      );
    }

    var cancleView = Text(Tr.of(context).cancel,
        style: TextStyle(color: kPrimaryColor, fontSize: sp(28)));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: editView(),
          flex: 1,
        ),
    /*    GestureDetector(
          onTap: onCancel,
          child: Padding(
            padding: EdgeInsets.only(left: width(30)),
            child: cancleView,
          ),
        )*/
      ],
    );
  }
}
