/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 23:09:08
* @LastEditors: Roy
* @LastEditTime: 2020-09-15 10:58:33
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/views/identity_auth1.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/pages/login/routes/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/pages/mine/routes/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IdentityAuth1Page extends StatefulWidget {
  IdentityAuth1Page({Key key}) : super(key: key);

  @override
  _IdentityAuth1PageState createState() => _IdentityAuth1PageState();
}

class _IdentityAuth1PageState extends State<IdentityAuth1Page> {
  final _idTypeCtr = TextEditingController();
  final FocusNode _idTypeFocus = FocusNode();
  String _numberStr = '';
  final _lastNameCtr = TextEditingController();
  final FocusNode _lastNameFocus = FocusNode();

  final _firstNameCtr = TextEditingController();
  final FocusNode _firstNameFocus = FocusNode();
  final _numberCtr = TextEditingController();
  final FocusNode _numberFocus = FocusNode();

  final _countryCtr = TextEditingController();
  final FocusNode _countryFocus = FocusNode();

  int type = 1;
  String area = '86';
  String area_name = '台湾';
  String area_name_us = 'Taiwan';
  List<Map<String, dynamic>> typeList = [
    {"name": '身份证', "id": 0},
    {"name": '护照', "id": 1},
    // {"name": '其他证件', "id": 2},
  ];

  @override
  void initState() {
    _numberCtr.addListener(() => setState(() => _numberStr = _idTypeCtr.text));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    typeList = [
      {"name": '${Tr.of(context).IDCard}', "id": 0},
      {"name": '${Tr.of(context).Passport}', "id": 1},
      // {"name": '其他证件', "id": 2},
    ];


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(Tr.of(context).authentication),
        centerTitle: true,
        elevation: 1,
        leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Routers.goBack(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png', width: width(22), height: height(36)),
            )),
      ),
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width(40)),
          child: Column(
            children: <Widget>[
              FocusWidget(
                focusNode: _countryFocus,
                child: InputWidget(
                  maxHeight: 100,
                  textAlign: TextAlign.right,
                  focusNode: _countryFocus,
                  onTab: () {
                    Navigator.pushNamed(context, LoginRouter.country)
                        .then(( value) {
                      List  myList =value;
                      setState(() {
                        area_name = myList[0];
                        area = myList[1];
                        area_name_us = myList[2];
                      });

                    });
                  },
                  controller: _countryCtr,
                  prefixIconConstraintsMaxWidth: 250,
                  prefixIconConstraintsMinWidth: 150,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  suffixIconConstraintsMaxHeight: 50,
                  suffixIconConstraintsMaxWidth: 450,
                  suffixIconConstraintsMinHeight: 50,
                  suffixIconConstraintsMinWidth: 150,
                  readOnly: true,
                  suffixIcon: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                      //  Text(Tr.of(context).ChinaMainland),
                        Text('${area_name_us}',style: TextStyle(fontSize: sp(26)),),
                        SizedBox(width: width(10)),
                        Image.asset(
                          'images/mine/next.png',
                          width: width(18),
                          color: Color(0xff323232),
                        ),
                      ],
                    ),
                  ),
                  contentPadding: EdgeInsets.only(top: height(5)),
                  hintText: '',
                  prefixIcon: Container(
                    child: Text(
                      Tr.of(context).area,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              FocusWidget(
                focusNode: _lastNameFocus,
                child: InputWidget(
                  maxHeight: 100,
                  textAlign: TextAlign.left,
                  focusNode: _lastNameFocus,
                  hintText: Tr.of(context).inputNameHint,
                  controller: _lastNameCtr,
                  prefixIconConstraintsMaxWidth: 200,
                  prefixIconConstraintsMinWidth: 100,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  contentPadding: EdgeInsets.only(bottom: height(12)),
                  hintStyle: TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text(
                      '${Tr.of(context).LastName}：',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              FocusWidget(
                focusNode: _firstNameFocus,
                child: InputWidget(
                  maxHeight: 100,
                  textAlign: TextAlign.left,
                  focusNode: _firstNameFocus,
                  hintText: Tr.of(context).enterName,
                  controller: _firstNameCtr,
                  prefixIconConstraintsMaxWidth: 200,
                  prefixIconConstraintsMinWidth: 100,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  contentPadding: EdgeInsets.only(bottom: height(12)),
                  hintStyle: TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text(
                      '${Tr.of(context).name}：',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              FocusWidget(
                focusNode: _idTypeFocus,
                child: InputWidget(
                  maxHeight: 100,
                  textAlign: TextAlign.right,
                  focusNode: _idTypeFocus,
                  onTab: () {
                    return showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return IdentityTypeWidget(
                          typeList: typeList,
                          onTab: (index, name) {
                            print(name);
                            setState(() {
                              type = index;
                              print(type);

                            });
                            Routers.goBack(context);
                          },
                        );
                      },
                    );
                  },
                  controller: _idTypeCtr,
                  prefixIconConstraintsMaxWidth: 350,
                  prefixIconConstraintsMinWidth: 150,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  suffixIconConstraintsMaxHeight: 50,
                  suffixIconConstraintsMaxWidth: 250,
                  suffixIconConstraintsMinHeight: 50,
                  suffixIconConstraintsMinWidth: 150,
                  readOnly: true,
                  suffixIcon: Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(typeList[type]['name']),
                        SizedBox(width: width(10)),
                        Image.asset(
                          'images/mine/next.png',
                          width: width(18),
                          color: Color(0xff323232),
                        ),
                      ],
                    ),
                  ),
                  contentPadding: EdgeInsets.only(top: height(5)),
                  hintStyle: TextStyle(color: Color(0xff323232), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text(Tr.of(context).AuthenticationType, style: TextStyle(color: Colors.black)),
                  ),
                  hintText: null,
                ),
              ),
              FocusWidget(
                focusNode: _numberFocus,
                child: InputWidget(
                  maxHeight: 100,
                  textAlign: TextAlign.left,
                  focusNode: _numberFocus,
                  hintText: Tr.of(context).inputIDcard,
                  controller: _numberCtr,
                  prefixIconConstraintsMaxWidth: 240,
                  prefixIconConstraintsMinWidth: 140,
                  prefixIconConstraintsMinHeight: 50,
                  prefixIconConstraintsMaxHeight: 50,
                  suffixIconConstraintsMaxWidth: 28,
                  suffixIconConstraintsMinWidth: 28,
                  suffixIconConstraintsMinHeight: 28,
                  suffixIconConstraintsMaxHeight: 28,
                  contentPadding: EdgeInsets.only(bottom: height(12)),
                  hintStyle: TextStyle(color: Color(0xffCCCCCC), fontSize: sp(28)),
                  prefixIcon: Container(
                    child: Text('${Tr.of(context).IDNumber}：', style: TextStyle(color: Colors.black)),
                  ),
                  suffixIcon: _numberCtr.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            print('object');
                            _numberCtr.text = '';
                            setState(() => _numberStr = '');
                          },
                          child: ImageIcon(AssetImage('images/login/x.png'), color: Color(0xffBFBFBF)),
                        )
                      : SizedBox(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height(80)),
                child: MyButton(text: Tr.of(context).Nextstep, onPressed: next),
              )
            ],
          ),
        ),
      ),
    );
  }

  void next() {
    if (_lastNameCtr.text.isEmpty) {
      Toast.showText(Tr.of(context).inputNameHint2);
    } else if (_firstNameCtr.text.isEmpty) {
      Toast.showText(Tr.of(context).inputNameHint);
    }/* else if (_numberCtr.text.isEmpty || _numberCtr.text.length < 15 || _numberCtr.text.length > 18) {
      Toast.showText(Tr.of(context).IDNumberHint);
    }*/ else {
      if (type == 0 || type == 2) {
        Provider.of<MineProvider>(context, listen: false).setVertifyFiled(
            VertifyFiled(area_name, _lastNameCtr.text, _firstNameCtr.text, type.toString(), _numberCtr.text));
        Routers.push(context, MineRouter.auth2);
      } else {
        Provider.of<MineProvider>(context, listen: false).setVertifyFiled(
            VertifyFiled(area_name, _lastNameCtr.text, _firstNameCtr.text, type.toString(), _numberCtr.text));
        Routers.push(context, MineRouter.auth3);
      }
    }
  }
}

class IdentityTypeWidget extends StatelessWidget {
  final Function(int type, String name) onTab;
  final List typeList;
  const IdentityTypeWidget({Key key, this.onTab, this.typeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:  BoxConstraints(

        minWidth: 500,

        minHeight: 400,

      ),
      height: height(400),
      child: Column(
        children: <Widget>[
          Column(
              children: typeList
                  .map((e) => GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => {onTab(e['id'], e['name'])},
                        child: Container(
                          decoration:
                              BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: Color(0xffcccccc)))),
                          margin: EdgeInsets.symmetric(horizontal: width(40)),
                          child: Text(e['name']),
                          height: height(100),
                          alignment: Alignment.center,
                        ),
                      ))
                  .toList()),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {Navigator.pop(context)},
            child: Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: Color(0xffcccccc)))),
              margin: EdgeInsets.symmetric(horizontal: width(40)),
              child: Text(Tr.of(context).cancel, style: TextStyle(color: Colors.blue)),
              height: height(100),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
