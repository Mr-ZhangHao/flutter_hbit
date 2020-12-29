import 'package:HBit/common/form/lable_input.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/pages/mine/model/user_model.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildVertifyForm extends StatelessWidget {
  final int tfaType;
  const BuildVertifyForm({
    Key key,
    @required this.context,
    @required FocusNode codeFocus,
    @required TextEditingController codeCtr,
    @required FocusNode ecodeFocus,
    @required TextEditingController ecodeCtr,
    @required FocusNode gcodeFocus,
    @required TextEditingController gcodeCtr,
    this.tfaType,
  })  : _codeFocus = codeFocus,
        _codeCtr = codeCtr,
        _ecodeFocus = ecodeFocus,
        _ecodeCtr = ecodeCtr,
        _gcodeFocus = gcodeFocus,
        _gcodeCtr = gcodeCtr,
        super(key: key);

  final BuildContext context;
  final FocusNode _codeFocus;
  final TextEditingController _codeCtr;
  final FocusNode _ecodeFocus;
  final TextEditingController _ecodeCtr;
  final FocusNode _gcodeFocus;
  final TextEditingController _gcodeCtr;

  @override
  Widget build(BuildContext context) {
    UserInfoModel user = Provider.of<MineProvider>(context, listen: false).userInfo;
    if (tfaType == 1) {
      // 手机验证
      return LabelTipsInput(
        codeFocus: _codeFocus,
        codeCtr: _codeCtr,
        userName: user.mobile,
        isEmail: false,
      );
    } else if (tfaType == 2) {
      // 邮箱验证
      return LabelTipsInput(
        codeFocus: _ecodeFocus,
        codeCtr: _ecodeCtr,
        userName: user.email,
        isEmail: true,
      );
    } else if (tfaType == 3) {
      // 手机加谷歌
      return Column(
        children: <Widget>[
          LabelTipsInput(
            codeFocus: _codeFocus,
            codeCtr: _codeCtr,
            userName: user.mobile,
            isEmail: false,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '谷歌验证码',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: sp(30), color: kTextColor3, fontWeight: FontWeight.bold),
              ),
              FocusWidget(
                focusNode: _gcodeFocus,
                child: InputWidget(
                  obscureText: false,
                  controller: _gcodeCtr,
                  focusNode: _gcodeFocus,
                  hintText: '请输入谷歌验证码',
                  suffixIconConstraintsMaxWidth: 160,
                  suffixIconConstraintsMinWidth: 160,
                  suffixIconConstraintsMaxHeight: 60,
                  suffixIconConstraintsMinHeight: 60,
                  maxHeight: 100,
                ),
              )
            ],
          )
        ],
      );
    } else if (tfaType == 4) {
      // 邮箱加谷歌
      return Column(
        children: <Widget>[
          LabelTipsInput(
            codeFocus: _ecodeFocus,
            codeCtr: _ecodeCtr,
            userName: user.email,
            isEmail: true,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '谷歌验证码',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: sp(30), color: kTextColor3, fontWeight: FontWeight.bold),
              ),
              FocusWidget(
                focusNode: _gcodeFocus,
                child: InputWidget(
                  obscureText: false,
                  controller: _gcodeCtr,
                  focusNode: _gcodeFocus,
                  hintText: '请输入谷歌验证码',
                  suffixIconConstraintsMaxWidth: 160,
                  suffixIconConstraintsMinWidth: 160,
                  suffixIconConstraintsMaxHeight: 60,
                  suffixIconConstraintsMinHeight: 60,
                  maxHeight: 100,
                ),
              )
            ],
          )
        ],
      );
    } else if (tfaType == 5) {
      // 手机+邮箱+谷歌
      return Column(
        children: <Widget>[
          LabelTipsInput(
            codeFocus: _ecodeFocus,
            codeCtr: _ecodeCtr,
            userName: user.email,
            isEmail: true,
          ),
          LabelTipsInput(
            codeFocus: _codeFocus,
            codeCtr: _codeCtr,
            userName: user.mobile,
            isEmail: false,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '谷歌验证码',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: sp(30), color: kTextColor3, fontWeight: FontWeight.bold),
              ),
              FocusWidget(
                focusNode: _gcodeFocus,
                child: InputWidget(
                  obscureText: false,
                  controller: _gcodeCtr,
                  focusNode: _gcodeFocus,
                  hintText: '请输入谷歌验证码',
                  suffixIconConstraintsMaxWidth: 160,
                  suffixIconConstraintsMinWidth: 160,
                  suffixIconConstraintsMaxHeight: 60,
                  suffixIconConstraintsMinHeight: 60,
                  maxHeight: 100,
                ),
              )
            ],
          )
        ],
      );
    } else if (tfaType == 6) {
      // 手机+邮箱
      return Column(
        children: <Widget>[
          LabelTipsInput(
            codeFocus: _codeFocus,
            codeCtr: _codeCtr,
            userName: user.mobile,
            isEmail: false,
          ),
          LabelTipsInput(
            codeFocus: _ecodeFocus,
            codeCtr: _ecodeCtr,
            userName: user.email,
            isEmail: true,
          ),
        ],
      );
    } else if (tfaType == 7) {
      // 谷歌
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '谷歌验证码',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: sp(30), color: kTextColor3, fontWeight: FontWeight.bold),
          ),
          FocusWidget(
            focusNode: _gcodeFocus,
            child: InputWidget(
              obscureText: false,
              controller: _gcodeCtr,
              focusNode: _gcodeFocus,
              hintText: '请输入谷歌验证码',
              suffixIconConstraintsMaxWidth: 160,
              suffixIconConstraintsMinWidth: 160,
              suffixIconConstraintsMaxHeight: 60,
              suffixIconConstraintsMinHeight: 60,
              maxHeight: 100,
            ),
          )
        ],
      );
    } else {
      return SizedBox();
    }
  }
}
