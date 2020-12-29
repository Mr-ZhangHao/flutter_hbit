import 'package:HBit/pages/home/model/banner_model.dart';
import 'package:HBit/pages/home/model/notice_model.dart';
import 'package:HBit/pages/home/model/recommend_market_model.dart';
import 'package:HBit/pages/home/model/recommends_contract_model.dart';
import 'package:HBit/pages/home/server/index.dart';
import 'package:HBit/pages/wallet/server/contract.dart';
import 'package:HBit/providers/view_state_model.dart';
import 'package:HBit/utils/sp_utils.dart';

class HomeProvider extends ViewStateModel {
  List<BannerModel> banner;
  getBanner() async {
    setBusy();
    try {
      List<BannerModel> data = await HomeServer.getBanner();
      banner = data;
      setIdle();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  List<NoticesModel> notices = [];
  getNotices() async {
    setBusy();
    try {
      var res = await HomeServer.getNotices();
      print(res);
      setIdle();
      notices = (res['data'] as List).map((e) => NoticesModel.fromJson(e)).toList();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  List<RecommendMarketModel> recommendsBibi = [];
  List<RecommendsContractModel> recommendsContracts = [];
  void getData() async {
    setBusy();
    try {
      List<RecommendMarketModel> res1 = await HomeServer.getRecommendMarket();
      List<RecommendsContractModel> res2 = await ContractWalletServer.getContracts();
      setIdle();
      recommendsBibi = res1;
      recommendsContracts = res2;
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  List<String> hotCoins = [];
  List<String> historyCoins = [];
  getHistoryCoins() async {
    setBusy();
    try {
      historyCoins = await SpUtils.getStringList('searchHistory');
     // print("historyCoins $historyCoins");
      setIdle();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  getHotCoins() async {
    setBusy();
    try {
      hotCoins = await HomeServer.getHotCoin();
      //print("hotCoins $hotCoins");
      setIdle();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }
}

// class BannerProvider extends ViewStateModel {
//   List<BannerModel> banner;
//   getBanner() async {
//     setBusy();
//     try {
//       List<BannerModel> data = await HomeServer.getBanner();
//       banner = data;
//       setIdle();
//       notifyListeners();
//     } catch (e, s) {
//       setError(e, s);
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }

// class NoticesProvider extends ViewStateModel {
//   List<NoticesModel> notices = [];
//   getNotices() async {
//     setBusy();
//     try {
//       var res = await HomeServer.getNotices();
//       print(res);
//       setIdle();
//       notices = (res['data'] as List).map((e) => NoticesModel.fromJson(e)).toList();
//       notifyListeners();
//     } catch (e, s) {
//       setError(e, s);
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }

// class RecommendMarketProvider extends ViewStateModel {
//   List<RecommendMarketModel> recommendsBibi = [];
//   List<RecommendsContractModel> recommendsContracts = [];
//   void getData() async {
//     setBusy();
//     try {
//       List<RecommendMarketModel> res1 = await HomeServer.getRecommendMarket();
//       List<RecommendsContractModel> res2 = await ContractWalletServer.getContracts();
//       setIdle();
//       recommendsBibi = res1;
//       recommendsContracts = res2;
//       notifyListeners();
//     } catch (e, s) {
//       setError(e, s);
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }
