/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 17:28:29
* @LastEditors: Jack
* @LastEditTime: 2020-08-19 17:30:39
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/provider/notice_provider.dart
*/
import 'package:HBit/core/model/user_model.dart';
import 'package:HBit/providers/view_state_refresh_list_model.dart';

class NoticesProvider extends ViewStateRefreshListModel {
  String type;

  void setType(String t) {
    type = t;
    notifyListeners();
  }

  @override
  Future<List<UserModel>> loadData({int pageNum}) async {
    // return await MarketServer.fetchMarketList(
    //     type, pageNum, ViewStateRefreshListModel.pageSize);
    return Future.value(
        [UserModel(), UserModel(), UserModel(), UserModel(), UserModel()]);
  }
}
