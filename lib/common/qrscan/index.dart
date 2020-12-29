/*
* @message: 文件描述
* @Author: Jack
* @Email: Jack@163.com
* @Github: Jack@163.com
* @Date: 2020-08-11 12:18:03
* @LastEditors: Jack
* @LastEditTime: 2020-08-11 16:02:55
* @Deprecated: 否
* @FilePath: /ETF/lib/components/qrscan/index.dart
*/
import 'package:HBit/constants/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class QrScanCode extends StatefulWidget {
  final String image;
  final Function callback;
  QrScanCode({Key key, this.image, @required this.callback}) : super(key: key);

  @override
  _QrScanCodeState createState() => _QrScanCodeState();
}

class _QrScanCodeState extends State<QrScanCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: null == widget.image
            ? Icon(Icons.photo_camera, color: Colors.white)
            : ImageIcon(
                AssetImage(widget.image),
                color: kPrimaryColor,
                size: sp(80),
              ),
        onPressed: () {
          scan();
        },
      ),
    );
  }

  scan() async {
    var options = ScanOptions();
    ScanResult result = await BarcodeScanner.scan(options: options);
    widget.callback(result.rawContent);
  }
}
