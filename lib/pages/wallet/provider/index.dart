import 'package:HBit/pages/wallet/model/assets_preview_model.dart';
import 'package:HBit/pages/wallet/model/coin_info_model.dart';
import 'package:HBit/pages/wallet/model/contract_assets_model.dart';
import 'package:HBit/pages/wallet/model/equity_model.dart';
import 'package:HBit/pages/wallet/server/contract.dart';
import 'package:HBit/pages/wallet/server/index.dart';
import 'package:HBit/providers/view_state_model.dart';

// Routers.push(context, WalletRouter.verification)

class WithdrawField {
  String coinId;
  String chainName;
  String address;
  String number;
  String coinName;
  int tfaType;
  WithdrawField(this.coinId, this.chainName, this.address, this.number, this.tfaType, this.coinName);
}

class WallerProvider extends ViewStateModel {
  bool isOpen = true;
  AssetPreviewModel assetPreview;
  List<CoinInfoModel> coinInfoList = [];

  CoinInfoModel currentCoin;

  WithdrawField withdrawField = WithdrawField('', '', '', '', 0, '');

  bool isHidden = false;

  setIsHidden(bool param) {
    isHidden = param;
    notifyListeners();
  }

  setIsOpen(bool param) {
    isOpen = param;
    notifyListeners();
  }

  setCurrentCoin(coinName) {
    currentCoin = coinInfoList.singleWhere((item) => item.coin.name == coinName);
    notifyListeners();
  }

  void setWithdrawField(WithdrawField params) {
    withdrawField = params;
    notifyListeners();
  }

  void getBibiAsset() async {
    AssetPreviewModel data = await WalletServer.getBibiAsset();
    assetPreview = data;
    notifyListeners();
  }

  void getCoinList({coinName}) async {
    List<CoinInfoModel> data = await WalletServer.getCoinList('');
    coinInfoList = data;
    currentCoin = coinInfoList.singleWhere((item) => item.coin.name == (coinName ?? 'USDT'));

    notifyListeners();
  }

  void getCurrentCoin(coinName) async {
    List<CoinInfoModel> data = await WalletServer.getCoinList(coinName);
    currentCoin = data[0];
    notifyListeners();
  }
}

class ContractAssetProvider extends ViewStateModel {
  bool isOpen = true;
  bool isHidden = false;
  ContractAssetsModel contractWalletInfo;
  List<ContractAssets> contractAssets = [];
  List<EquityModel> equityList = [];

  ContractAssets currentCoin;

  setCurrentCoin(coinName) {
    currentCoin = contractWalletInfo.exAssets.singleWhere((item) => item.coinName.toUpperCase() == coinName);
    notifyListeners();
  }

  setIsOpen(bool param) {
    isOpen = param;
    notifyListeners();
  }

  setIsHidden(bool param) {
    isHidden = param;
    notifyListeners();
  }

  void getContractAsset({coinName}) async {
    contractWalletInfo = await ContractWalletServer.getContractAsset();
    contractAssets = contractWalletInfo.exAssets;
    currentCoin =
        contractWalletInfo.exAssets.singleWhere((item) => item.coinName.toUpperCase() == (coinName ?? 'USDT'));
    notifyListeners();
  }

  void getEquity() async {
    List<EquityModel> list = await ContractWalletServer.getEquity();
    equityList = list;
    notifyListeners();
  }
}
