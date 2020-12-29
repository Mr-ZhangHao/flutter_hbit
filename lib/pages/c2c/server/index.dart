import 'package:HBit/common/toast/index.dart';
import 'package:HBit/pages/c2c/model/BankBindDetail_model.dart';
import 'package:HBit/pages/c2c/model/C2cCoins_model.dart';
import 'package:HBit/pages/c2c/model/C2cCurrency_model.dart';
import 'package:HBit/pages/c2c/model/C2cList_model.dart';
import 'package:HBit/pages/c2c/model/ContactServer_model.dart';
import 'package:HBit/pages/c2c/model/buyDetail_model.dart';
import 'package:HBit/pages/c2c/model/c2cOrderlDetail_model.dart';
import 'package:HBit/pages/c2c/model/sellDetail_model.dart';
import 'package:HBit/pages/c2c/model/OrderHistoryList_model.dart';
import 'package:HBit/core/network/http.dart';

class C2cServer {

  static Future<List<C2cListModel>> getC2cList(data) async {
    var res = await http.get('/api/c2c/marketBookList', queryParameters: data);
   return (res.data['data'] as List).map((e) => C2cListModel.fromJson(e)).toList();
  }

  static Future<List<OrderHistoryListModel>> getOrderHistory(data) async {
    var res = await http.get('/api/c2c/orderList', queryParameters: data);
    return (res.data['data'] as List).map((e) => OrderHistoryListModel.fromJson(e)).toList();
  }

  static Future<List<C2cCoinsModel>> getCoinsList() async {
    var res = await http.get('/api/c2c/coins');
    return (res.data['data'] as List).map((e) => C2cCoinsModel.fromJson(e)).toList();
  }


  static Future getbuyDetail(id,number,currency) async {
    var data = {
      "id": id,"buy_number": number,"currency": currency,
    };
    var res = await http.post('/api/c2c/doBuyDetail',data: data);
    return res.data['data'];
  }

  static Future<c2cOrderlDetailModel> getOrderDetail(id) async {
 //   var data = {"id": id};
    var res = await http.get('/api/c2c/orderDetail',queryParameters:  {"id": id});
    return c2cOrderlDetailModel.fromJson(res.data['data']);
  }

  static Future<List<ContactServerModel>> getContactServer() async {
    var res = await http.get('/api/common/server');
    return (res.data['data'] as List).map((e) => ContactServerModel.fromJson(e)).toList();
  }

  static Future<List<BankBindDetailModel>> getPaymentBindDetail(id) async {
   // var data = {"currency_id": id};
   // var res = await http.post('/api/c2c/account/paymentDetail',data: data);
    var res = await http.get('/api/c2c/account/otcPaymentDetail',queryParameters:  {"currency_id": id});
   // return BankBindDetailModel.fromJson(res.data['data']);
    return (res.data['data'] as List).map((e) => BankBindDetailModel.fromJson(e)).toList();
  }


  static Future getsellerDetail(id,number,currency,password) async {
    var data = {"id": id,"sell_number": number,"currency": currency,"pay_password": password};
    var res = await http.post('/api/c2c/doSellerDetail',data: data);
    return res.data['data'];
  }

  static Future getCancel(id) async {
    var data = {"id": id};
    var res = await http.post('/api/c2c/cancel',data: data);
    return res.data['data'];
  }

  static Future getConfirmOrder(id,password) async {
    var data = {"id": id,"pay_password": password};
    var res = await http.post('/api/c2c/finish',data: data);
    return res.data['data'];
  }

  static Future getConfirmPay(id,payment_id) async {

    var data =  {"id": id,"payment_account_id": payment_id,};
    var res = await http.post('/api/c2c/pay',data: data);
    return res.data['data'];
  }

  static Future <List<C2cCurrencyModel>>getC2cCurrency() async {
    var res = await http.get('/api/c2c/currency');
    return (res.data['data'] as List).map((e) => C2cCurrencyModel.fromJson(e)).toList();
  }



  static Future bindBank(id, name, account, bank_name, branch_name, sms_code, emailCode, googleCode) async {
    var data = {
      "currency_id": id,
      "name": name ?? '',
      "account": account ?? '',
    "email_code": emailCode ?? '',
    "sms_code": sms_code ?? '',
    "google_code": googleCode ?? '',
      "bank_name": bank_name ?? '',
      "branch_name": branch_name ?? ''
    };
    var res = await http.post('/api/c2c/account/addPayment', data: data);
    return res.data;
  }
  static Future bindAlipay( name, account, imageCode, sms_code, emailCode, googleCode) async {
    var data = {
      "name": name ?? '',
      "email_code": emailCode ?? '',
      "sms_code": sms_code ?? '',
      "google_code": googleCode ?? '',
      "alipay_account": account ?? '',
      "alipay_qr_code": imageCode ?? ''
    };
    var res = await http.post('/api/c2c/account/addAlipayQrCode', data: data);
    return res.data;
  }

  static Future bindWechat( name, account, imageCode, sms_code, emailCode, googleCode) async {
    var data = {
      "wechat_nickname": name ?? '',
      "email_code": emailCode ?? '',
      "sms_code": sms_code ?? '',
      "google_code": googleCode ?? '',
      "wechat_account": account ?? '',
      "wechat_qr_code": imageCode ?? ''
    };
    var res = await http.post('/api/c2c/account/addAlipayQrCode', data: data);
    return res.data;
  }



}