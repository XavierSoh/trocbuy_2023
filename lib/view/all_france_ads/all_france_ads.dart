import 'package:flutter/material.dart';

import '../../res/strings.dart';
import '../components/ad_sort_button.dart';
import '../components/ads_top_buttons.dart';
import '../components/app_bar/default_app_bar.dart';
import '../components/search_bar.dart' as my_search_bar;
import 'component/all_france_content.dart';
import 'component/count_all_ads.dart';

class AllFranceAds extends StatelessWidget {
  static const id = "all_france_ads";

  const AllFranceAds({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AdSortButton.isOnAuthorPage = false;
    AdSortButton.isAllFrance = true;
    AdSortButton.isOnRegionPage = false;
    AdSortButton.isArroundMe = false;
    AdSortButton.isFilter = false;
    return Scaffold(
      appBar: DefaultAppBar(
        title: Strings.kAllFrance,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Wrap(
                  //spacing: 5,
                  children: const <Widget>[
                    AdsTopButtons(),
                    CountAllAds(),
                    SizedBox(
                      height: 16.0,
                    ),
                    AllFranceContent()
                  ],
                ),
              ],
            ),
          ),
          my_search_bar.SearchBar(
            hintText: Strings.kSearchBarHintText,
          ),
        ],
      ),
    );
  }
}
