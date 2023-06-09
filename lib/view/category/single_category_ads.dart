import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/view/category/component/ads_category_premium.dart';

import '../../providers/selected_cat_lang.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';
import '../components/ads_top_buttons.dart';
import '../components/app_bar/default_app_bar.dart';
import '../components/search_bar.dart' as my_search_bar;
import 'component/ads_category_count.dart';
import 'single_category_content.dart';

class SingleCategoryAds extends StatelessWidget {
  const SingleCategoryAds({Key? key}) : super(key: key);

  static const id = "single_category_ads";

  @override
  Widget build(BuildContext context) {
    final currentCatLang = context.read<SelectedCatLang>().catLang;
    return Container(
      color: Styles.principalColor,
      child: SafeArea(
        child: Scaffold(
          appBar: DefaultAppBar(
            title: currentCatLang.nameCatLang,
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
                      children: [
                        const AdsCategoryPremium(),
                        const SizedBox(height: 15),
                        const AdsTopButtons(),
                        AdsCategoryCount(currentCatLang: currentCatLang),
                        const SizedBox(height: 16.0),
                        const SingleCategoryContent()
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
