import 'package:HBit/core/network/http.dart';
import 'package:HBit/pages/wallet/model/Lockup_config_model.dart';
import 'package:HBit/pages/wallet/model/MiningList_model.dart';
import 'package:HBit/pages/wallet/model/assets_preview_model.dart';
import 'package:HBit/pages/wallet/model/bibi_recored_model.dart';
import 'package:HBit/pages/wallet/model/coin_info_model.dart';
import 'package:HBit/pages/wallet/model/record_contract.dart';

class WalletServer {
  static Future getBibiAsset() async {
    var res = await http.get('/api/account/top');
    return AssetPreviewModel.fromJson(res.data['data']);
  }

  static Future<List<CoinInfoModel>> getCoinList(coinName) async {
    var res = await http.get('/api/account', queryParameters: {"coin_name": coinName});
    return (res.data['data'] as List).map((e) => CoinInfoModel.fromJson(e)).toList();
  }

  static Future<List<LockupConfigModel>> getConfigList(id) async {
    var res = await http.get('/api/mining/config_list', queryParameters: {"coin_id": id});
    return (res.data['data'] as List).map((e) => LockupConfigModel.fromJson(e)).toList();
  }

  static Future whitdraw(Map data) async {
    var res = await http.post('/api/account/withdraw', data: data);
    return res.data;
  }

  static Future transfer(data) async {
    var res = await http.post('/api/account/transfer', data: data);
    return res.data;
  }
  static Future ConfirmLockup(data) async {

    var res = await http.post('/api/mining/purchase', data: data);
    return res.data;
  }

  static Future<List<BibiRecored>> bibiRecord(data) async {
    var res = await http.get('/api/account/capitalflow', queryParameters: data);
    return (res.data['data'] as List).map((e) => BibiRecored.fromJson(e)).toList();
  }
  static Future<List<MiningListModel>> miningList(data) async {
    var res = await http.get('/api/mining/list', queryParameters: data);
    return (res.data['data'] as List).map((e) => MiningListModel.fromJson(e)).toList();
  }

  static Future activeContract() async {
    var res = await http.post('/api/account/active_contract');
    return res.data;
  }
}
