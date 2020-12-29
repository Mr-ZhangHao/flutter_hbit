import 'package:HBit/core/network/contract_http.dart';
import 'package:HBit/pages/home/model/recommends_contract_model.dart';
import 'package:HBit/pages/wallet/model/contract_assets_model.dart';
import 'package:HBit/pages/wallet/model/equity_model.dart';
import 'package:HBit/pages/wallet/model/record_contract.dart';

class ContractWalletServer {
  static Future<ContractAssetsModel> getContractAsset() async {
    var res = await http.get('/api/account/asset');
    return ContractAssetsModel.fromJson(res.data['data']);
  }

  static Future<List<RecommendsContractModel>> getContracts() async {
    var res = await http.get('/api/market/list', queryParameters: {"type": 1});
    return (res.data['data']['overview'] as List).map((e) => RecommendsContractModel.fromJson(e)).toList();
  }

  static Future<List<EquityModel>> getEquity() async {
    var res = await http.get('/api/account/equity');
    return (res.data['data'] as List).map((e) => EquityModel.fromJson(e)).toList();
  }

  static Future<List<RecordContract>> contractRecord(data) async {
    var res = await http.get('/api/account/financial_log', queryParameters: data);
    return (res.data['data']['data'] as List).map((e) => RecordContract.fromJson(e)).toList();
  }
  
  
}
