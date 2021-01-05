/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-19 23:09:08
* @LastEditors: Jack
* @LastEditTime: 2020-09-04 18:44:32
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/mine/views/identity_auth2.dart
*/
import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/common/toast/index.dart';
import 'package:HBit/common/upload/image_upload.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/pages/mine/routes/index.dart';
import 'package:HBit/pages/mine/server/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class IdentityAuth2Page extends StatefulWidget {
  IdentityAuth2Page({Key key}) : super(key: key);

  @override
  _IdentityAuth2PageState createState() => _IdentityAuth2PageState();
}

enum LoadType { success, error, waiting, loading }

class _IdentityAuth2PageState extends State<IdentityAuth2Page> {
  LoadType _backLoadType = LoadType.waiting;
  LoadType _frontLoadType = LoadType.waiting;
  LoadType _shouLoadType = LoadType.waiting;

  String _frontImage;
  String _backImage;
  String _shouImage;

  @override
  Widget build(BuildContext context) {
    // MineProvider model = Provider.of<MineProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(Tr.of(context).authentication),
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
                onTap: () => confirm(model),
                child: child,
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: width(30), left: width(30)),
              child: Text(Tr.of(context).submit, style: TextStyle(color: kPrimaryColor, fontSize: sp(30))),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width(40)),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: height(20)),
                child: Text(Tr.of(context).IDNumberHint2),
              ),
              _cardFrontImage(),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: height(20)),
                child: Text(Tr.of(context).IDNumberHint3),
              ),
              _cardBackImage(),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: height(20)),
                child: Text(Tr.of(context).IDNumberHint4),
              ),
              _cardhandleImage(),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: height(20)),
                child: Text(Tr.of(context).UploadRequest, style: TextStyle(fontSize: sp(30), fontWeight: FontWeight.bold)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(Tr.of(context).UploadHint),
                  SizedBox(height: height(20)),
                  Text(Tr.of(context).UploadHint2),
                  SizedBox(height: height(20)),
                  Text(Tr.of(context).UploadHint3, style: TextStyle(color: kPrimaryColor)),
                ],
              ),
              SizedBox(height: height(20)),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: height(20)),
                child: Text(Tr.of(context).UploadHint4, style: TextStyle(fontSize: sp(30), fontWeight: FontWeight.bold)),
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
                        Text(Tr.of(context).standard)
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
                        Text(Tr.of(context).UploadHint5)
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
                        Text(Tr.of(context).UploadHint6)
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
                        Text(Tr.of(context).UploadHint7)
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
      Routers.goBack(context);

      //  Routers.push(context, MineRouter.mine, clearStack: true, replace: true);
    }
  }

  Widget _cardBackImage() {
    if (_backLoadType == LoadType.waiting) {
      return InkWell(
        onTap: () => _chooseCamereOrGallery('back'),
        child: CardImageBaseWidget(imageUrl: 'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).IDCardPhoto2}'),
      );
    } else if (_backLoadType == LoadType.loading) {
      return CardImageLoadingWidget(imageUrl:'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).IDCardPhoto2}');
    } else if (_backLoadType == LoadType.success) {
      return InkWell(
          onTap: () => _chooseCamereOrGallery('back'),
          child: CardImageLoadSuccessWidget(imageUrl: _backImage, buttontext: '${Tr.of(context).reUpload}'));
    } else {
      // error
      return InkWell(
          onTap: () => _chooseCamereOrGallery('back'),
          child: CardImageLoadErrorWidget(imageUrl: 'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).reUpload}'));
    }
  }

  Widget _cardFrontImage() {
    if (_frontLoadType == LoadType.waiting) {
      return InkWell(
        onTap: () => _chooseCamereOrGallery('front'),
        child: CardImageBaseWidget(imageUrl: 'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).IDCardPhoto}'),
      );
    } else if (_frontLoadType == LoadType.loading) {
      return CardImageLoadingWidget(imageUrl: 'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).IDCardPhoto}');
    } else if (_frontLoadType == LoadType.success) {
      return InkWell(
          onTap: () => _chooseCamereOrGallery('front'),
          child: CardImageLoadSuccessWidget(imageUrl: _frontImage, buttontext: '${Tr.of(context).reUpload}'));
    } else {
      // error
      return InkWell(
          onTap: () => _chooseCamereOrGallery('front'),
          child: CardImageLoadErrorWidget(imageUrl: 'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).reUpload}'));
    }
  }

  Widget _cardhandleImage() {
    if (_shouLoadType == LoadType.waiting) {
      return InkWell(
        onTap: () => _chooseCamereOrGallery('shou'),
        child: CardImageBaseWidget(imageUrl:'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).IDCardPhotoHint2}'),
      );
    } else if (_shouLoadType == LoadType.loading) {
      return CardImageLoadingWidget(imageUrl: 'images/c2c/c2c_upload.png', buttontext: '${Tr.of(context).IDCardPhotoHint2}');
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
    print("image1:"+image.path);

    if (image != null) {
      print("image2:"+image.path);

      if (type == 'back') {
        setState(() {
          _backLoadType = LoadType.loading;
        });
        try {
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
      print("image:"+image.path);
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
            child: Container(child: Text(Tr.of(context).IDCard), width: double.infinity, alignment: Alignment.center),
          ),
          Divider(color: Color(0xffcccccc), height: 0.5, indent: width(40), endIndent: width(40)),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {onTab('2')},
            child: Container(child: Text(Tr.of(context).Passport), width: double.infinity, alignment: Alignment.center),
          ),
        ],
      ),
    );
  }
}
