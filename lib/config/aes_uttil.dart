/*
* @message: 描述
* @Author: Roy
* @Email: @163.com
* @Github: @163.com
* @Date: 2020-08-05 23:02:48
* @LastEditors: Roy
* @LastEditTime: 2020-08-07 11:36:47
* @Deprecated: 否
* @FilePath: /ETF/lib/config/aes_uttil.dart
*/

import 'package:HBit/config/global_config.dart';
import 'package:encrypt/encrypt.dart';

class AESUtil {
  /*
   * 加密
   */
  static String generateAESEncrypt(String data) {
    final plainText = data;
    final key = Key.fromUtf8(GlobalConfig.aesKey);
    final iv = IV.fromUtf8(GlobalConfig.cbcViKey);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  /*
   * 解密
   */
  static String generateAESDecrypt(String data) {
    final Encrypted plainText = data as Encrypted;
    final key = Key.fromUtf8(GlobalConfig.aesKey);
    final iv = IV.fromUtf8(GlobalConfig.cbcViKey);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt(plainText, iv: iv);
    return decrypted;
  }
}
