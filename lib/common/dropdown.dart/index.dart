import 'package:HBit/constants/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class DropDownMenuRouteLayout extends SingleChildLayoutDelegate {
  final Rect position;
  final double menuHeight;

  DropDownMenuRouteLayout({this.position, this.menuHeight});

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(Size(position.right - position.left, 300));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0, position.bottom);
  }

  @override
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}

class DropDownMenuRoute<T> extends PopupRoute {
  final Rect position;
  final List<Map<dynamic, String>> items;
  final double itemHeight;
  final Function(dynamic value) onItemTab;

  DropDownMenuRoute({@required this.position, this.onItemTab, this.itemHeight, @required this.items});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return CustomSingleChildLayout(
      delegate: DropDownMenuRouteLayout(position: position),
      child: SizeTransition(
        sizeFactor: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
        child: Material(
          color: kTransprant,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
                children: items
                    .asMap()
                    .keys
                    .map((e) => GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => onItemTab(items[e]),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(bottom: BorderSide(color: Color(0xfff8f8f8), width: 1))),
                            height: itemHeight,
                            padding: EdgeInsets.symmetric(horizontal: width(itemHeight)),
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            child: Text(items[e]['text']),
                          ),
                        ))
                    .toList()),
          ),
        ),
      ),
    );
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 200);
}

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    Key key,
    @required GlobalKey<State<StatefulWidget>> globalKey,
    this.value,
    this.style,
    this.itemHeight,
    this.dropdownColor,
    @required this.onChanged,
    this.items,
  })  : _globalKey = globalKey,
        super(key: key);

  final GlobalKey<State<StatefulWidget>> _globalKey;
  final String value;
  final TextStyle style;
  final double itemHeight;
  final Color dropdownColor;
  final ValueChanged onChanged;
  final List<Map<dynamic, String>> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _globalKey,
      height: height(50),
      child: Material(
        color: Colors.transparent,
        shadowColor: Colors.black54,
        child: InkWell(
          onTap: () {
            RenderBox renderBox = _globalKey.currentContext.findRenderObject();
            Rect box = renderBox.localToGlobal(Offset.zero) & renderBox.size;
            print(box);
            Navigator.push(
                context,
                DropDownMenuRoute(
                  position: box,
                  items: items,
                  onItemTab: (value) {
                    onChanged(value);
                  },
                  itemHeight: height(80),
                ));
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: width(30)),
                  Text(
                    value,
                    style: TextStyle(fontSize: 16, color: Color(0xff333333)),
                  ),
                  Icon(Icons.arrow_drop_down, size: 24, color: Colors.black),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
