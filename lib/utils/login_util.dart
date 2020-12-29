class LoginUtil{
  ///手机号校验
  static bool checkPhone(String str) {
    return new RegExp('^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$').hasMatch(str);
  }
  ///截取城市 '内蒙古自治区 呼和浩特市 新城区'
  ///返回 呼和浩特
  static String getCity(String location) {
    if (location==null || location.trim().isEmpty) {
      return '保密';
    }
    return location.split(' ')[1].replaceAll('市', '').replaceAll('城区', '');
  }
}