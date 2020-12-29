
import 'package:HBit/pages/c2c/model/BankBindDetail_model.dart';
import 'package:HBit/pages/c2c/model/C2cCoins_model.dart';
import 'package:HBit/pages/c2c/model/C2cCurrency_model.dart';
import 'package:HBit/pages/c2c/model/c2cOrderlDetail_model.dart';
import 'package:HBit/pages/c2c/server/index.dart';
import 'package:HBit/providers/view_state_model.dart';
import 'package:HBit/pages/c2c/model/buyDetail_model.dart';
import 'package:HBit/pages/c2c/model/sellDetail_model.dart';

class C2cProvider extends ViewStateModel {
  List<C2cCoinsModel> paymentInfo;
  List<C2cCurrencyModel> c2cCurrencyModel;
  BuyDetailModel buyDetailModel;
  SellDetailModel sellDetailModel;
  c2cOrderlDetailModel C2cOrderlDetailModel;
  List<BankBindDetailModel> bankBindDetailModel;
  void setCoinsList(List<C2cCoinsModel> params) {
    paymentInfo = params;
    print("paymentInfo $paymentInfo");
    notifyListeners();
  }
  void getCoinsList() async {
    setBusy();
    try {
      var res = await C2cServer.getCoinsList();
      setCoinsList(res);
      setIdle();

    } catch (e, s) {
      setError(e, s);
    }
  }

  void setC2cCurrencyList(List<C2cCurrencyModel> params) {
    c2cCurrencyModel = params;
    print("c2cCurrencyModel $c2cCurrencyModel");
    notifyListeners();
  }
  void getC2cCurrencyList() async {
    setBusy();
    try {
      var res = await C2cServer.getC2cCurrency();
      setC2cCurrencyList(res);
      setIdle();

    } catch (e, s) {
      setError(e, s);
    }
  }
  void setC2cOrderDetail(c2cOrderlDetailModel params) {
    C2cOrderlDetailModel = params;
    print("c2cOrderlDetailModel $C2cOrderlDetailModel");
    notifyListeners();
  }
  void getC2cOrderDetail(id,) async {
    setBusy();
    try {
      var res = await C2cServer.getOrderDetail(id);
      setC2cOrderDetail(res);
      setIdle();

    } catch (e, s) {
      setError(e, s);
    }
  }
  void getPaymentBindDetail(id,) async {
    setBusy();
    try {
      var res = await C2cServer.getPaymentBindDetail(id);
      bankBindDetailModel=res;
      setIdle();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  void getbuyDetail( id,number,currency) async {
    setBusy();
    try {
      BuyDetailModel data = await C2cServer.getbuyDetail(id,number,currency);
      buyDetailModel = data;
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }
  void getsellerDetail(id,number,currency,password) async {
    setBusy();
    try {
      SellDetailModel data = await C2cServer.getsellerDetail(id,number,currency,password);
      sellDetailModel = data;
      setIdle();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }
}