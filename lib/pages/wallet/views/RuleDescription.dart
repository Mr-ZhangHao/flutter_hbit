import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class RuleDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.center,
            child: Image.asset('images/mine/back@2x.png',
                width: width(22), height: height(36)),
          ),
        ),
        brightness: Brightness.light,
        title: Text(
          '${Tr.of(context).miningRuleDescription}',
          style: TextStyle(color: kTextColor3, fontSize: sp(32)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width(40), vertical: height(88)),
        child: Column(
          children: [
            Table(
              //所有列宽
              columnWidths: const {
                //列宽
                0: FixedColumnWidth(80.0),
                1: FixedColumnWidth(100.0),
                2: FixedColumnWidth(80.0),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              //表格边框样式
              border: TableBorder.all(
                color: Color(0xffEBEBEB),
                width: 2.0,
                style: BorderStyle.solid,
              ),
              children: [
                TableRow(
                    children: [
                      //增加行高
                      Container(
                        alignment: Alignment.center,
                        height: width(80),
                        child: Text('${Tr.of(context).LockupDay}', style: TextStyle(fontSize: sp(28)),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: width(80),
                        child: Text('${Tr.of(context).Claim}', style: TextStyle(fontSize: sp(28)),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: width(80),
                        child: Text('${Tr.of(context).reward}', style: TextStyle(fontSize: sp(28)),),
                      ),
                    ]
                ),
                TableRow(

                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: width(60),
                        child: Text('7${Tr.of(context).klineDay}', style: TextStyle(fontSize: sp(28)),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: width(60),
                        child: Text('1000 ${Tr.of(context).a}', style: TextStyle(fontSize: sp(28)),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: width(60),
                        child: Text('3%', style: TextStyle(fontSize: sp(28)),),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: width(60),
                        child: Text('15${Tr.of(context).klineDay}', style: TextStyle(fontSize: sp(28)),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: width(60),
                        child: Text('5000 ${Tr.of(context).a}', style: TextStyle(fontSize: sp(28)),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: width(60),
                        child: Text('6%', style: TextStyle(fontSize: sp(28)),),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: width(60),
                        child: Text('30${Tr.of(context).klineDay}', style: TextStyle(fontSize: sp(28)),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: width(60),
                        child: Text('10000 ${Tr.of(context).a}', style: TextStyle(fontSize: sp(28)),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: width(60),
                        child: Text('10%', style: TextStyle(fontSize: sp(28)),),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: width(60),
                        child: Text('60${Tr.of(context).klineDay}', style: TextStyle(fontSize: sp(28)),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: width(60),
                        child: Text('200000 ${Tr.of(context).a}', style: TextStyle(fontSize: sp(28)),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: width(60),
                        child: Text('15%', style: TextStyle(fontSize: sp(28)),),
                      ),
                    ]
                ),       TableRow(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: width(60),
                        child: Text('90${Tr.of(context).klineDay}', style: TextStyle(fontSize: sp(28)),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: width(60),
                        child: Text('500000 ${Tr.of(context).a}', style: TextStyle(fontSize: sp(28)),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: width(60),
                        child: Text('20%', style: TextStyle(fontSize: sp(28)),),
                      ),
                    ]
                ),
              ],
            ),
            Container(
              child: Html(
                data: """
                  <div class="content">
                      <h4>'${Tr.of(context).rulesHint}'</h4>
                      <p>
                          ${Tr.of(context).rulesHint2}
                      </p>
                       <p>
                        ${Tr.of(context).rulesHint3}。
                      </p>
                      <p>
                        ${Tr.of(context).rulesHint4} 。
                      </p>     
                      <p>
                        ${Tr.of(context).rulesHint5}。
                      </p>
                      <h4> ${Tr.of(context).rulesHint6}:</h4>
                       <p>
                         ${Tr.of(context).rulesHint7}。
                      </p>
                     <p>
                       ${Tr.of(context).rulesHint8}。
                      </p>                    
                       <p>
                        ${Tr.of(context).rulesHint9}。
                      </p>          
                      <p>
                      ${Tr.of(context).rulesHint10}。
                      </p>
                 </div>
                   """,
              ),
            )
          ],
        ),
      )),
    );
  }
}
