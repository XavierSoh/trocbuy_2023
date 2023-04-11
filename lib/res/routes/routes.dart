import 'package:flutter/cupertino.dart';
import '../../view/account/account_home.dart';
import '../../view/ad_details/ad_details.dart';
import '../../view/ad_details/ads_of_author.dart';
import '../../view/all_france_ads/all_france_ads.dart';
import '../../view/arround_me_ads/arround_me_ads.dart';
import '../../view/category/component/cat_search_results.dart';
import '../../view/category/show_categories.dart';
import '../../view/county_ads/open_county.dart';
import '../../view/filter/filter_result.dart';
import '../../view/map/map_screen.dart';
import '../../view/region_ads/open_region.dart';

import '../../view/category/single_category_ads.dart';
import '../../view/filter/filter.dart';
import '../../view/help_and_about/about.dart';
import '../../view/help_and_about/help.dart';
import '../../view/home/home.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> routes = {
    Home.id: (context) => const Home(),
    Help.id: (context) => const Help(),
    About.id: (context) => const About(),
    AccountHome.id: (context) => const AccountHome(),
    AdDetail.id: (context) => AdDetail(),
    AdsOfAuthor.id: (context) => const AdsOfAuthor(),
    SingleCategoryAds.id: (context) => const SingleCategoryAds(),
    Filter.id: (context) => const Filter(),
    MapScreen.id: (context) => const MapScreen(),
    OpenRegion.id: (context) => const OpenRegion(),
    ShowCategories.id: (context) => const ShowCategories(),
    CatSearchResult.id: (context) => const CatSearchResult(),
    OpenCounty.id: (context) => const OpenCounty(),
    AllFranceAds.id: (context) => const AllFranceAds(),
    AroundMeAds.id: (context) => const AroundMeAds(),
    FilterResult.id: (context) => const FilterResult()
  };

  //static const initialRoute = Home.id;
}
