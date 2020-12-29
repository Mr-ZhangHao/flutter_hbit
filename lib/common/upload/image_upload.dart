/*
* @message: 身份认证图片上传组件
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-05-17 14:48:58
* @LastEditors: Jack
* @LastEditTime: 2020-09-04 18:13:51
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/common/upload/image_upload.dart
*/
import 'package:HBit/utils/screen.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// 基础组件 (可点击)
class CardImageBaseWidget extends StatelessWidget {
  const CardImageBaseWidget(
      {Key key, this.imageUrl, this.buttontext, this.loadWidget})
      : super(key: key);
  final imageUrl;
  final buttontext;
  final Widget loadWidget;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(1, 0),
      children: <Widget>[
        Container(
          height: height(250),
          width: width(300),
          alignment: Alignment(0, 0.8),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imageUrl), fit: BoxFit.fill)),
          child: Text(buttontext,
              style: TextStyle(color: Color(0xff808080), fontSize: sp(24))),
        ),
        loadWidget ?? SizedBox(height: 0),
      ],
    );
  }
}

// 加载失败组件
class LoadError extends StatelessWidget {
  const LoadError({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // 蒙版
      height: height(344),
      width: width(560),
      alignment: Alignment.center,
      color: Color.fromRGBO(0, 0, 0, 0.45),
      child: Icon(
        Icons.error_outline,
        size: sp(100),
      ),
    );
  }
}

// 正在加载组件 (不可点击)
class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // 蒙版
      height: height(344),
      width: width(560),
      alignment: Alignment.center,
      color: Color.fromRGBO(0, 0, 0, 0.45),
      child: CupertinoActivityIndicator(radius: width(20)),
    );
  }
}

// 图片加载中 (不可点击)
class CardImageLoadingWidget extends StatelessWidget {
  const CardImageLoadingWidget({Key key, this.imageUrl, this.buttontext})
      : super(key: key);
  final imageUrl;
  final buttontext;
  @override
  Widget build(BuildContext context) {
    return CardImageBaseWidget(
      imageUrl: imageUrl,

      buttontext: buttontext,
      loadWidget: Loading(),
    );
  }
}

// 图片加载失败
class CardImageLoadErrorWidget extends StatelessWidget {
  const CardImageLoadErrorWidget({Key key, this.imageUrl, this.buttontext})
      : super(key: key);
  final imageUrl;
  final buttontext;
  @override
  Widget build(BuildContext context) {
    return CardImageBaseWidget(
      imageUrl: imageUrl,
      buttontext: buttontext,
      loadWidget: LoadError(),
    );
  }
}

// 图片加载成功 (可点击)
class CardImageLoadSuccessWidget extends StatelessWidget {
  const CardImageLoadSuccessWidget({Key key, this.imageUrl, this.buttontext})
      : super(key: key);
  final imageUrl;
  final buttontext;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: height(344),
          width: width(560),
          child: ExtendedImage.network(
            imageUrl,
            fit: BoxFit.fitWidth,
            cache: false,
          ),
        ),
      ],
    );
  }
}
