import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/view/arround_me_ads/around_me_result.dart';
import '../../model/ad_sort_by.dart';
import '../../providers/ad_sort_by_provider.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';
import '../ad_details/ads_of_author.dart';
import '../all_france_ads/all_france_ads.dart';
import '../arround_me_ads/arround_me_ads.dart';
import '../category/single_category_ads.dart';
import '../filter/filter_result.dart';
import '../region_ads/open_region.dart';

class AdSortButton extends StatelessWidget {
  const AdSortButton({Key? key}) : super(key: key);
  static bool isOnRegionPage = false;
  static bool isOnAuthorPage = false;
  static bool isAllFrance = false;
  static bool isArroundMe = false;
  static bool isFilter = false;
  @override
  Widget build(BuildContext context) {
    final sortBy = context.watch<AdSortByProvider>().adSortBy;
    return Row(
      children: [
        Text(
          Strings.kSortBy,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Styles.principalColor,
          ),
        ),
        DropdownButton<AdSortBy>(
          isExpanded: false,
          isDense: true,
          value: sortBy,
          style: const TextStyle(
            color: Styles.principalColor,
            fontSize: 16.0,
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Styles.principalColor,
          ),
          iconSize: 0,
          underline: const SizedBox.shrink(),
          onChanged: (AdSortBy? newValue) {
            context.read<AdSortByProvider>().change(newValue);
            if (isOnRegionPage) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                OpenRegion.id,
                (route) => route.isFirst,
              );
            } else if (isOnAuthorPage) {
              context.read<AdSortByProvider>().change(newValue);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AdsOfAuthor.id,
                (route) => route.isFirst,
              );
            } else if (isAllFrance) {
              context.read<AdSortByProvider>().change(newValue);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AllFranceAds.id,
                (route) => route.isFirst,
              );
            } else if (isArroundMe) {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AroundMeResult()), (route) => route.isFirst);
              // Navigator.pushNamedAndRemoveUntil(
              //   context,
              //   MaterialPageRoute((context) => AroundMeResult()),
              //   (route) => route.isFirst,
              // );
            } else if (isFilter) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                FilterResult.id,
                (route) => route.isFirst,
              );
            } else {
              Navigator.pushNamedAndRemoveUntil(
                context,
                SingleCategoryAds.id,
                (route) => route.isFirst,
              );
            }
          },
          items: AdSortBy.values.map<DropdownMenuItem<AdSortBy>>(
            (AdSortBy value) {
              return DropdownMenuItem<AdSortBy>(
                value: value,
                child: Text(
                  value.name!,
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
