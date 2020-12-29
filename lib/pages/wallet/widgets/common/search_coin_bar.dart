import 'package:HBit/common/i18n/i18n.dart';
import 'package:HBit/constants/index.dart';
import 'package:HBit/pages/wallet/provider/index.dart';
import 'package:HBit/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchCoinBarWidget extends StatelessWidget {
  const SearchCoinBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(48),
      margin: EdgeInsets.symmetric(horizontal: width(40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(),
          // Container(
          //     child: GestureDetector(
          //   behavior: HitTestBehavior.opaque,
          //   onTap: () => Routers.push(context, WalletRouter.withdraw),
          //   child: Row(
          //     children: <Widget>[
          //       Container(
          //         height: width(36),
          //         width: width(36),
          //         child: Icon(Icons.search, size: sp(36), color: Color(0xffC2C2C2)),
          //       ),
          //       Container(
          //         child: Text('搜索币种',
          //             textAlign: TextAlign.left, style: TextStyle(color: kTextColor7, fontSize: sp(28), height: 1.1)),
          //       )
          //     ],
          //   ),
          // )),
          Container(
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Provider.of<WallerProvider>(context, listen: false)
                        .setIsHidden(!Provider.of<WallerProvider>(context, listen: false).isHidden);
                    Provider.of<ContractAssetProvider>(context, listen: false)
                        .setIsHidden(!Provider.of<ContractAssetProvider>(context, listen: false).isHidden);
                  },
                  child: Container(
                    width: width(24),
                    height: width(24),
                    margin: EdgeInsets.only(right: width(12)),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Provider.of<WallerProvider>(context).isHidden
                            ? AssetImage('images/mine/checked@2x.png')
                            : AssetImage('images/mine/check@2x.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                // Checkbox(
                //   onChanged: (bool value) {
                //     Provider.of<WallerProvider>(context, listen: false).setIsHidden(value);
                //     Provider.of<ContractAssetProvider>(context, listen: false).setIsHidden(value);
                //   },
                //   value: Provider.of<WallerProvider>(context).isHidden,
                // ),
                Container(
                  child:
                      Text('${Tr.of(context).assetHide}', textAlign: TextAlign.left, style: TextStyle(color: kTextColor7, fontSize: sp(24))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
