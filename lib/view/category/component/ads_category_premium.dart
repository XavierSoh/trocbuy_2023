import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:trocbuy/providers/selected_cat_lang.dart';
import 'package:trocbuy/view/components/no_data_found.dart';
import 'package:trocbuy/view/home/components/loading_error.dart';

import '../../../global_functions/ads_functions.dart';
import '../../../model/ad.dart';
import '../../../model/filter_names.dart';
import '../../../providers/scollable_provider.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';
import '../../components/ad_single_item_grid.dart';
import '../../components/ad_title.dart';
import '../../components/custom_progress_indicator.dart';

class AdsCategoryPremium extends StatefulWidget {
  const AdsCategoryPremium({Key? key}) : super(key: key);

  @override
  State<AdsCategoryPremium> createState() => _AdsCategoryPremiumState();
}

class _AdsCategoryPremiumState extends State<AdsCategoryPremium> {
  @override
  build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final scrollable = context.watch<ScrollableProvider>();
    final currentCatLang = context.watch<SelectedCatLang>().catLang;

    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 2.0),
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        decoration: Styles.borderStyle,
        child: StickyHeader(
          header: AdTitle(title: Strings.kPremiumAdsTitle, color: scrollable.primaryColor),
          content: FutureBuilder(
            future: AdsFunctions.getAds(FilterNames.premiumSingleCat.name,
                body: currentCatLang.toJson()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final ads = snapshot.data as List<Ad>;

                if (snapshot.data!.isNotEmpty) {
                  final count = ads.length;
                  return count > 1
                      ? SizedBox(
                          height: 330,
                    width: MediaQuery.of(context).size.width,

                    child: CarouselSlider.builder(
                            itemCount:(ads.length/2).round(),
                            itemBuilder: (
                              context,
                              index,
                              realIndex,
                            ) {
                              final int first = index * 2;
                               int? second = 0;
                              ads.length.isOdd?
                              second=index<((ads.length/2).round()-1)?first+1:0
                              :second=index<((ads.length/2).round()-0)?first+1:null;
                              return Row(
                                  children: [
                                    first, second
                                  ].map((e) {
                                    return e!=null?AdSingleItemGrid(
                                      ad: ads[e],
                                    ):AdSingleItemGrid(
                                      ad: ads[index],
                                    );
                                  }).toList(),

                              );


                                AdSingleItemGrid(
                                ad: ads[index],
                              );
                            },

                            options: CarouselOptions(
                                initialPage: 0,
                                autoPlay: true,
                                aspectRatio: 16/9,
                                disableCenter: true,
                                viewportFraction: 2,
                                enlargeCenterPage: false,
                                enableInfiniteScroll: true,
                                autoPlayInterval: const Duration(seconds: 10),
                                //enlargeStrategy: CenterPageEnlargeStrategy.height
                              ),
                          ),
                        )
                      : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: AdSingleItemGrid(
                                ad: ads[0],
                              ),
                            ),
                            const Premium(),
                          ],
                        );
                } else {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: const [Premium(), Premium()],
                  );
                }
              }
              if (snapshot.hasError) {
                return const LoadingError();
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: const [Premium(), Premium()],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Premium extends StatelessWidget {
  const Premium({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: SizedBox(
         height: 240,
        child: Card(
          child: Image.asset(
            'images/premium.png',

            fit: BoxFit.contain,
          ),
          elevation: 10.0,
          shadowColor: Styles.principalColor,

        ),
      ),
    );
  }
}
