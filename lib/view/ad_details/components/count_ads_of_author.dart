import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/selected_ad.dart';
import '../../../res/strings.dart';
import '../functions/ad_details_functions.dart';

class CountAdsOfAuthor extends StatelessWidget {
  const CountAdsOfAuthor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAd = context.read<SelectedAd>().ad;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 8),
      child: FutureBuilder(
        future: AdDetailsFunctions.getAdsOfAuthorQuantity(currentAd!),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            int quantity = snapshot.data;
            if (quantity > 0) {
              const style = TextStyle(fontSize: 16);
              return quantity > 1
                  ? AutoSizeText(
                      "$quantity ${Strings.kAdsOf} ${currentAd.name!}",
                      style: style,
                      maxLines: 2,
                    )
                  : AutoSizeText(
                      "$quantity ${Strings.kAdOf} ${currentAd.name!}",
                      style: style,
                      maxLines: 2,
                    );
            }
          }
          return const CupertinoActivityIndicator();
        },
      ),
    );
  }
}
