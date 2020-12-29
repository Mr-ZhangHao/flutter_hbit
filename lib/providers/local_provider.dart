/*
* @message: 本地化国际化
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-03-26 15:41:05
* @LastEditors: Mike
* @LastEditTime: 2020-05-09 01:42:28
* @Deprecated: 否
* @FilePath: /retailer_flutter/lib/providers/local_provider.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:HBit/utils/sp_utils.dart';

class LocalProvider extends ChangeNotifier {
  static const localeValueList = ['', 'zh-CN', 'en-US','zh-HK',];

  static const kLocaleIndex = 'kLocaleIndex';

  int _localeIndex;

  int get localeIndex => _localeIndex;

  Locale get locale {
    if (_localeIndex > 0) {
      var value = localeValueList[_localeIndex].split("-");
      return Locale(value[0], value.length == 2 ? value[1] : '');
    }
    // 跟随系统
    return null;
  }

  LocalProvider() {
      _localeIndex = SpUtils.sp.getInt(kLocaleIndex) ?? 0;
  }

  switchLocale(int index) {
    _localeIndex = index;
    notifyListeners();
    SpUtils.sp.setInt(kLocaleIndex, index);
  }

  static String localeName(index, context) {
    switch (index) {
      case 0:
        return Tr.of(context).autoBySystem;
      case 1:
        return '中文';

      case 2:
        return 'English';

        case 3:
        return '繁体中文';
      default:
        return '';
    }
  }
}
