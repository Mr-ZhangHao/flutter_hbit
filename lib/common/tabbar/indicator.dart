import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarIndicator extends Decoration {
  /// Create an underline style selected tab indicator.
  ///
  /// The [borderSide] and [insets] arguments must not be null.
  const TabBarIndicator({
    this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
  })  : assert(borderSide != null),
        assert(insets != null);

  /// The color and weight of the horizontal line drawn below the selected tab.
  final BorderSide borderSide;

  /// Locates the selected tab's underline relative to the tab's boundary.
  ///
  /// The [TabBar.indicatorSize] property can be used to define the
  /// tab indicator's bounds in terms of its (centered) tab widget with
  /// [TabIndicatorSize.label], or the entire tab with [TabIndicatorSize.tab].
  final EdgeInsetsGeometry insets;

  @override
  _UnderlinePainter createBoxPainter([VoidCallback onChanged]) {
    return _UnderlinePainter(this, onChanged);
  }
}

class _UnderlinePainter extends BoxPainter {
  Gradient gradient;

  _UnderlinePainter(this.decoration, VoidCallback onChanged)
      : _paint = Paint()
          ..color = Color(0xff126DFF)
          ..isAntiAlias = true
          ..style = PaintingStyle.fill //绘画风格，默认为填充
          ..filterQuality = FilterQuality.high //颜色渲染模式的质量
          ..strokeWidth = 15.0,
        //画笔的宽度
        assert(decoration != null),
        super(onChanged);

  final TabBarIndicator decoration;
  final Paint _paint;

  BorderSide get borderSide => decoration.borderSide;

  EdgeInsetsGeometry get insets => decoration.insets;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
//    final Offset circleOffset =
//        offset + Offset(cfg.size.width / 2, cfg.size.height - radius - 5);
    //用Rect构建一个矩形
    var width = configuration.size.width;
    var height = configuration.size.height;

    Rect rect = Rect.fromPoints(offset + Offset(width / 2 - 10, height),
        offset + Offset(width / 2 + 10, height - 2.67));
    //根据上面的矩形,构建一个圆角矩形
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(4));

    canvas.drawRRect(rrect, _paint);

//    canvas.drawCircle(circleOffset, 3, _paint);
  }
}
