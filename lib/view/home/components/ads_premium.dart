import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../../../global_functions/ads_functions.dart';
import '../../../model/filter_names.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';
import '../../components/ad_title.dart';

import '../../../model/ad.dart';
import '../../../providers/scollable_provider.dart';
import '../../components/ad_single_item_grid.dart';
import '../../components/custom_progress_indicator.dart';
import 'loading_error.dart';

class AdsPremium extends StatefulWidget {
  const AdsPremium({Key? key}) : super(key: key);

  @override
  State<AdsPremium> createState() => _AdsPremiumState();
}

class _AdsPremiumState extends State<AdsPremium> {
  @override
  build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final scrollable = context.watch<ScrollableProvider>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 2.0),
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        decoration: Styles.borderStyle,
        child: StickyHeader(
          header: AdTitle(
              title: Strings.kPremiumAdsTitle, color: scrollable.primaryColor),
          content: SizedBox(
            height: 330,
            child: FutureBuilder(
              future: AdsFunctions.getAds(FilterNames.premium.name),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final ads = snapshot.data as List<Ad>;
                  final count = ads.length;
                  return CarouselSlider.builder(
                    itemCount: count % 2 == 0
                        ? (count / 2).round()
                        : (count / 2).round() - 1,
                    itemBuilder: (
                      context,
                      index,
                      realIdx,
                    ) {
                      final int first = index * 2;
                      final int? second = index < count - 1 ? first + 1 : null;
                      return Row(
                        children: [first, second].map(
                          (idx) {
                            return Flexible(
                              flex: 1,
                              child: AdSingleItemGrid(
                                ad: ads[idx!],
                              ),
                            );
                          },
                        ).toList(),
                      );
                    },
                    options: Styles.buildCarouselOptions(height),
                  );
                }
                if (snapshot.hasError) {
                  return const LoadingError();
                }

                return const CustomProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
