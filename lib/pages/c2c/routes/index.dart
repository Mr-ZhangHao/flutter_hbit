import 'package:HBit/pages/c2c/views/c2cOrderDetail.dart';
import 'package:HBit/pages/c2c/views/orderDealPage.dart';
import 'package:HBit/pages/c2c/views/record/OrderHistory.dart';
import 'package:HBit/pages/mine/views/payment/bind_alipay.dart';
import 'package:HBit/pages/mine/views/payment/bind_bank.dart';
import 'package:HBit/pages/mine/views/payment/bind_payment.dart';
import 'package:HBit/pages/mine/views/payment/bind_wechat.dart';
import 'package:HBit/pages/wallet/views/RuleDescription.dart';
import 'package:HBit/routes/router_init.dart';
import 'package:fluro/fluro.dart';

class C2CRouter implements IRouterProvider {
  static String orderHistory = '/orderHistory';
  static String orderDeal = '/orderDealPage';
  static String BindPayment = '/BindPaymentPage';
  static String BindBank = '/BindBankPage';
  static String BindAliPay = '/BindAliPayPage';
  static String BindWeChat = '/BindWeChat';
  static String c2cOrderDetail = '/c2cOrderDetailPage';

  @override
  void initRouter(FluroRouter router) {
    router.define(orderHistory, handler: Handler(handlerFunc: (_, __) => OrderHistory()));
    router.define(BindPayment, handler: Handler(handlerFunc: (_, __) => BindPaymentPage()));
//  router.define(BindBank, handler: Handler(handlerFunc: (_, __) => BindBankPage()));
    router.define(BindAliPay, handler: Handler(handlerFunc: (_, __) => BindAliPayPage()));
    router.define(BindWeChat, handler: Handler(handlerFunc: (_, __) => BindWeChatPage()));
    router.define(orderDeal, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String id = params['id'].first;
      String tabBarType = params['type'].first;
      String currency = params['currency'].first;
      String currencyID = params['currencyID'].first;
      String number = params['number'].first;
      String coin = params['coin'].first;
      String price = params['price'].first;
      return orderDealPage(
        type: tabBarType,
        id: id,
        coin: coin,
        currency: currency,
        currencyID: currencyID,
        number: number,
        price: price,
      );
    }));

    router.define(c2cOrderDetail, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String id = params['id'].first;
      return c2cOrderDetailPage(id: id);
    }));

    router.define(BindBank, handler: Handler(handlerFunc: (context, Map<String, List<String>> params) {
      String id = params['id'].first;
      return BindBankPage(id: id);
    }));
  }
}
