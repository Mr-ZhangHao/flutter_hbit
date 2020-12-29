import 'package:HBit/common/button/index.dart';
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/input/focus.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/common/upload/image_upload.dart';
import 'package:HBit/common/verivication/vertify_form.dart';
import 'package:HBit/core/model/tfa_type_model.dart';
import 'package:HBit/pages/c2c/server/index.dart';
import 'package:HBit/pages/login/server/index.dart';
import 'package:HBit/pages/login/widgets/text_input.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/pages/mine/server/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class BindAliPayPage extends StatefulWidget {
  @override
  _BindAliPayPageState createState() => _BindAliPayPageState();
}
enum LoadType { success, error, waiting, loading }
class _BindAliPayPageState extends State<BindAliPayPage> {
  final _nameCtr = TextEditingController();
  final FocusNode _nameFocus = FocusNode();

  final _NumberCtr = TextEditingController();
  final FocusNode _NumberFocus = FocusNode();


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

  LoadType _frontLoadType = LoadType.waiting;
  String _frontImage;


  @override
  void initState() {
    super.initState();
    LoginServer.getVertifyType(100, Provider
        .of<MineProvider>(context, listen: false)
        .userInfo
        .username)
        .then((res) => setState(() => tfaType = res));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr
            .of(context)
            .c2cAlipay),
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
      body: SingleChildScrollView(
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
                    hintText: Tr
                        .of(context)
                        .c2cEnterNameHint,
                    prefixIconConstraintsMaxWidth: 150,
                    prefixIconConstraintsMinWidth: 150,
                    prefixIconConstraintsMinHeight: 50,
                    prefixIconConstraintsMaxHeight: 50,
                    contentPadding: EdgeInsets.only(bottom: height(12)),
                    hintStyle: TextStyle(
                        color: Color(0xffCCCCCC), fontSize: sp(28)),
                    prefixIcon: Container(
                      child: Text('${Tr
                          .of(context)
                          .c2cName}：', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
                FocusWidget(
                  focusNode: _NumberFocus,
                  child: InputWidget(
                    focusNode: _NumberFocus,
                    controller: _NumberCtr,
                    maxHeight: 100,
                    obscureText: false,
                    hintText: Tr
                        .of(context)
                        .c2cEnterAlipayAccountHint,
                    prefixIconConstraintsMaxWidth: 250,
                    prefixIconConstraintsMinWidth: 150,
                    prefixIconConstraintsMinHeight: 50,
                    prefixIconConstraintsMaxHeight: 50,
                    contentPadding: EdgeInsets.only(bottom: height(12)),
                    hintStyle: TextStyle(
                        color: Color(0xffCCCCCC), fontSize: sp(28)),
                    prefixIcon: Container(
                      child: Text('${Tr
                          .of(context)
                          .c2cAlipayAccount}：',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),


                BuildVertifyForm(
                    tfaType: tfaType?.tfaType ?? 0,
                    context: context,
                    codeFocus: _codeFocus,
                    codeCtr: _codeCtr,
                    ecodeFocus: _ecodeFocus,
                    ecodeCtr: _ecodeCtr,
                    gcodeFocus: _gcodeFocus,
                    gcodeCtr: _gcodeCtr),

                Visibility(visible: isError,
                    child: Text(
                        errorText, style: TextStyle(color: Color(0xffFF3838)))),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: height(20)),
                  child: Text(Tr
                      .of(context)
                      .c2cCollectionCode),
                ),
                _cardFrontImage(),
                SizedBox(height: height(70)),
                MyButton(text: Tr
                    .of(context)
                    .submitBinding, onPressed: () {
                  _confirm();
                }),
              ],
            ),
          )),
    );
  }

  Widget _cardFrontImage() {
    if (_frontLoadType == LoadType.waiting) {
      return InkWell(
        onTap: () => _chooseCamereOrGallery('front'),
        child: CardImageBaseWidget(
            imageUrl: 'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).c2cUpload}'),
      );
    } else if (_frontLoadType == LoadType.loading) {
      return CardImageLoadingWidget(
          imageUrl: 'images/c2c/c2c_upload.png',buttontext: '${Tr.of(context).c2cUpload}');
    } else if (_frontLoadType == LoadType.success) {
      return InkWell(
          onTap: () => _chooseCamereOrGallery('front'),
          child: CardImageLoadSuccessWidget(
              imageUrl: _frontImage, buttontext: '${Tr.of(context).reUpload}'));
    } else {
      // error
      return InkWell(
          onTap: () => _chooseCamereOrGallery('front'),
          child: CardImageLoadErrorWidget(
              imageUrl: 'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).reUpload}'));
    }
  }


  _chooseCamereOrGallery(String type) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/mine/camera.png', width: width(56),
                          height: height(50)),
                      SizedBox(width: width(10)),
                      Text("${Tr.of(context).PhotoAlbum}", style: TextStyle(color: Color(0xff323232))),
                    ],
                  ),
                ),
                onTap: () async {
                  _takePhoto(type, 'camera');
                  Navigator.pop(context);
                },
              ),
              Divider(height: 1,
                  color: Color(0xffE6E6E6),
                  indent: width(40),
                  endIndent: width(40)),
              ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/mine/galery.png', width: width(56),
                          height: height(50)),
                      SizedBox(width: width(10)),
                      Text("${Tr.of(context).TakePictures}", style: TextStyle(color: Color(0xff323232))),
                    ],
                  ),
                ),
                onTap: () async {
                  _takePhoto(type, 'gallery');
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  /// 拍照
  _takePhoto(type, action) async {
    var image = action == 'camera'
        ? await ImagePicker.pickImage(source: ImageSource.camera,
        maxHeight: 800,
        maxWidth: 800,
        imageQuality: 50)
        : await ImagePicker.pickImage(source: ImageSource.gallery,
        maxHeight: 800,
        maxWidth: 800,
        imageQuality: 50);
    if (image != null) {
      if (type == 'front') {
        setState(() {
          _frontLoadType = LoadType.loading;
        });
        try {
          var response = await MineServer.upLoadImage(image);
          if (response != null) {
            setState(() {
              // 替换掉网络图片 response.data;
              _frontImage = response['data']['fileUrl'];
              _frontLoadType = LoadType.success;
            });
            Toast.showSuccess('${Tr.of(context).UploadSuccessfully}');
          } else {
            setState(() {
              _frontLoadType = LoadType.error;
            });
            Toast.showError('${Tr.of(context).UploadFailed}');
          }
        } catch (e) {
          setState(() {
            _frontLoadType = LoadType.error;
          });
          throw Exception(e);
        }
      }
    }
  }
  void _confirm() async {
    int tfaType = this.tfaType?.tfaType;
    if (_nameCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).c2cEnterNameHint;
      });
    } else if (_NumberCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).c2cEnterNumberHint;
      });
    }   else if ((tfaType == 3 || tfaType == 4 || tfaType == 5 || tfaType == 7) && _gcodeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).GoogleCodeHint;
      });
    } else if ((tfaType == 1 || tfaType == 3 || tfaType == 5 || tfaType == 6) && _codeCtr.text.isEmpty) {
      setState(() {
        isError = true;
        errorText = Tr.of(context).PhoneCodeHint;
      });
    } else if ((tfaType == 2 || tfaType == 4 || tfaType == 5 || tfaType == 6) && _ecodeCtr.text.isEmpty) {
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
        await C2cServer.bindAlipay(_nameCtr.text?? '', _NumberCtr.text ?? '', _frontImage,_codeCtr.text, _ecodeCtr.text, _gcodeCtr.text);
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