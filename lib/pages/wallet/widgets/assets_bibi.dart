import 'package:HBit/pages/wallet/provider/index.dart';
import 'package:HBit/pages/wallet/widgets/common/bibi_card.dart';
import 'package:HBit/pages/wallet/widgets/common/coin_list_item.dart';
import 'package:HBit/pages/wallet/widgets/common/search_coin_bar.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BibiBody extends StatefulWidget {
  const BibiBody({
    Key key,
  }) : super(key: key);

  @override
  _BibiBodyState createState() => _BibiBodyState();
}

class _BibiBodyState extends State<BibiBody> {
  @override
  void initState() {
    super.initState();
    WallerProvider model1 = Provider.of<WallerProvider>(context, listen: false);
    ContractAssetProvider model2 = Provider.of<ContractAssetProvider>(context, listen: false);
    model1.getBibiAsset();
    model1.getCoinList();
    model2.getContractAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<WallerProvider, ContractAssetProvider>(
      builder: (BuildContext context, WallerProvider model1, ContractAssetProvider model2, Widget child) {
        return Column(
          children: <Widget>[
            BibiCardWidget(model: model1),
            SearchCoinBarWidget(),
            SizedBox(height: width(20)),
            Expanded(
              child: ListView.builder(
                itemCount: model1.coinInfoList?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Visibility(
                    visible: !(num.parse(model1.coinInfoList[index].available) == 0 && model1.isHidden),
                    child: CoinListItemWidget(model: model1.coinInfoList[index]),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
