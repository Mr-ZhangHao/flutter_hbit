import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:HBit/common/Kline/example/kline_data_model.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/config/global_config.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsuper/fsuper.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_k_chart/entity/k_line_entity.dart';
import 'package:flutter_k_chart/flutter_k_chart.dart';
import 'package:flutter_k_chart/k_chart_widget.dart';
class KlineWidget extends StatefulWidget {
  final String coinId;

  const KlineWidget({Key key, this.coinId}) : super(key: key);

  @override
  _KlineWidgetState createState() => _KlineWidgetState();
}

class _KlineWidgetState extends State<KlineWidget> {
  List<KLineEntity> kLinelist = [];
  MainState _mainState = MainState.MA;
  VolState _volState = VolState.VOL;
  SecondaryState _secondaryState = SecondaryState.MACD;
  Timer timer;
  String period = '5min';
  bool showLoading = false;

  String moreName = "更多";
  bool selectMore = false;
  bool selectSDT = false;
  bool selectZb = false;

  @override
  void initState() {
    super.initState();
    _getData();
    if (GlobalConfig.isTimer) {
      timer = Timer.periodic(Duration(seconds: 2), (timer) {
        _getLast();
      });
    } else {
      _getLast();
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    moreName=Tr.of(context).klineMore;
    return Column(
      children: <Widget>[
        SizedBox(
          height: height(10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          //交叉轴的布局方式，对于column来说就是水平方向的布局方式
          crossAxisAlignment: CrossAxisAlignment.center,
          //就是字child的垂直布局方向，向上还是向下
          verticalDirection: VerticalDirection.down,

          children: <Widget>[
            _periodBtn('1${Tr.of(context).klineMinute}', '1min', false),
            _periodBtn('5${Tr.of(context).klineMinute}', '5min', false),
            _periodBtn('1${Tr.of(context).klineDay}', '1day', false),
            FSuper(
              backgroundColor: selectMore || "${Tr.of(context).klineMore}" != moreName ? Color(0xFF1A4AB6) : Colors.transparent,
              corner: Corner.all(width(8)),
              text: moreName,
              textSize: sp(24),
              textColor: Colors.white,
              width: width(98),
              padding: EdgeInsets.symmetric(vertical: height(2)),
              onClick: () {
                selectZb = false;
                selectMore = !selectMore;
                setState(() {});
              },
            ),
            FSuper(
              backgroundColor: selectZb ? Color(0xFF1A4AB6) : Colors.transparent,
              corner: Corner.all(width(8)),
              text: "${Tr.of(context).klineIndex}",
              textSize: sp(24),
              textColor: Colors.white,
              width: width(98),
              padding: EdgeInsets.symmetric(vertical: height(2)),
              onClick: () {
                selectMore = false;
                selectZb = !selectZb;
                setState(() {});
              },
            ),
          ],
        ),
        SizedBox(
          height: height(10),
        ),
        _widgetSecond(),
        SizedBox(
          height: height(10),
        ),
        Stack(
          children: <Widget>[
            Container(
              height: height(700),
              child: KChartWidget(
                kLinelist,
                isLine: period == null,
                mainState: _mainState,
                secondaryState: _secondaryState,
                volState: _volState,
                fractionDigits: 6,
              ),
            ),
            if (showLoading)
              Container(
                  width: double.infinity, height: 450, alignment: Alignment.center, child: CircularProgressIndicator()),
          ],
        )
      ],
    );
  }

  _widgetSecond() {
    if (selectMore) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          _periodBtn(Tr.of(context).klineMinute, null, true),
          _periodBtn('15${Tr.of(context).klineMinute}', '15min', true),
          _periodBtn('30${Tr.of(context).klineMinute}', '30min', true),
          _periodBtn('1${Tr.of(context).klineHour}', '60min', true),
        ],
      );
    }
    if (selectZb) {
      return Column(
        children: <Widget>[
          SizedBox(height: height(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            //交叉轴的布局方式，对于column来说就是水平方向的布局方式
            crossAxisAlignment: CrossAxisAlignment.center,

            //就是字child的垂直布局方向，向上还是向下
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(width: width(20)),
              Container(width: width(80), child: Text("${Tr.of(context).klineMain}", style: TextStyle(color: Colors.white))),
              SizedBox(width: width(20)),
              _zbBtnMain("MA", MainState.MA),
              SizedBox(width: width(20)),
              _zbBtnMain("BOLL", MainState.BOLL),
              SizedBox(width: width(20)),
              Spacer(),
              _zbBtnMain("${Tr.of(context).klineHide}", MainState.NONE),
            ],
          ),
          SizedBox(
            height: height(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(width: width(20)),
              Container(width: width(80), child: Text("${Tr.of(context).klineSide}1", style: TextStyle(color: Colors.white))),
              SizedBox(width: width(20)),
              _zbBtnVol("VOL", VolState.VOL),
              SizedBox(width: width(20)),
              Spacer(),
              _zbBtnVol("${Tr.of(context).klineHide}", VolState.NONE),
            ],
          ),
          SizedBox(
            height: height(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(width: width(20)),
              Container(width: width(80), child: Text("${Tr.of(context).klineSide}2", style: TextStyle(color: Colors.white))),
              SizedBox(width: width(20)),
              _zbBtnSecond("MACD", SecondaryState.MACD),
              SizedBox(width: width(20)),
              _zbBtnSecond("KDJ", SecondaryState.KDJ),
              SizedBox(width: width(20)),
              _zbBtnSecond("RSI", SecondaryState.RSI),
              SizedBox(width: width(20)),
              _zbBtnSecond("WR", SecondaryState.WR),
              Spacer(),
              _zbBtnSecond("${Tr.of(context).klineHide}", SecondaryState.NONE),
            ],
          ),
        ],
      );
    }
    return SizedBox(
      height: height(0),
    );
  }

  _periodBtn(String msg, String times, bool isChangeMore) {
    return FSuper(
      backgroundColor: period == times ? Color(0xFF1A4AB6) : Colors.transparent,
      corner: Corner.all(width(8)),
      text: msg,
      textSize: sp(24),
      textColor: Colors.white,
      width: width(98),
      padding: EdgeInsets.symmetric(vertical: height(2)),
      onClick: () {
        moreName = isChangeMore ? msg : "${Tr.of(context).klineMore}";
        selectMore = false;
        if (period != times) {
          kLinelist = [];
        }
        period = times;
        setState(() {});
        _getData();
      },
    );
  }

  _zbBtnMain(String msg, MainState mainState) {
    return FSuper(
      corner: Corner.all(width(8)),
      text: msg,
      textAlign: TextAlign.left,
      textSize: sp(24),
      textColor: mainState == _mainState ? Color(0xFF1A4AB6) : Colors.white,
      width: width(98),
      padding: EdgeInsets.symmetric(vertical: height(2)),
      onClick: () {
        _mainState = mainState;
        setState(() {});
        _getData();
      },
    );
  }

  _zbBtnVol(String msg, VolState volState) {
    return FSuper(
      corner: Corner.all(width(8)),
      text: msg,
      textAlign: TextAlign.left,
      textSize: sp(24),
      textColor: volState == _volState ? Color(0xFF1A4AB6) : Colors.white,
      width: width(98),
      padding: EdgeInsets.symmetric(vertical: height(2)),
      onClick: () {
        _volState = volState;
        setState(() {});
        _getData();
      },
    );
  }

  _zbBtnSecond(String msg, SecondaryState secondaryState) {
    return FSuper(
      corner: Corner.all(width(8)),
      text: msg,
      textAlign: TextAlign.left,
      textSize: sp(24),
      textColor: _secondaryState == secondaryState ? Color(0xFF1A4AB6) : Colors.white,
      width: width(98),
      padding: EdgeInsets.symmetric(vertical: height(2)),
      onClick: () {
        _secondaryState = secondaryState;
        setState(() {});
        _getData();
      },
    );
  }

  _getData() async {
    showLoading = true;
    setState(() {});

    int endTime = new DateTime.now().millisecondsSinceEpoch;
    print(endTime);
    String result = await getIPAddress(endTime.toString());
    final parseJson = json.decode(result);
    print(parseJson);
    List<MarketData> marketData = parseJson['data'].map<MarketData>((item) => MarketData.fromJson(item)).toList();
    kLinelist = marketData
        .map((item) => KLineEntity(
            open: (item.open as num).toDouble(),
            high: (item.high as num).toDouble(),
            low: (item.low as num).toDouble(),
            close: (item.close as num).toDouble(),
            vol: (item.volume as num).toDouble(),
            id: item.time ~/ 1000))
        .toList();

    DataUtil.calculate(kLinelist);
    showLoading = false;
    setState(() {});

    _getLast();
  }

  _getLast() async {
    String result = await getLastKline();
    final parseJson = json.decode(result);

    List<MarketData> list = parseJson['data'].map<MarketData>((item) => MarketData.fromJson(item)).toList();

    if (list.length > 0) {
      MarketData item = list[0];
      KLineEntity kLineEntity = KLineEntity(
          open: (item.open as num).toDouble(),
          high: (item.high as num).toDouble(),
          low: (item.low as num).toDouble(),
          close: (item.close as num).toDouble(),
          vol: (item.volume as num).toDouble(),
          id: item.time ~/ 1000);

      if (kLinelist.last.id == kLineEntity.id) {
        kLinelist.last.close = kLineEntity.close;
        kLinelist.last.high = max(kLinelist.last.high, kLineEntity.high);
        kLinelist.last.low = min(kLinelist.last.low, kLineEntity.low);
        kLinelist.last.vol = kLineEntity.vol;
        DataUtil.updateLastData(kLinelist);
      } else {
        DataUtil.addLastData(kLinelist, kLineEntity);
      }
      setState(() {});
    }
  }

  Future<String> getIPAddress(String time) async {
    var url = GlobalConfig.apiHost2 +
        "/api/market/kline?symbol=${widget.coinId}&period=${period ?? '5min'}&limit=200&from=${time}";
    print(url);
    String result;
    var response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      result = response.body;
    } else {
      print('Failed getting IP address');
    }
    return result;
  }

  Future<String> getLastKline() async {
    var url = GlobalConfig.apiHost2 + "/api/market/lastKline?symbol=${widget.coinId}&period=${period ?? '5min'}";
    String result;
    var response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      result = response.body;
    } else {
      print('Failed lastKline');
    }
    return result;
  }
}
