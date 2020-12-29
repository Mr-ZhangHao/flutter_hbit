/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 23:09:08
* @LastEditors: Jack
* @LastEditTime: 2020-09-04 18:49:39
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/views/identity_auth3.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/common/upload/image_upload.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/pages/mine/server/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:HBit/pages/mine/routes/index.dart';

class IdentityAuth3Page extends StatefulWidget {
  IdentityAuth3Page({Key key}) : super(key: key);

  @override
  _IdentityAuth3PageState createState() => _IdentityAuth3PageState();
}

enum LoadType { success, error, waiting, loading }

class _IdentityAuth3PageState extends State<IdentityAuth3Page> {
  LoadType _backLoadType = LoadType.waiting;
  LoadType _frontLoadType = LoadType.waiting;
  LoadType _shouLoadType = LoadType.waiting;

  dynamic _frontImage;
  dynamic _backImage;
  dynamic _shouImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('${Tr.of(context).CertificateAuthentication}'),
        centerTitle: true,
        elevation: 1,
        leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Routers.goBack(context),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('images/mine/back@2x.png', width: width(22), height: height(36)),
            )),
        actions: <Widget>[
          Consumer<MineProvider>(
            builder: (BuildContext context, MineProvider model, Widget child) {
              return InkWell(
                onTap: () {
                 // print(model.vertifyFiled.country);
                //  print(model.vertifyFiled.firstName);
                //  print(model.vertifyFiled.idNumber);
                //  print(model.vertifyFiled.idType);
                //  print(model.vertifyFiled.lastName);
                  confirm(model);
                },
                child: child,
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: width(30), left: width(30)),
              child: Text('${Tr.of(context).submit}', style: TextStyle(color: kPrimaryColor, fontSize: sp(30))),
            )),
        ]
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width(40)),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: height(20)),
                child: Text('${Tr.of(context).uploadPassport}：'),
              ),
              _cardFrontImage(),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: height(20)),
                child: Text('${Tr.of(context).uploadPassport2}：'),
              ),
              _cardBackImage(),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: height(20)),
                child: Text('${Tr.of(context).uploadPassport3}：'),
              ),
              _cardhandleImage(),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: height(20)),
                child: Text('${Tr.of(context).UploadRequest}', style: TextStyle(fontSize: sp(30), fontWeight: FontWeight.bold)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('*${Tr.of(context).uploadPassport5}'),
                  SizedBox(height: height(20)),
                  Text('*${Tr.of(context).uploadPassport6}'),
                  SizedBox(height: height(20)),
                  Text('*${Tr.of(context).uploadPassport7}', style: TextStyle(color: kPrimaryColor)),
                ],
              ),
              SizedBox(height: height(20)),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: height(20)),
                child: Text('${Tr.of(context).UploadHint4}', style: TextStyle(fontSize: sp(30), fontWeight: FontWeight.bold)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'images/mine/tips1.png',
                          width: width(150),
                          height: height(90),
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: height(20)),
                        Text('${Tr.of(context).standard}')
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'images/mine/tips2.png',
                          width: width(150),
                          height: height(90),
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: height(20)),
                        Text('${Tr.of(context).UploadHint5}')
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'images/mine/tips3.png',
                          width: width(150),
                          height: height(90),
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: height(20)),
                        Text('${Tr.of(context).UploadHint6}')
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'images/mine/tips4.png',
                          width: width(150),
                          height: height(90),
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: height(20)),
                        Text('${Tr.of(context).UploadHint7}')
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height(100))
            ],
          ),
        ),
      ),
    );

  }
  confirm(MineProvider model) async {
    if (_frontImage.isEmpty) {
      Toast.showText(Tr.of(context).IDNumberHint2);
    } else if (_backImage.isEmpty) {
      Toast.showText(Tr.of(context).IDNumberHint2);
    } else if (_shouImage.isEmpty) {
      Toast.showText(Tr.of(context).IDNumberHint4);
    } else {
      Toast.showLoading('loading...');
      Map data = {
        "passport_type": model.vertifyFiled.idType,
        "country": model.vertifyFiled.country,
        "name": model.vertifyFiled.firstName,
        "family_name": model.vertifyFiled.lastName,
        "passport_id": model.vertifyFiled.idNumber,
        "passport_front": _frontImage,
        "passport_back": _backImage,
        "passport_image": _shouImage
      };
      await MineServer.vertifySubmit(data);
      setState(() {
        _backLoadType = LoadType.waiting;
        _frontLoadType = LoadType.waiting;
        _shouLoadType = LoadType.waiting;
        _frontImage = "";
        _backImage = "";
        _shouImage = "";
      });
      Toast.showText("已提交,请等待审核");
      model.getUserInfo();
      Routers.push(context, MineRouter.mine, clearStack: true, replace: true);
    }
  }
  _handlerCertify() async {
    // if (_usernameValue == null || _usernameValue == '') {
    //   Toast.showText("请填写您的真实姓名");
    // } else if (_idNumValue == null || _idNumValue == '') {
    //   Toast.showText("请填写您的身份证号码");
    // } else if (_frontImage == null || _frontImage == '') {
    //   Toast.showText("请上传身份证正面");
    // } else if (_backImage == null || _backImage == '') {
    //   Toast.showText("请上传身份证反面");
    // } else {
    //   Toast.showLoading('loading...');
    //   await MineServer.userCert(
    //       _usernameValue, _idNumValue, _frontImage, _backImage);
    //   Toast.showText("已提交,请等待审核");
    //   NavigatorUtils.goBackWithParams(context, LoadType.success);
    // }
  }

  Widget _cardBackImage() {
    if (_backLoadType == LoadType.waiting) {
      return InkWell(
        onTap: () => _chooseCamereOrGallery('back'),
        child: CardImageBaseWidget(imageUrl: 'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).uploadPassport2}'),
      );
    } else if (_backLoadType == LoadType.loading) {
      return CardImageLoadingWidget(imageUrl: 'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).uploadPassport2}');
    } else if (_backLoadType == LoadType.success) {
      return InkWell(
          onTap: () => _chooseCamereOrGallery('back'),
          child: CardImageLoadSuccessWidget(imageUrl: _backImage, buttontext: '${Tr.of(context).reUpload}'));
    } else {
      // error
      return InkWell(
          onTap: () => _chooseCamereOrGallery('back'),
          child: CardImageLoadErrorWidget(imageUrl: '', buttontext: '${Tr.of(context).reUpload}'));
    }
  }

  Widget _cardFrontImage() {
    if (_frontLoadType == LoadType.waiting) {
      return InkWell(
        onTap: () => _chooseCamereOrGallery('front'),
        child: CardImageBaseWidget(imageUrl: 'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).uploadPassport}'),
      );
    } else if (_frontLoadType == LoadType.loading) {
      return CardImageLoadingWidget(imageUrl: 'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).uploadPassport}');
    } else if (_frontLoadType == LoadType.success) {
      return InkWell(
          onTap: () => _chooseCamereOrGallery('front'),
          child: CardImageLoadSuccessWidget(imageUrl: _frontImage, buttontext: '${Tr.of(context).reUpload}'));
    } else {
      // error
      return InkWell(
          onTap: () => _chooseCamereOrGallery('front'),
          child: CardImageLoadErrorWidget(imageUrl: '', buttontext: '${Tr.of(context).reUpload}'));
    }
  }

  Widget _cardhandleImage() {
    if (_shouLoadType == LoadType.waiting) {
      return InkWell(
        onTap: () => _chooseCamereOrGallery('shou'),
        child: CardImageBaseWidget(imageUrl: 'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).uploadPassport3}'),
      );
    } else if (_shouLoadType == LoadType.loading) {
      return CardImageLoadingWidget(imageUrl: 'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).uploadPassport3}');
    } else if (_shouLoadType == LoadType.success) {
      return InkWell(
          onTap: () => _chooseCamereOrGallery('shou'),
          child: CardImageLoadSuccessWidget(imageUrl: _shouImage, buttontext: '${Tr.of(context).reUpload}'));
    } else {
      // error
      return InkWell(
          onTap: () => _chooseCamereOrGallery('shou'),
          child: CardImageLoadErrorWidget(imageUrl: 'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).reUpload}'));
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
                      Image.asset('images/mine/camera.png', width: width(56), height: height(50)),
                      SizedBox(width: width(10)),
                      Text("${Tr.of(context).TakePictures}", style: TextStyle(color: Color(0xff323232))),
                    ],
                  ),
                ),
                onTap: () async {
                  _takePhoto(type, 'camera');
                  Navigator.pop(context);
                },
              ),
              Divider(height: 1, color: Color(0xffE6E6E6), indent: width(40), endIndent: width(40)),
              ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/mine/galery.png', width: width(56), height: height(50)),
                      SizedBox(width: width(10)),
                      Text("${Tr.of(context).PhotoAlbum}", style: TextStyle(color: Color(0xff323232))),
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
        ? await ImagePicker.pickImage(source: ImageSource.camera, maxHeight: 800, maxWidth: 800, imageQuality: 50)
        : await ImagePicker.pickImage(source: ImageSource.gallery, maxHeight: 800, maxWidth: 800, imageQuality: 50);
    if (image != null) {
      if (type == 'back') {
        setState(() {
          _backLoadType = LoadType.loading;
        });
        try {
          // Timer(new Duration(seconds: 4), () {
          //   // 只在倒计时结束时回调
          //   // print('身份证反面$response');
          //   setState(() {
          //     _backLoadType = LoadType.success;
          //     // 替换掉网络图片 response.data;
          //     _backImage =
          //         'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=246344103,1969471735&fm=26&gp=0.jpg';
          //   });
          //   Toast.showSuccess('上传成功');
          //   // if (response != null) {
          //   //   Toast.showSuccess('上传成功');
          //   // } else {
          //   //   Toast.showError('上传失败');
          //   // }
          // });

          var response = await MineServer.upLoadImage(image);
          print('身份证反面$response');
          if (response != null) {
            setState(() {
              _backLoadType = LoadType.success;
              // 替换掉网络图片 response.data;
              _backImage = response['data']['fileUrl'];
            });
            Toast.showSuccess('${Tr.of(context).UploadSuccessfully}');
          } else {
            _backLoadType = LoadType.success;
            Toast.showError('${Tr.of(context).UploadFailed}');
          }
        } catch (e) {
          setState(() {
            _backLoadType = LoadType.error;
          });
          throw Exception(e);
        }
      } else if (type == 'front') {
        setState(() {
          _frontLoadType = LoadType.loading;
        });
        try {
          var response = await MineServer.upLoadImage(image);
          print('身份证正面$response');
          if (response != null) {
            setState(() {
              _frontLoadType = LoadType.success;
              // 替换掉网络图片 response.data;
              _frontImage = response['data']['fileUrl'];
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
      } else {
        setState(() {
          _shouLoadType = LoadType.loading;
        });
        try {
          var response = await MineServer.upLoadImage(image);
          print('手持证件正面$response');
          if (response != null) {
            setState(() {
              _shouLoadType = LoadType.success;
              // 替换掉网络图片 response.data;
              _shouImage = response['data']['fileUrl'];
            });
            Toast.showSuccess('${Tr.of(context).UploadSuccessfully}');
          } else {
            setState(() {
              _shouLoadType = LoadType.error;
            });
            Toast.showError('${Tr.of(context).UploadFailed}');
          }
        } catch (e) {
          setState(() {
            _shouLoadType = LoadType.error;
          });
          throw Exception(e);
        }
      }
    } else {
      return;
    }
  }
}

class IdentityTypeWidget extends StatelessWidget {
  final Function(String) onTab;
  const IdentityTypeWidget({
    Key key,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {onTab('1')},
            child: Container(child: Text('身份证'), width: double.infinity, alignment: Alignment.center),
          ),
          Divider(color: Color(0xffcccccc), height: 0.5, indent: width(40), endIndent: width(40)),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {onTab('2')},
            child: Container(child: Text('护照'), width: double.infinity, alignment: Alignment.center),
          ),
        ],
      ),
    );
  }
}
