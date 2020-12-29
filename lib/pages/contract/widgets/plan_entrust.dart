/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-09-03 17:35:11
* @LastEditors: Roy
* @LastEditTime: 2020-09-15 10:01:21
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/contract/widgets/plan_entrust.dart
*/
import 'package:HBit/pages/contract/provider/contract_provider.dart';
import 'package:HBit/pages/contract/widgets/market/contract_left.dart';
import 'package:HBit/pages/contract/widgets/market/contract_right.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

/// 计划委托
class PlanEntrustWidget extends StatefulWidget {
  const PlanEntrustWidget({
    Key key,
  }) : super(key: key);

  @override
  _PlanEntrustWidgetState createState() => _PlanEntrustWidgetState();
}

class _PlanEntrustWidgetState extends State<PlanEntrustWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: width(24)),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ContractLeft(planType: PlanType.entrust),
                  ContractRight(model2: ContractOrderProvider()),
                ],
              ),
            ],
          )),
    );
  }
}
