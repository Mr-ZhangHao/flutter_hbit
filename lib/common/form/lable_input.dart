/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-09-04 14:48:08
* @LastEditors: Jack
* @LastEditTime: 2020-09-04 16:18:32
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/common/form/lable_input.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/login/server/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/utils/screen.dart';
import 'package:HBit/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabelTipsInput extends StatelessWidget {
  final bool isEmail;
  final bool isSendCode;
  final String userName;
  const LabelTipsInput({
    Key key,
    @required FocusNode codeFocus,
    @required TextEditingController codeCtr,
    this.isEmail,
    this.userName,
    this.isSendCode = true,
  })  : _codeFocus = codeFocus,
        _codeCtr = codeCtr,
        super(key: key);

  final FocusNode _codeFocus;
  final TextEditingController _codeCtr;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        isEmail
            ? Text(
                '若未收到邮件，请检查邮箱垃圾箱',
                style: TextStyle(fontSize: sp(28), color: Color(0xffB0BFD7)),
              )
            : SizedBox(),
        SizedBox(height: height(10)),
        Text(
          isEmail ? Utils.hiddenMiddle(userName, userName.indexOf('@') - 5, 8) : Utils.hiddenMiddle(userName, 3, 4),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: sp(30), color: kTextColor3, fontWeight: FontWeight.bold),
        ),
        FocusWidget(
          focusNode: _codeFocus,
          child: InputWidget(
            obscureText: false,
            controller: _codeCtr,
            focusNode: _codeFocus,
            hintText: isEmail ? Tr.of(context).emailCodeInputHint: Tr.of(context).phoneCodeInputHint,
            hintStyle: TextStyle(fontSize: sp(28), color: Color(0xffcccccc)),
            getVCode: getVcode,
            suffixIconConstraintsMaxWidth: 160,
            suffixIconConstraintsMinWidth: 160,
            suffixIconConstraintsMaxHeight: 60,
            suffixIconConstraintsMinHeight: 60,
            maxHeight: 100,
          ),
        ),
      ],
    );
  }

  Future<bool> getVcode() async {
    try {
      if (isEmail) {
        await LoginServer.email(userName);
        return Future.value(true);
      } else {
        await LoginServer.sms('', userName);
        return Future.value(true);
      }
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }
}

// 只允许输入小数和整数
class UsNumberTextInputFormatter extends TextInputFormatter {
  static const defaultDouble = 0.001;
  static double strToFloat(String str, [double defaultValue = defaultDouble]) {
    try {
      return double.parse(str);
    } catch (e) {
      return defaultValue;
    }
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String value = newValue.text;
    int selectionIndex = newValue.selection.end;
    if (value == ".") {
      value = "0.";
      selectionIndex++;
    } else if (value != "" && value != defaultDouble.toString() && strToFloat(value, defaultDouble) == defaultDouble) {
      value = oldValue.text;
      selectionIndex = oldValue.selection.end;
    }
    return TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
