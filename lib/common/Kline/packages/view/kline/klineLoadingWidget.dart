/*
 * @Description: 
 * @Author: zhaojijin
* @LastEditors: Roy
 * @Date: 2019-04-23 21:38:13
* @LastEditTime: 2020-05-26 11:50:18
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:HBit/common/Kline/packages/bloc/klineBloc.dart';
import 'package:HBit/common/Kline/packages/bloc/klineBlocProvider.dart';

class KlineLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    KlineBloc bloc = KlineBlocProvider.of<KlineBloc>(context);
    return StreamBuilder(
      stream: bloc.klineShowLoadingStream,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        bool show = snapshot.data == null ? true : snapshot.data;
        return Container(
            child: Center(child: show ? CupertinoActivityIndicator() : null));
      },
    );
  }
}
