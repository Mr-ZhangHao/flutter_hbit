/*
* @message: 文件描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-06-01 13:46:53
* @LastEditors: Jack
* @LastEditTime: 2020-08-20 10:45:44
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/providers/gloable_provider.dart
*/
import 'package:flutter/cupertino.dart';

class GloableProvider extends ChangeNotifier {
  int bottomCurrIndex = 0;

  setCurrIndex(int index) {
    bottomCurrIndex = index;
    print(index);
    notifyListeners();
  }
}
