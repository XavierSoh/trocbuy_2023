import 'package:flutter/material.dart';

class AdsAroundMeCount extends StatelessWidget {
  const AdsAroundMeCount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // Padding(
    //   padding: const EdgeInsets.only(bottom: 16.0, left: 8),
    //   child: FutureBuilder(
    //       future: AroundMeFunctions.getAroundMeQuantity(),
    //       builder: (BuildContext context, AsyncSnapshot snapshot) {
    //         if (snapshot.hasData) {
    //           int quantity = snapshot.data;
    //           if (quantity > 0) {
    //             const style = TextStyle(fontSize: 16);
    //             return quantity > 1
    //                 ? AutoSizeText(
    //                     "$quantity ${Strings.kAdsFoundArroundMe}",
    //                     style: style,
    //                     maxLines: 2,
    //                   )
    //                 : AutoSizeText(
    //                     "$quantity ${Strings.kAdFoundArroundMe}",
    //                     style: style,
    //                     maxLines: 2,
    //                   );
    //           } else {
    //             return const SizedBox.shrink();
    //           }
    //         }
    //         return const CupertinoActivityIndicator();
    //       }),
    // );
  }
}
