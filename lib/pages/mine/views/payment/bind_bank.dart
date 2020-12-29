import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/common/verivication/vertify_form.dart';
import 'package:HBit/core/model/tfa_type_model.dart';
import 'package:HBit/pages/c2c/server/index.dart';
import 'package:HBit/pages/login/server/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:HBit/providers/provider_widget.dart';
import 'package:HBit/pages/c2c/provider/index.dart';
import 'package:flutter/cupertino.dart';


class BindBankPage extends StatefulWidget {
  final String id;

  BindBankPage({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _BindBankPageState createState() => _BindBankPageState();
}

class _BindBankPageState extends State<BindBankPage> {
  final _nameCtr = TextEditingController();
  final FocusNode _nameFocus = FocusNode();

  final _bankNumberCtr = TextEditingController();
  final FocusNode _bankNumberFocus = FocusNode();

  final _bankCtr = TextEditingController();
  final FocusNode _bankFocus = FocusNode();

  final _branchCtr = TextEditingController();
  final FocusNode _branchFocus = FocusNode();
  final _codeCtr = TextEditingController();
  final FocusNode _codeFocus = FocusNode();

  final _ecodeCtr = TextEditingController();
  final FocusNode _ecodeFocus = FocusNode();

  final _gcodeCtr = TextEditingController();
  final FocusNode _gcodeFocus = FocusNode();
  String errorText = '';

  bool isError = false;

  bool isLoading = false;
  TfaTypeModel tfaType;

  @override
  void initState() {
    super.initState();
    LoginServer.getVertifyType(100,
            Provider.of<MineProvider>(context, listen: false).userInfo.username)
        .then((res) => setState(() => tfaType = res));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Tr.of(context).c2cBank),
          centerTitle: true,
          elevation: 1,
          leading: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Routers.goBack(context),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset('images/mine/back@2x.png',
                    width: width(22), height: height(36)),
              )),
        ),
        body: ProviderWidget<C2cProvider>(
            model: C2cProvider(),
            onModelReady: (model) {
              model.getPaymentBindDetail(widget.id);
            },
            builder: (context, model, _) {
              return model.isBusy ?   Center(
                child: CupertinoActivityIndicator(),
              ): SingleChildScrollView(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: width(40)),
                color: Colors.white,
                child: Column(
                  children: [
                    FocusWidget(
                      focusNode: _nameFocus,
                      child: InputWidget(
                        focusNode: _nameFocus,
                        controller: _nameCtr,
                        maxHeight: 100,
                        obscureText: false,
                        readOnly: model.bankBindDetailModel!=null&&model.bankBindDetailModel.length>0 ,
                        hintText: model.bankBindDetailModel!=null&&model.bankBindDetailModel.length>0 ?  '':Tr.of(context).c2cEnterNameHint,
                        prefixIconConstraintsMaxWidth: 250,
                        prefixIconConstraintsMinWidth: 150,
                        prefixIconConstraintsMinHeight: 50,
                        prefixIconConstraintsMaxHeight: 50,
                        suffixIconConstraintsMaxHeight: 50,
                        suffixIconConstraintsMinHeight: 50,
                        suffixIconConstraintsMinWidth: 150,
                        suffixIconConstraintsMaxWidth: 250,
                        suffixIcon: Container(
                          alignment: Alignment.centerRight,
                          child: Text(model.bankBindDetailModel!=null&&model.bankBindDetailModel.length>0 ? model.bankBindDetailModel[0].name :'',
                              style: TextStyle(color: Colors.black)),
                        ),
                        contentPadding: EdgeInsets.only(bottom: height(12)),
                        hintStyle: TextStyle(
                            color: Color(0xffCCCCCC), fontSize: sp(28)),
                        prefixIcon: Container(
                          child: Text('${Tr.of(context).c2cName}：',
                              style: TextStyle(color: Colors.black)),
                        ),

                      ),
                    ),
                    FocusWidget(
                      focusNode: _bankNumberFocus,
                      child: InputWidget(
                        focusNode: _bankNumberFocus,
                        controller: _bankNumberCtr,
                        maxHeight: 100,
                        obscureText: false,
                        readOnly: model.bankBindDetailModel!=null&&model.bankBindDetailModel.length>0 ,
                        hintText: model.bankBindDetailModel!=null&&model.bankBindDetailModel.length>0 ? '':Tr.of(context).c2cEnterNumberHint,
                        prefixIconConstraintsMaxWidth: 250,
                        prefixIconConstraintsMinWidth: 150,
                        prefixIconConstraintsMinHeight: 50,
                        prefixIconConstraintsMaxHeight: 50,
                        suffixIconConstraintsMaxHeight: 50,
                        suffixIconConstraintsMinHeight: 50,
                        suffixIconConstraintsMinWidth: 150,
                        suffixIconConstraintsMaxWidth: 250,
                        suffixIcon: Container(
                          alignment: Alignment.centerRight,
                          child: Text(model.bankBindDetailModel!=null&&model.bankBindDetailModel.length>0 ? model.bankBindDetailModel[0].account :'',
                              style: TextStyle(color: Colors.black)),
                        ),
                        contentPadding: EdgeInsets.only(bottom: height(12)),
                        hintStyle: TextStyle(
                            color: Color(0xffCCCCCC), fontSize: sp(28)),
                        prefixIcon: Container(
                          child: Text('${Tr.of(context).c2cBankCardNumber}：',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    FocusWidget(
                      focusNode: _bankFocus,
                      child: InputWidget(
                        focusNode: _bankFocus,
                        controller: _bankCtr,
                        maxHeight: 100,
                        obscureText: false,
                        readOnly: model.bankBindDetailModel!=null&&model.bankBindDetailModel.length>0 ,
                        hintText: model.bankBindDetailModel!=null &&model.bankBindDetailModel.length>0 ? '':Tr.of(context).c2cEnterBankAccountHint,
                        prefixIconConstraintsMaxWidth: 250,
                        prefixIconConstraintsMinWidth: 150,
                        prefixIconConstraintsMinHeight: 50,
                        prefixIconConstraintsMaxHeight: 50,
                        suffixIconConstraintsMaxHeight: 50,
                        suffixIconConstraintsMinHeight: 50,
                        suffixIconConstraintsMinWidth: 150,
                        suffixIconConstraintsMaxWidth: 250,
                        suffixIcon: Container(
                          alignment: Alignment.centerRight,
                          child: Text(model.bankBindDetailModel!=null&&model.bankBindDetailModel.length>0 ? model.bankBindDetailModel[0].bankName :'',
                              style: TextStyle(color: Colors.black)),
                        ),
                        contentPadding: EdgeInsets.only(bottom: height(12)),
                        hintStyle: TextStyle(
                            color: Color(0xffCCCCCC), fontSize: sp(28)),
                        prefixIcon: Container(
                          child: Text('${Tr.of(context).c2cBankAccount}：',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    FocusWidget(
                      focusNode: _branchFocus,
                      child: InputWidget(
                        focusNode: _branchFocus,
                        controller: _branchCtr,
                        maxHeight: 100,
                        obscureText: false,
                        readOnly: model.bankBindDetailModel!=null&&model.bankBindDetailModel.length>0 ,
                        hintText:model.bankBindDetailModel!=null &&model.bankBindDetailModel.length>0? '': Tr.of(context).c2cBranchHint,
                        prefixIconConstraintsMaxWidth: 250,
                        prefixIconConstraintsMinWidth: 150,
                        prefixIconConstraintsMinHeight: 50,
                        prefixIconConstraintsMaxHeight: 50,
                        suffixIconConstraintsMaxHeight: 50,
                        suffixIconConstraintsMinHeight: 50,
                        suffixIconConstraintsMinWidth: 150,
                        suffixIconConstraintsMaxWidth: 250,
                        suffixIcon: Container(
                          alignment: Alignment.centerRight,
                          child: Text(model.bankBindDetailModel!=null&&model.bankBindDetailModel.length>0 ? model.bankBindDetailModel[0].branchName :'',
                              style: TextStyle(color: Colors.black)),
                        ),
                        contentPadding: EdgeInsets.only(bottom: height(12)),
                        hintStyle: TextStyle(
                            color: Color(0xffCCCCCC), fontSize: sp(28)),
                        prefixIcon: Container(
                          child: Text('${Tr.of(context).c2cBranch}：',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    Visibility(child:BuildVertifyForm(
                        tfaType: tfaType?.tfaType ?? 0,
                        context: context,
                        codeFocus: _codeFocus,
                        codeCtr: _codeCtr,
                        ecodeFocus: _ecodeFocus,
                        ecodeCtr: _ecodeCtr,
                        gcodeFocus: _gcodeFocus,
                        gcodeCtr: _gcodeCtr),
                        visible: model.bankBindDetailModel.length==0,
                    ),
                    Visibility(
                        visible: isError,
                        child: Text(errorText,
                            style: TextStyle(color: Color(0xffFF3838)))),
                    SizedBox(height: height(70)),

                    Visibility(child:  MyButton(
                        text: Tr.of(context).submitBinding,
                        onPressed: () {
                          _confirm();
                        }),
                    visible:  model.bankBindDetailModel.length==0,
                    )
                  ],
                ),
              ));
            }));
  }

  void _confirm() async {
    int tfaType = this.tfaType?.tfaType;
    if (_nameCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).c2cEnterNameHint;
      });
    } else if (_bankNumberCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).c2cEnterNumberHint;
      });
    } else if (_bankCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).c2cEnterBankAccountHint;
      });
    } else if ((tfaType == 3 || tfaType == 4 || tfaType == 5 || tfaType == 7) &&
        _gcodeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).GoogleCodeHint;
      });
    } else if ((tfaType == 1 || tfaType == 3 || tfaType == 5 || tfaType == 6) &&
        _codeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).PhoneCodeHint;
      });
    } else if ((tfaType == 2 || tfaType == 4 || tfaType == 5 || tfaType == 6) &&
        _ecodeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).EmailCodeHint;
      });
    } else {
      setState(() {
        isLoading = false;
        errorText = '';
        isError = false;
      });
      Toast.showLoading('loading...');
      try {
        await C2cServer.bindBank(
            widget.id,
            _nameCtr.text ?? '',
            _bankNumberCtr.text ?? '',
            _bankCtr.text ?? '',
            _branchCtr.text,
            _codeCtr.text,
            _ecodeCtr.text,
            _gcodeCtr.text);
        Toast.showSuccess(Tr.of(context).tradrSuccess);

        _ecodeCtr.text = '';
        _codeCtr.text = '';
        _gcodeCtr.text = '';

        Provider.of<MineProvider>(context, listen: false).getPayMent();
        Routers.goBack(context);
      } catch (e) {
        print(e);
      }
    }
  }
}
