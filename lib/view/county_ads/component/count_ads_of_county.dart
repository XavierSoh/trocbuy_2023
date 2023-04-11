import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/county.dart';
import '../../../providers/selected_county.dart';
import '../../../res/strings.dart';
import '../../ad_details/functions/ad_details_functions.dart';

class CountAdsOfCounty extends StatelessWidget {
  const CountAdsOfCounty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final County county = context.read<SelectedCounty>().county;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 8),
      child: FutureBuilder(
        future: AdDetailsFunctions.getAdsOfCountyQuantity(county),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            int quantity = snapshot.data;
            if (quantity > 0) {
              const style = TextStyle(fontSize: 16);
              return quantity > 1
                  ? AutoSizeText(
                      "$quantity ${Strings.kAdsIn} ${county.nameCountyLang!}",
                      style: style,
                      maxLines: 2,
                    )
                  : AutoSizeText(
                      "$quantity ${Strings.kAdIn} ${county.nameCountyLang!}",
                      style: style,
                      maxLines: 2,
                    );
            } else {
              return const SizedBox.shrink();
            }
          }
          return const CupertinoActivityIndicator();
        },
      ),
    );
  }
}
