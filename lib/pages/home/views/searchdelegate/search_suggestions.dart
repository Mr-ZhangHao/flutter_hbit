import 'package:flutter/material.dart';

/// TODO 可以显示一些热门币种名称
class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SizedBox(height: 0),
    );
  }
}
