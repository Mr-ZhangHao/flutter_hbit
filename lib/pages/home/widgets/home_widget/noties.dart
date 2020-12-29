/*
* @message: 首页通知栏
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-10 15:48:21
* @LastEditors: Roy
* @LastEditTime: 2020-10-26 15:43:40
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/pages/home/widgets/home_widget/noties.dart
*/
import 'package:HBit/pages/home/provider/index.dart';
import 'package:HBit/pages/home/routes/index.dart';
import 'package:HBit/routes/fluro_navigator.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class NoticesBarWidget extends StatelessWidget {
  final double h;
  const NoticesBarWidget({
    Key key,
    this.h,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(left: width(40), right: width(40), top: width(20), bottom: width(20)),
        padding: EdgeInsets.symmetric(horizontal: width(40)),
        alignment: Alignment.center,
        height: width(76),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color(0x80DFDFDF)),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/home/gg.png', fit: BoxFit.fill, width: width(40), height: width(40)),
            Consumer<HomeProvider>(
              builder: (BuildContext context, HomeProvider model, Widget child) {
                return Expanded(
                    child: Container(
                  height: width(64),
                  child: Swiper(
                    scrollDirection: Axis.vertical,
                    itemCount: model.notices.length ?? 0,
                    autoplay: true,
                    autoplayDelay: 3000,
                    autoplayDisableOnInteraction: true,
                    duration: 300,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Routers.goWebViewPage(context, model.notices[index].title, model.notices[index].htmlUrl);
                        },
                        child: Container(
                          height: width(86),
                          margin: EdgeInsets.only(left: width(20)),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            model.notices[index]?.title ?? '公告',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                  ),
                ));
              },
            ),

            // GestureDetector(
            //   onTap: () {},
            //   child: Text('更多',
            //       style: TextStyle(color: kPrimaryColor, fontSize: sp(24))),
            // )
          ],
        ),
      ),
    );
  }
}
