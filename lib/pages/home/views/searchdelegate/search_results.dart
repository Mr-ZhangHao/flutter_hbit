import 'package:HBit/pages/home/provider/index.dart';
import 'package:HBit/providers/provider_widget.dart';
import 'package:HBit/providers/view_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchResults extends StatelessWidget {
  final String coinName;
  const SearchResults({Key key, this.coinName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, model, child) {
        return ListView.builder(
            itemCount: model.historyCoins.length,
            itemBuilder: (context, index) {
              // TradeByModel item = model.list[index];
              return Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color(0xfff2f2f2)))),
                child: ListTile(
                  title: Text('Item  $index'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              );
            });
      },
    );
  }
}
