/*
* @message: 描述
* @Author: Mike
* @Email: mike@google.com
* @Github: mike@google.com
* @Date: 2020-03-24 10:08:21
* @LastEditors: Jack
* @LastEditTime: 2020-09-03 20:16:57
* @Deprecated: 否
* @FilePath: /etf_flutter/lib/providers/provider_manager.dart
*/
import 'package:HBit/pages/c2c/provider/index.dart';
import 'package:HBit/pages/contract/provider/contract_common_provider.dart';
import 'package:HBit/pages/home/provider/index.dart';
import 'package:HBit/pages/login/provider/user_provider.dart';
import 'package:HBit/pages/mine/provider/mine_provider.dart';
import 'package:HBit/pages/wallet/provider/index.dart';
import 'package:HBit/providers/local_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:HBit/providers/gloable_provider.dart';
import 'package:HBit/providers/theme_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ChangeNotifierProvider(create: (_) => GloableProvider()),
  ChangeNotifierProvider(create: (_) => UserProvider()),
  ChangeNotifierProvider(create: (_) => MineProvider()),
  ChangeNotifierProvider(create: (_) => WallerProvider()),
  ChangeNotifierProvider(create: (_) => ContractAssetProvider()),
  ChangeNotifierProvider(create: (_) => ContractCommonProvider()),
  ChangeNotifierProvider(create: (_) => HomeProvider()),
  ChangeNotifierProvider(create: (_) => LocalProvider()),
  ChangeNotifierProvider(create: (_) => C2cProvider()),

];
