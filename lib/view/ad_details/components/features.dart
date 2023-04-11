import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../global_functions/ads_functions.dart';
import '../../../model/filter_names.dart';
import 'author.dart';
import '../../components/ad_single_item_grid.dart';
import '../../components/custom_progress_indicator.dart';

import '../../../model/ad.dart';
import '../../../providers/selected_ad.dart';
import '../../../res/styles.dart';
import 'feature_single_item.dart';

class FeaturesAds extends StatelessWidget {
  const FeaturesAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAd = context.read<SelectedAd>().ad;

    return FutureBuilder(
      future: AdsFunctions().getAdsByParameters(
        FilterNames.features.name,
        currentAd!.toJson(),
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final ads = snapshot.data as List<Ad>;
          ads.sort((a, b) => a.idAd!.compareTo(b.idAd!));
          final count = ads.length;
          if (ads.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Styles.principalColor,
                    width: 0.3,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SimilarAdsTitle(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: count > 1
                            ? CarouselSlider.builder(
                                itemCount: count % 2 == 0
                                    ? (count / 2).round()
                                    : (count / 2).round() - 1,
                                itemBuilder: (context, index, index2) {
                                  final int first = index * 2;
                                  final int? second =
                                      index < count - 1 ? first + 1 : null;
                                  return Row(
                                    children: [first, second].map(
                                      (idx) {
                                        return Flexible(
                                          flex: 1,
                                          child: AdSingleItemGrid(
                                            ad: ads[idx ?? 0],
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  );
                                },
                                options: Styles.carousselOptionsForFeatures(),
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: FeatureSingleItem(ad: ads.first),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        }
        return const CustomProgressIndicator();
      },
    );
  }
}
