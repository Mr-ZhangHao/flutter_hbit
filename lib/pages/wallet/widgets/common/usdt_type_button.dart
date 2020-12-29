import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';

class ChooseChainTypeWidget extends StatefulWidget {
  final Function(String type) onTab;
  const ChooseChainTypeWidget({
    Key key,
    this.onTab,
  }) : super(key: key);

  @override
  _ChooseChainTypeWidgetState createState() => _ChooseChainTypeWidgetState();
}

class _ChooseChainTypeWidgetState extends State<ChooseChainTypeWidget> {
  List usdtTypes = ['ERC20'/*, 'TRC20', 'OMNI'*/];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: height(32)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text('${Tr.of(context).assetChainname}', style: TextStyle(color: Color(0xff323232), fontSize: sp(28))),
          ),
          Row(
              children: usdtTypes.asMap().keys.map((index) {
            return InkWell(
              onTap: () {
                setState(() => currentIndex = index);
                widget.onTab(usdtTypes[index]);
              },
              child: UsdtTypeButton(
                  type: usdtTypes[index], color: index == currentIndex ? kPrimaryColor : Color(0xffd4d4d4)),
            );
          }).toList())
        ],
      ),
    );
  }
}

class UsdtTypeButton extends StatelessWidget {
  final String type;
  final Color color;
  const UsdtTypeButton({
    Key key,
    this.type,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(140),
      height: height(50),
      margin: EdgeInsets.only(left: width(20)),
      alignment: Alignment.center,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(width(2)), border: Border.all(color: color, width: 1)),
      child: Text(type, style: TextStyle(color: color, fontSize: sp(28))),
    );
  }
}
