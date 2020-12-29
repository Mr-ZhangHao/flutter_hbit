/*
* @message: 首页轮播图
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 15:49:32
* @LastEditors: Roy
* @LastEditTime: 2020-10-26 15:19:39
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/widgets/home_widget/banner.dart
*/
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/home/provider/index.dart';
import 'package:HBit/providers/provider_widget.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'custom_swiper_pagination.dart';

class AppBarBanner extends StatelessWidget {
  final Widget child;
  final double h;
  const AppBarBanner({
    Key key,
    this.child,
    this.h,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: height(210),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF00D8FF),
                  Color(0xFF003BCF),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

/// 卡片背景
class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 40);
    path.quadraticBezierTo(width / 2, height, width, height - 40);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SwiperBanner extends StatefulWidget {
  const SwiperBanner({
    Key key,
  }) : super(key: key);

  @override
  _SwiperBannerState createState() => _SwiperBannerState();
}

class _SwiperBannerState extends State<SwiperBanner> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((mag) {
    //   Provider.of<HomeProvider>(context, listen: false).getBanner();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<HomeProvider>(
      model: HomeProvider(),
      onModelReady: (model) => model.getBanner(),
      builder: (BuildContext context, HomeProvider model, Widget child) {
        if (model.isIdle) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: width(40)),
            height: width(320),
            child: Swiper(
              autoplay: true,
              // viewportFraction: 0.85,
              fade: 1,
              scale: 0.95,
              itemCount: model.banner?.length ?? 0,
              autoplayDisableOnInteraction: true,
              autoplayDelay: 5000,
              duration: 1000,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Routers.goWebViewPage(context, '', model.banner[index].link);
                  },
                  child: ExtendedImage.network(
                    model.banner[index].picture,
                    fit: BoxFit.fitWidth,
                    cache: true,
                    shape: BoxShape.rectangle,
                    height: width(320),
                    borderRadius: BorderRadius.all(Radius.circular(width(12))),
                    loadStateChanged: (ExtendedImageState state) {
                      if (state.extendedImageLoadState == LoadState.completed) {
                        return ExtendedRawImage(
                          image: state.extendedImageInfo?.image,
                        );
                      } else {
                        return CupertinoActivityIndicator(animating: true);
                      }
                    },
                  ),
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(12),
                  //       image: DecorationImage(image: NetworkImage(model.banner[index].picture), fit: BoxFit.fitWidth)),
                  // ),
                );
              },
              // pagination: CustomSwiperPagination()
              pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: CustomSwiperPagination(
                      activeColor: kPrimaryColor, size: Size(width(20), 3.0), activeSize: Size(10.0, 3.0))),
            ),
          );
        } else {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: width(40)),
            height: width(320),
            child: CupertinoActivityIndicator(),
          );
        }
      },
    );
  }
}
