/*
* @message: 适用于圆形的头像
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-08 13:33:07
* @LastEditors: Jack
* @LastEditTime: 2020-08-10 12:35:58
* @Deprecated: 否
* @FilePath: /ETF/lib/components/avatar/index.dart
*/
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:HBit/utils/screen.dart';

class ImageWidget extends StatelessWidget {
  final double w;
  final double h;
  final String img;

  const ImageWidget({
    Key key,
    this.w,
    this.h,
    this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.asset(
      img,
      width: width(w),
      height: height(h),
      fit: BoxFit.cover,
      // cache: true,
      shape: BoxShape.circle,
      borderRadius: BorderRadius.all(Radius.circular(height(40))),
      border: Border.all(color: Color(0xffffffff), width: width(1)),
      loadStateChanged: (ExtendedImageState state) {
        if (state.extendedImageLoadState == LoadState.completed) {
          return ExtendedRawImage(
            image: state.extendedImageInfo?.image,
            fit: BoxFit.cover,
          );
        } else {
          return Image.asset(img);
        }
      },
    );
  }
}
