import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/selected_region.dart';
import '../../ad_details/functions/ad_details_functions.dart';

import '../../../model/region.dart';
import '../../../res/strings.dart';

class CountAdsOfRegion extends StatelessWidget {
  const CountAdsOfRegion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Region region = context.read<SelectedRegion>().region;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 8),
      child: FutureBuilder(
        future: AdDetailsFunctions.getAdsOfRegionQuantity(region),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            int quantity = snapshot.data;
            if (quantity > 0) {
              const style = TextStyle(fontSize: 16);
              return quantity > 1
                  ? AutoSizeText(
                      "$quantity ${Strings.kAdsIn} ${region.nameRegLang}",
                      style: style,
                      maxLines: 2,
                    )
                  : AutoSizeText(
                      "$quantity ${Strings.kAdIn} ${region.nameRegLang}",
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
