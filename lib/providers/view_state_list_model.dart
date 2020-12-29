/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-07-30 23:15:34
* @LastEditors: Roy
* @LastEditTime: 2020-08-06 23:14:30
* @Deprecated: 否
* @FilePath: /ETF/lib/providers/view_state_list_model.dart
*/
import 'view_state_model.dart';

/// 基于
abstract class ViewStateListModel<T> extends ViewStateModel {
  /// 页面数据
  List<T> list = [];

  /// 第一次进入页面loading skeleton
  initData() async {
    setBusy();
    await refresh(init: true);
  }

  // 下拉刷新
  refresh({bool init = false}) async {
    try {
      List<T> data = await loadData();
      if (data.isEmpty) {
        list.clear();
        setEmpty();
      } else {
        onCompleted(data);
        list.clear();
        list.addAll(data);
        setIdle();
      }
      notifyListeners();
    } catch (e, s) {
      if (init) list.clear();
      setError(e, s);
    }
  }

  // 加载数据
  Future<List<T>> loadData();

  onCompleted(List<T> data) {}
}
