import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import '../../../res/strings.dart';
import '../all_france_ads_function.dart';

class CountAllAds extends StatelessWidget {
  const CountAllAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 8),
      child: FutureBuilder(
          future: AllFranceAdsFunction.getAllAdsNumber(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              int quantity = snapshot.data;
              if (quantity > 0) {
                const style = TextStyle(fontSize: 16);
                return quantity > 1
                    ? AutoSizeText(
                        "$quantity ${Strings.kAdsIn} ${Strings.kAllFrance}",
                        style: style,
                        maxLines: 2,
                      )
                    : AutoSizeText(
                        "$quantity ${Strings.kAdIn} ${Strings.kAllFrance}}",
                        style: style,
                        maxLines: 2,
                      );
              }
            }
            return const CupertinoActivityIndicator();
          }),
    );
  }
}
