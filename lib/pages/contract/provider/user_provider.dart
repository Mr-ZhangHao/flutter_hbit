/*
* @message: 用户模块
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-15 12:09:20
* @LastEditors: Jack
* @LastEditTime: 2020-08-10 12:23:09
* @Deprecated: 否
* @FilePath: /ETF/lib/pages/login/provider/user_provider.dart
*/

// import 'package:royal_garden/core/services/user.dart';
import 'package:HBit/pages/mine/model/user_model.dart';
import 'package:HBit/providers/view_state_model.dart';
import 'package:HBit/utils/sp_utils.dart';

class UserProvider extends ViewStateModel {
  String token = SpUtils.sp.getString('token');
  bool _isLogin = SpUtils.sp.getString('token') != null;
  UserInfoModel userInfo;

  bool get isLogin => _isLogin;

  void setIsLogin(isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
