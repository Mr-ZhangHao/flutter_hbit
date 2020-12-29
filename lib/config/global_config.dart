/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-06-15 23:05:37
* @LastEditors: Roy
* @LastEditTime: 2020-09-14 11:13:12
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/config/global_config.dart
*/

/*
 *系统主题设置，包括系统默认字体 背景色等
 */

import 'package:HBit/common/toast/index.dart';
import 'package:HBit/core/network/api.dart';

class GlobalConfig {
  ///当前版本号和版本名称，由于ios打tf包只能用1.0版本，所以升级判断要用自己的配置文件
  static int andVersionCode = 102;
  static String andVersionName = '1.0.2';
  static int iosVersionCode = 102;
  static String iosVersionName = '1.0.2';
  static bool isTimer = true;

  ///当前版本号和版本名称，由于ios打tf包只能用1.0版本，所以升级判断要用自己的配置文件
  static int versionCode = 102;
  static String versionName = '1.0.2';

  //aes加密得key
  static String aesKey = 'GmtWrMXg6ruVzJ1oCRQY9g==';
  //aes加密得CBC模式下的vi
  static String cbcViKey = '92o3jrnf83ikgud7';

  /// true 时打的是测试包  改为正式包要修改 包名 xml provider名称 应用名
  static bool isDebug = false; //是否是调试模式
/*

  //币币服务器地址  ETF
  static String apiHost1 = "http://13.113.24.115/";
  //合约服务器地址
  static String apiHost2 = "http://159.138.11.173:10030/";
*/

  //币币服务器地址  hebit
  static String apiHost1 = "http://api.hbitex.com/";
  //合约服务器地址
  static String apiHost2 = "http://contract.hbitex.com/";

  static String apiHost3 = "http://three.aaladfk.cn:9000/";
  static String apiHost4 = "http://four.aaladfk.cn:9000/";

  static String uploadHost = "http://39.101.161.229:8088";
  static String imgHost = "http://qc7u9r5co.bkt.clouddn.com/";
  static String webSocketUrl = "ws://192.168.3.17:8091/websocket";
  static String sendMsgUrl = "http://39.101.185.26:8089/send/message";

  static int currentApiHostIndex = 0;
  static String get currentApiHostUrl {
    switch (currentApiHostIndex) {
      case 0:
        return apiHost1;
      case 1:
        return apiHost2;
      case 2:
        return apiHost3;
      case 3:
        return apiHost4;
      default:
        return apiHost2;
    }
  }

  // 操作型的错误提示
  static errorTips(e) async {
    Toast.close();
    if (e.type == DioErrorType.CONNECT_TIMEOUT ||
        e.type == DioErrorType.SEND_TIMEOUT ||
        e.type == DioErrorType.RECEIVE_TIMEOUT) {
      Toast.showError('请检查网络');
    }
  }
}

const APP_ID = 'dd75ce1243be4603b15223da26df01b3';

///分隔线颜色
const dividerColor = 0xffF2F2F2;
