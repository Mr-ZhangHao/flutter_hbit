/*
* @message: 用户相关接口
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-06-16 21:23:13
* @LastEditors: Jack
* @LastEditTime: 2020-07-30 20:30:07
* @Deprecated: 否
* @FilePath: /ETF/lib/core/services/user.dart
*/
import 'package:device_info/device_info.dart';
import 'package:HBit/core/model/user_model.dart';
import 'package:HBit/core/network/http.dart';

class UserServer {
  /// 发送验证码
  ///
  /// @params [mobile] => 手机号
  static Future sendMsg(String mobile) async {
    var res = await http.post('/notemessage/send', data: {"mobile": mobile});
    return res.data;
  }

  /// 用户登录
  ///
  /// @param * [mobile] => 手机号
  ///
  /// @param * [type] => 登录类型 [note:短信登录, pass: 密码登录]
  ///
  /// @param * [device] => 设备ID
  ///
  /// @param  [password] => 登录密码
  ///
  /// @param [code] => 短信验证码
  ///
  /// [注释]：type为 [note] 的时候 为验证码登录，[password] 不用传参, type为 [pass]的时候为密码登录 [code] 不用传参
  ///
  /// {state: 0, msg: 验证码发送成功, data: true}
  static Future login(String mobile, String password, String device,
      String code, String type) async {
    var params = {};
    if (type == 'note') {
      params = {
        'mobile': mobile,
        "device": device,
        "messageCode": code,
        "type": type
      };
    } else {
      params = {
        'mobile': mobile,
        "device": device,
        'password': password,
        "type": type
      };
    }
    var res = await http.post('/login', data: params);
    return res.data;
  }

  ///获取用户信息
  static Future<UserModel> userInfo(int userId) async {
    var params = {'otherId': userId};
    var res = await http.get('/rest/user/info', queryParameters: params);
    return UserModel.fromJson(res.data['data']);
  }

  /// 完善个人资料
  ///
  /// 备注: 只在注册后用户没有设置昵称的时候调用此接口
  ///
  /// @param * [userId] => 用户ID
  ///
  /// @param * [name] => 昵称
  ///
  /// @param * [avatar] => 头像（阿里云图片地址）
  ///
  /// @param * [sex] => 性别
  ///
  /// @param * [password] => 密码
  ///
  /// @header * [token] => 用户token
  ///
  /// @header * [sessionId] => 用户sessionId
  ///
  static Future<UserModel> updateUser(num userId, String name, String avatar,
      String sex, String password) async {
    var params = {
      "userId": userId,
      "name": name,
      "sex": sex,
      "img": avatar,
      "password": password
    };
    var res = await http.post('/rest/user/updateUser', data: params);
    return UserModel.fromJson(res.data['data']);
  }

  // 获取图片
  static Future getCaptcha() async {
    var response = await http.get('/api/service/captcha');
    return response.data;
  }

  /// 设置密码
  /// @param * [userId] => 用户ID
  ///
  /// @param * [messageCode] => 短信验证码
  ///
  /// @param * [password] => 密码
  ///
  /// @header * [token] => 用户token
  ///
  /// @header * [sessionId] => 用户sessionId
  ///
  static Future updatePassword(
      String password, String messageCode, num userId) async {
    var data = {
      "password": password,
      "userId": userId,
      "messageCode": messageCode
    };
    var res = await http.post('/rest/user/updatePwd', data: data);
    return res.data;
  }

  /// 退出登录
  ///
  /// @param * [userId] => 用户ID
  ///
  /// @header * [token] => 用户token
  ///
  /// @header * [sessionId] => 用户sessionId
  ///
  static Future logOut(num userId) async {
    var res = await http.post('/rest/loginOut', data: {"userID": userId});
    return res.data;
  }

  /// 获取Android设备信息
  static Map<String, dynamic> readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  /// 获取IOS设备信息
  static Map<String, dynamic> readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}
