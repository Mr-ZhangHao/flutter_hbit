/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-07-30 20:16:54
* @LastEditors: Jack
* @LastEditTime: 2020-08-09 19:01:17
* @Deprecated: 否
* @FilePath: /ETF/lib/utils/sp_utils.dart
*/
import 'dart:convert';

import 'package:HBit/core/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpUtils {
  /// app全局配置
  static SharedPreferences sp;

  /// 必备数据的初始化操作
  ///
  /// 由于是同步操作会导致阻塞,所以应尽量减少存储容量
  static init() async {
    sp = await SharedPreferences.getInstance();
  }

  static getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString('token');
    return Future.value(token);
  }

  static getSessionId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String sessionId = preferences.getString('sessionId');
    return Future.value(sessionId);
  }

  /*保存当前用户*/
  static setUser(UserModel user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("user", json.encode(user.toJson()));
  }

  /*保存当前用户*/
  static removeUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("user");
  }

  static setStringList(String key, List<String> value) =>
      SharedPreferences.getInstance().then((sp) => sp.setStringList(key, value));

  static Future<List<String>> getStringList(String key, [List<String> defaultValue = const <String>[]]) async {
    var sp = await SharedPreferences.getInstance();
    var value = sp.getStringList(key);
    return value ?? defaultValue;
  }

  /*获取当前用户*/
  static Future<UserModel> getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String str = preferences.getString("user");
    if (str == null) {
      return null;
    }
    return Future.value(UserModel.fromJson(jsonDecode(str)));
  }

  static Future<int> getHostIndex() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int index = preferences.getInt("hostIndex");
    if (index == null) {
      await serHostIndex(0);
      return 0;
    }
    return Future.value(index);
  }

  static serHostIndex(int index) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setInt("hostIndex", index);
  }

  /*
   * 存储数据
   */
  // ignore: unused_element
  Future _set(String key, value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  /*
   * 读取数据
   */
  // ignore: unused_element
  Future _get(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String account = preferences.get(key);
    return Future.value(account);
  }

  /*
   * 删除数据
   */
  // ignore: unused_element
  Future _remove(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
  }
}
