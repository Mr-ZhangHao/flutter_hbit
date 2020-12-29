/*
* @message: 登录
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 12:08:38
* @LastEditors: Jack
* @LastEditTime: 2020-08-13 16:52:53
* @Deprecated: 否
* @FilePath: /archimedes/lib/pages/mine/views/account.dart
*/
import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/pages/wallet/server/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'hide Router;

import 'package:HBit/utils/screen.dart';
import 'package:HBit/constants/index.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class ContractPage extends StatefulWidget {
  ContractPage({Key key}) : super(key: key);

  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<ContractPage> {
  bool isAgree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png', width: width(22), height: height(36)),
            ),
          ),
          brightness: Brightness.light,
          title: Text(
            '${Tr.of(context).ContractAgreementTitle}',
            style: TextStyle(color: kTextColor3, fontSize: sp(32)),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width(40), vertical: height(88)),
            child: Column(
              children: <Widget>[
                Container(
                  child: Html(
                    data: """
                  <div class="content">
                      <h4>1.${Tr.of(context).ContractAgreementTitle2}</h4>
                      <p>
                        ${Tr.of(context).ContractAgreement1}
                        <br />${Tr.of(context).ContractAgreement2}
                      </p>
                      <h4>${Tr.of(context).ContractAgreement3}</h4>
                      <p>
                        ${Tr.of(context).ContractAgreement4}
                        <br />${Tr.of(context).ContractAgreement5}
                        <br />${Tr.of(context).ContractAgreement6}
                        <br />${Tr.of(context).ContractAgreement7}
                        <br />${Tr.of(context).ContractAgreement8}
                        <br />${Tr.of(context).ContractAgreement9}
                        <br />${Tr.of(context).ContractAgreement10}
                        <br />${Tr.of(context).ContractAgreement11}
                        <br />${Tr.of(context).ContractAgreement12}
                        <br />${Tr.of(context).ContractAgreement13}
                      </p>
                      <h4>${Tr.of(context).ContractAgreement14}</h4>
                      <p>
                        ${Tr.of(context).ContractAgreement15}。
                        <br />${Tr.of(context).ContractAgreement16}
                        <br />${Tr.of(context).ContractAgreement17}
                        <br />${Tr.of(context).ContractAgreement18}
                        <br />${Tr.of(context).ContractAgreement19}
                         <br />${Tr.of(context).ContractAgreement20}
                      </p>
                      <h4>${Tr.of(context).ContractAgreement21}</h4>
                      <p>
                        ${Tr.of(context).ContractAgreement22}
                        <br />${Tr.of(context).ContractAgreement23}
                        <br />${Tr.of(context).ContractAgreement24}
                        <br />${Tr.of(context).ContractAgreement25}
                        <br />${Tr.of(context).ContractAgreement26}
                          <br />${Tr.of(context).ContractAgreement27}
                      </p>
                      <h4>${Tr.of(context).ContractAgreement28}</h4>
                      <p>
                        ${Tr.of(context).ContractAgreement29}
                        <br />${Tr.of(context).ContractAgreement30}
                        <br />${Tr.of(context).ContractAgreement31}
                        <br />${Tr.of(context).ContractAgreement32}
                        <br />${Tr.of(context).ContractAgreement33}
                        <br />${Tr.of(context).ContractAgreement34}
                        <br />${Tr.of(context).ContractAgreement35}
                        <br />${Tr.of(context).ContractAgreement36}
                        <br />${Tr.of(context).ContractAgreement37}
                        <br />${Tr.of(context).ContractAgreement38}
                        <br />${Tr.of(context).ContractAgreement39}
                        <br />${Tr.of(context).ContractAgreement40}
                        <br />${Tr.of(context).ContractAgreement41}
                        <br />${Tr.of(context).ContractAgreement42}
                        <br />${Tr.of(context).ContractAgreement43}
                        <br />${Tr.of(context).ContractAgreement44}
                        <br />${Tr.of(context).ContractAgreement45}
                        <br />${Tr.of(context).ContractAgreement46}
                        <br />${Tr.of(context).ContractAgreement47}
                        <br />${Tr.of(context).ContractAgreement48}
                        <br />${Tr.of(context).ContractAgreement49}
                      </p>
                      <h4>${Tr.of(context).ContractAgreement50}</h4>
                      <p>
                        ${Tr.of(context).ContractAgreement51}
                        <br />${Tr.of(context).ContractAgreement52}
                         </p>
                      <h4>${Tr.of(context).ContractAgreement53}</h4>
                      <p>
                       ${Tr.of(context).ContractAgreement54}
                       <br />${Tr.of(context).ContractAgreement55}
                       <br />${Tr.of(context).ContractAgreement56}
                        <br />${Tr.of(context).ContractAgreement57}
                        <br />${Tr.of(context).ContractAgreement58}
                        <br />${Tr.of(context).ContractAgreement59}
                        <br />${Tr.of(context).ContractAgreement60}
                        <br />${Tr.of(context).ContractAgreement61}
                      </p>
                    </div>
                  """,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Checkbox(onChanged: (bool value) => setState(() => isAgree = value), value: isAgree),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: height(14)),
                      child: Text("我已阅读并同意", style: TextStyle(fontSize: sp(28), height: 1.1)),
                    ),
                  ],
                ),
                Container(
                  child: MyButton(
                    text: '确定',
                    onPressed: isAgree ? () => _confirm() : null,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _confirm() async {
    if (!isAgree) {
      Toast.showText('请认真阅读协议并且勾选下方按钮');
    } else {
      Toast.showLoading('loading...');
      await WalletServer.activeContract();
      Provider.of<MineProvider>(context, listen: false).getUserInfo();
      Routers.goBackWithParams(context, true);
    }
  }
}
