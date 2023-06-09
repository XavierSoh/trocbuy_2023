import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/selected_ad.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';
import '../components/ad_sort_button.dart';
import '../components/ads_top_buttons.dart';
import '../components/app_bar/default_app_bar.dart';
import '../components/search_bar.dart' as my_search_bar;
import 'components/ads_author_content.dart';
import 'components/count_ads_of_author.dart';

class AdsOfAuthor extends StatelessWidget {
  static const id = "ads_of_author";
  const AdsOfAuthor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAd = context.read<SelectedAd>().ad;
    AdSortButton.isOnAuthorPage = true;
    AdSortButton.isAllFrance = false;
    AdSortButton.isOnRegionPage = false;
    AdSortButton.isArroundMe = false;
    AdSortButton.isFilter = false;
    return Container(
      color: Styles.principalColor,
      child: SafeArea(
        child: Scaffold(
          appBar: DefaultAppBar(
            title: currentAd!.name!,
          ),
          body: Stack(
            children: [
              const SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Wrap(
                      children: [
                        AdsTopButtons(),
                        SizedBox(
                          height: 16.0,
                        ),
                        CountAdsOfAuthor(),
                        AdsAuthorContent()
                      ],
                    )
                  ],
                ),
              ),
              my_search_bar.SearchBar(
                hintText: Strings.kSearchBarHintText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
