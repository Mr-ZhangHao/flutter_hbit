/*
* @message: 我的
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-15 16:35:01
* @LastEditors: Jack
* @LastEditTime: 2020-08-20 16:14:42
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/provider/mine_provider.dart
*/

import 'package:HBit/pages/mine/model/kyc_info_model.dart';
import 'package:HBit/pages/mine/model/payment_model.dart';
import 'package:HBit/pages/mine/model/user_model.dart';
import 'package:HBit/pages/mine/server/index.dart';
import 'package:HBit/providers/view_state_model.dart';

class VertifyFiled {
  String country;
  String lastName;
  String firstName;
  String idType;
  String idNumber;
  VertifyFiled(this.country, this.lastName, this.firstName, this.idType, this.idNumber);
}

class MineProvider extends ViewStateModel {
  bool isShowBadge = false;
  UserInfoModel userInfo;
  PaymentModel paymentInfo;
  String googleSecret = '';

  KycInfoModel kycInfo;

  VertifyFiled vertifyFiled = VertifyFiled('', '', '', '', '');

  setIsShowBadge(bool param) {
    isShowBadge = param;
    notifyListeners();
  }

  setVertifyFiled(VertifyFiled data) {
    vertifyFiled = data;
    notifyListeners();
  }

  void setUserInfo(UserInfoModel params) {
    userInfo = params;
    notifyListeners();
  }

  void setGoogleSecret(String params) {
    googleSecret = params;
    notifyListeners();
  }


  void getSecret() async {
    setBusy();
    try {
      var res = await MineServer.googleSecret();
      setGoogleSecret(res['data']['secret']);
      setIdle();
    } catch (e, s) {
      setError(e, s);
    }
  }
  void setPaymentList(PaymentModel params) {
    paymentInfo = params;
    notifyListeners();
  }
  void getPayMent() async {
    setBusy();
    try {
      var res = await MineServer.getPayMent();
      setPaymentList(res);
    } catch (e, s) {
      setError(e, s);
    }
  }

  void getUserInfo() async {
    setBusy();
    try {
      UserInfoModel user = await MineServer.getUserInfo();
      // userInfo = user;
      setUserInfo(user);
      setIdle();
    } catch (e, s) {
      setError(e, s);
      print(e);
    }
  }

  void getKycInfo() async {
    setBusy();
    try {
      KycInfoModel data = await MineServer.getKycInfo();
      kycInfo = data;
      setIdle();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  @override
  void dispose() {
    super.dispose();
    print('aaa');
  }
}
