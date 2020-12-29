import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HBit/utils/screen.dart';

import 'view_state.dart';

class ViewStateBusyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Center(child: CupertinoActivityIndicator(radius: width(20))),
    );
  }
}

class ViewStateWidget extends StatelessWidget {
  final String title;
  final String message;
  final Widget image;
  final Widget buttonText;
  final String buttonTextData;
  final VoidCallback onPressed;

  ViewStateWidget(
      {Key key, this.image, this.title, this.message, this.buttonText, @required this.onPressed, this.buttonTextData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleStyle = Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey);
    var messageStyle = titleStyle.copyWith(color: titleStyle.color.withOpacity(0.7), fontSize: sp(15));
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(30), vertical: height(30)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  title ?? '加载失败',
                  style: titleStyle,
                ),
                Container(
                  child: image ?? Image.asset('images/mian/empty.png', fit: BoxFit.fill),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: height(100), minHeight: height(50)),
                  child: SingleChildScrollView(
                    child: Text(message ?? '', style: messageStyle),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: ViewStateButton(
              child: buttonText,
              textData: buttonTextData,
              onPressed: this.onPressed,
            ),
          ),
        ],
      ),
    );
  }
}

/// ErrorWidget 接口报错View
class ViewStateErrorWidget extends StatelessWidget {
  final ViewStateError error;
  final String title;
  final String message;
  final Widget image;
  final Widget buttonText;
  final String buttonTextData;
  final VoidCallback onPressed;

  const ViewStateErrorWidget({
    Key key,
    @required this.error,
    this.image,
    this.title,
    this.message,
    this.buttonText,
    this.buttonTextData,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultImage;
    var defaultTitle;
    var errorMessage = error.message;
    String defaultTextData = '刷新一下';
    switch (error.errorType) {
      case ViewStateErrorType.networkTimeOutError:
        // defaultImage = Transform.translate(
        //   offset: Offset(0, 0),
        //   child: ImageIcon(AssetImage('images/home/empty.png'), size: sp(150)),
        // );
        defaultImage = Image.asset('images/home/empty.png', width: width(361), height: width(362));
        defaultTitle = '加载失败,请检查网络';
        errorMessage = '网络连接异常,请检查网络或稍后重试'; // 网络异常移除message提示
        break;
      case ViewStateErrorType.defaultError:
        errorMessage = '网络似乎有点问题';
        defaultImage = Image.asset('images/home/empty.png', width: width(361), height: width(362));
        defaultTitle = '加载失败';
        break;
    }

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      color: Theme.of(context).primaryColor,
      child: ViewStateWidget(
        onPressed: this.onPressed,
        image: image ?? defaultImage,
        title: title ?? defaultTitle,
        message: message ?? errorMessage,
        buttonTextData: buttonTextData ?? defaultTextData,
        buttonText: buttonText,
      ),
    );
  }
}

class ViewStateEmptyWidget extends StatelessWidget {
  final String message;
  final Widget image;
  final Widget buttonText;
  final VoidCallback onPressed;

  const ViewStateEmptyWidget({Key key, this.image, this.message, this.buttonText, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewStateWidget(
      onPressed: this.onPressed,
      image: image ??
          Image.asset(
            'images/home/empty.png',
            width: width(464),
            height: height(374),
            fit: BoxFit.fill,
          ),
      title: message ?? '',
      buttonText: buttonText,
      buttonTextData: '刷新一下',
    );
  }
}

class ViewStateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final String textData;

  const ViewStateButton({@required this.onPressed, this.child, this.textData});
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: child ??
          Text(
            textData ?? '重试',
            style: TextStyle(wordSpacing: 5),
          ),
      textColor: Colors.grey,
      splashColor: Theme.of(context).splashColor,
      onPressed: onPressed,
      highlightedBorderColor: Theme.of(context).splashColor,
    );
  }
}
