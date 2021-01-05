import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/pages/mine/routes/index.dart';
import 'package:HBit/providers/provider_widget.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VertifyStatusPage extends StatefulWidget {
  VertifyStatusPage({Key key}) : super(key: key);

  @override
  _VertifyStatusPageState createState() => _VertifyStatusPageState();
}

class _VertifyStatusPageState extends State<VertifyStatusPage> {
  final _countryCtr = TextEditingController();
  final FocusNode _countryFocus = FocusNode();
  final _nameCtr = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final _numberCtr = TextEditingController();
  final FocusNode _numberFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        centerTitle: true,
        title: Text(Tr.of(context).authentication),
        elevation: 1,
        leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Routers.goBack(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png', width: width(22), height: height(36)),
            )),
      ),
      body: ProviderWidget<MineProvider>(
        model: MineProvider(),
        onModelReady: (model) => model.getKycInfo(),
        builder: (BuildContext context, MineProvider model, Widget child) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: width(40), vertical: height(40)),
            child: Column(children: <Widget>[
              model.isBusy
                  ? SizedBox(
                      height: width(110),
                      child: CupertinoActivityIndicator(),
                    )
                  : model.isIdle
                      ? Image.asset(
                          model.kycInfo?.kycStatus == 1
                              ? 'images/mine/pass.png'
                              : model.kycInfo?.kycStatus == 2 ? 'images/mine/review.png' : 'images/mine/fail.png',
                          fit: BoxFit.fill,
                          height: width(140))
                      : SizedBox(),
              SizedBox(height: height(20)),
              InputWidget(
                maxHeight: 100,
                textAlign: TextAlign.right,
                focusNode: _countryFocus,
                onTab: () {},
                controller: _countryCtr,
                prefixIconConstraintsMaxWidth: 200,
                prefixIconConstraintsMinWidth: 160,
                prefixIconConstraintsMinHeight: 50,
                prefixIconConstraintsMaxHeight: 50,
                readOnly: true,
                contentPadding: EdgeInsets.only(top: height(5)),
                hintText: model.kycInfo?.kycInfo?.country ?? '--',
                hintStyle: TextStyle(color: Color(0xff323232), fontSize: sp(28)),
                prefixIcon: Container(child: Text(Tr.of(context).area, style: TextStyle(color: Colors.black))),
              ),
              InputWidget(
                maxHeight: 100,
                textAlign: TextAlign.left,
                focusNode: _nameFocus,
                readOnly: true,
                hintText: Utils.hiddenMiddle(model.kycInfo?.kycInfo?.name ?? '--', 0, 1) ?? '--',
                controller: _nameCtr,
                prefixIconConstraintsMaxWidth: 100,
                prefixIconConstraintsMinWidth: 100,
                prefixIconConstraintsMinHeight: 50,
                prefixIconConstraintsMaxHeight: 50,
                contentPadding: EdgeInsets.symmetric(vertical: width(0)),
                hintStyle: TextStyle(color: Color(0xff323232), fontSize: sp(28)),
                prefixIcon: Container(child: Text('${Tr.of(context).name}：', style: TextStyle(color: Colors.black))),
              ),
              InputWidget(
                maxHeight: 100,
                readOnly: true,
                textAlign: TextAlign.left,
                focusNode: _numberFocus,
                hintText: model.kycInfo?.kycInfo?.passportId ?? '--',
                //hintText: Utils.hiddenMiddle(model.kycInfo?.kycInfo?.passportId, 4, 5),
                controller: _numberCtr,
                prefixIconConstraintsMaxWidth: 150,
                prefixIconConstraintsMinWidth: 150,
                prefixIconConstraintsMinHeight: 50,
                prefixIconConstraintsMaxHeight: 50,
                contentPadding: EdgeInsets.symmetric(vertical: width(4)),
                hintStyle: TextStyle(color: Color(0xff323232), fontSize: sp(28)),
                prefixIcon: Container(child: Text('${Tr.of(context).IDNumber}：', style: TextStyle(color: Colors.black))),
              ),
             Visibility(child:  MyButton(
               text: Tr.of(context).CertificationAgain,
               onPressed: () => Routers.push(context, MineRouter.auth1),

            ),visible: model.kycInfo?.kycStatus != 1&&model.kycInfo?.kycStatus != 2,)
         // ),visible: true)
            ]),
          );
        },
      ),
    );
  }
}
