import 'dart:async';

import 'package:HBit/config/global_config.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/pages/wallet/model/equity_model.dart';
import 'package:HBit/pages/wallet/provider/index.dart';
import 'package:HBit/pages/wallet/widgets/common/contract_card.dart';
import 'package:HBit/pages/wallet/widgets/common/contract_coin_item.dart';
import 'package:HBit/pages/wallet/widgets/common/search_coin_bar.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/contract_coin_item2.dart';

class ContractBody extends StatefulWidget {
  const ContractBody({
    Key key,
  }) : super(key: key);

  @override
  _ContractBodyState createState() => _ContractBodyState();
}

class _ContractBodyState extends State<ContractBody> {
  @override
  void initState() {
    super.initState();
    ContractAssetProvider model = Provider.of<ContractAssetProvider>(context, listen: false);
    if (GlobalConfig.isTimer) {
      timer = Timer.periodic(Duration(seconds: 30), (timer) {
        model.getContractAsset();
        model.getEquity();
      });
    } else {
      model.getContractAsset();
      model.getEquity();
    }
  }

  Timer timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<WallerProvider, ContractAssetProvider, MineProvider>(builder:
        (BuildContext context, WallerProvider model1, ContractAssetProvider model2, MineProvider model3, Widget child) {
      return Column(
        children: <Widget>[
          model3.userInfo.contractWwitch == 1
              ? ContractCardWidget2(model1: model1, model2: model2)
              : ContractCardWidget(),
          SearchCoinBarWidget(),
          SizedBox(height: width(20)),
          Expanded(
            child: ListView.builder(
              itemCount: (model2.equityList?.length ?? 0) + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Visibility(
                    // visible: !(model2.contractAssets[0].available == 0 && model2.isHidden),
                    visible: true,
                    child: ContractCoinItem(model: model2.contractAssets[0]),
                  );
                } else {
                  EquityModel model = model2.equityList[index - 1];
                  return Visibility(
                    visible: !(model.profits == 0 && model2.isHidden),
                    child: ContractCoinItem2(model: model),
                  );
                }
              },
            ),
          )
        ],
      );
    });
  }
}
