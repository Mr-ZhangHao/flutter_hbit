/*
* @message: 文件描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-21 22:28:00
* @LastEditors: Roy
* @LastEditTime: 2020-09-15 13:15:04
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/utils/util.dart
*/
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:common_utils/common_utils.dart';
import 'package:path_provider/path_provider.dart';

class Utils {
  static String cutZero1(value) {
    if (value == null) return '';
    String old = value.toString();
    String prefix = old.toString().split('.')[0];
    String sufix = old.toString().split('.')[1];
    String newSufix = '';
    if (sufix.endsWith('0')) {
      newSufix = sufix.substring(0, sufix.length - 1);
      return cutZero(prefix + '.' + newSufix);
    } else {
      return "$prefix.${sufix.isEmpty ? '0' : sufix}";
    }
  }

  // 去掉小数末尾的0
  static cutZero(old) {
    // 拷贝一份 返回去掉零的新串
    // return NumUtil.getNumByValueStr(old.toString(), fractionDigits: 8).toString();
    return double.parse(old.toString()).toString();

    // old = old.toString();
    // if (old.toString().indexOf('.') > -1) {
    //   //TODO
    //   old = old.toString().replaceAll(RegExp("\b(0+)"), "");
    //   if (old.toString().lastIndexOf('.') == old.length - 1) {
    //     return old.substring(0, old.length - 1).toString();
    //   } else {
    //     return old.toString();
    //   }
    // } else {
    //   return old.toString();
    // }
  }

  static Future<String> createFileFromString(String base64Str) async {
    Uint8List bytes = base64.decode(base64Str);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File("$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".png");
    await file.writeAsBytes(bytes);
    return file.path;
  }

  static conversionNum(double num) {
    if (num >= 1000 && num < 1000000) {
      return formatNum(num / 1000, pos: 2).toString() + 'K';
    } else if (num >= 1000000 && num < 1000000000) {
      return formatNum(num / 1000000, pos: 2).toString() + 'M';
    } else if (num >= 1000000000 && num < 1000000000000) {
      return formatNum(num / 1000000000, pos: 2).toString() + 'G';
    } else if (num < 1000) {
      return cutZero(num);
    }
  }

  //保留几位小数
  static formatNum(var num, {int pos = 8}) {
    return NumUtil.getNumByValueStr(num.toString(), fractionDigits: pos).toString();

    /*if ((num.toString().length - num.toString().lastIndexOf(".") - 1) <
        postion) {
      //小数点后有几位小数
      return cutZero(num.toStringAsFixed(postion)
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString());
    } else {
      return cutZero(num.toString()
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString());
    }*/
  }

  ///手机号验证
  static bool isChinaPhone(String str) {
    return RegExp(r"^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$").hasMatch(str);
  }

  ///邮箱验证
  static bool isEmail(String str) {
    return RegExp(r"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$").hasMatch(str);
  }

  ///验证URL
  static bool isUrl(String value) {
    return RegExp(r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+").hasMatch(value);
  }

  ///验证身份证
  static bool isIdCard(String value) {
    return RegExp(r"\d{17}[\d|x]|\d{15}").hasMatch(value);
  }

  ///验证中文
  static bool isChinese(String value) {
    return RegExp(r"[\u4e00-\u9fa5]").hasMatch(value);
  }

  static String hiddenMiddle(dynamic value, int index, int number) {
    if (value == null) return '--';
    String newValue = value.toString();
    return newValue.replaceFirst(new RegExp(r"\S{" + "$number" + "}"), '*' * number, index);
  }

  static formatNumber(num, int postion) {
    if ((num.toString().length - num.toString().lastIndexOf(".") - 1) < postion) {
      //小数点后有几位小数
      return num.toStringAsFixed(postion).substring(0, num.toString().lastIndexOf(".") + postion + 1).toString();
    } else {
      return num.toString().substring(0, num.toString().lastIndexOf(".") + postion + 1).toString();
    }
  }
}
