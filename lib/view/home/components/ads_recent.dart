import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../../global_functions/ads_functions.dart';
import '../../../model/ad.dart';
import '../../../model/filter_names.dart';
import '../../../providers/scollable_provider.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';
import '../../components/ad_single_item_grid.dart';
import '../../components/ad_title.dart';
import '../../components/custom_progress_indicator.dart';
import 'loading_error.dart';

class AdsRecents extends StatelessWidget {
  AdsRecents({Key? key}) : super(key: key);

  final _controller = ScrollController();
  @override
  build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final scrollable = context.watch<ScrollableProvider>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 2.0),
      child: StickyHeader(
        header: AdTitle(
          title: Strings.kRecentsAdsTitle,
          color: scrollable.recentColor,
        ),
        content: FutureBuilder<List<Ad>>(
          future: AdsFunctions.getAds(FilterNames.newAds.name),
          builder: (context, snapshot) {
            final scrollable = context.watch<ScrollableProvider>().isScrollable;
            if (snapshot.hasData) {
              return GridView.builder(
                //cacheExtent: 9999,

                shrinkWrap: true,
                gridDelegate: Styles.gridDelegate,
                itemCount: snapshot.data?.length,
                physics: scrollable ? const ScrollPhysics() : const NeverScrollableScrollPhysics(),
                controller: _controller,
                itemBuilder: (context, index) {
                  final ads = snapshot.data!;
                  return AdSingleItemGrid(ad: ads[index]);
                },
              );
            }
            if (snapshot.hasError) return const LoadingError();
            return const CustomProgressIndicator();
          },
        ),
      ),
    );
  }
}
