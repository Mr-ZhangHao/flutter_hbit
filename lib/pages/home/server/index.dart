import 'package:HBit/core/network/http.dart';
import 'package:HBit/pages/home/model/banner_model.dart';
import 'package:HBit/pages/home/model/recommend_market_model.dart';
import 'package:HBit/pages/home/model/search_coin_model.dart';

class HomeServer {
  static Future<List<BannerModel>> getBanner() async {
    var res = await http.get('/api/home/banner');
    return (res.data['data'] as List).map((e) => BannerModel.fromJson(e)).toList();
  }

  static Future getNotices() async {
    var res = await http.get('/api/home/notice');
    return res.data;
  }

  static Future<List<RecommendMarketModel>> getRecommendMarket() async {
    var res = await http.get('/api/home/recommendSymbol');
    return (res.data['data'] as List).map((e) => RecommendMarketModel.fromJson(e)).toList();
  }

  static Future<List<String>> getHotCoin() async {
    var res = await http.get('/api/spot/hot_coin');
    return (res.data['data'] as List).map((e) => e.toString()).toList();
  }

  static Future<List<SearchCoinModel>> searchCoin(String coinName) async {
    var res = await http.get('/api/spot/currencies', queryParameters: {"coin_name": coinName});
    return (res.data['data'] as List).map((e) => SearchCoinModel.fromJson(e)).toList();
  }


}
