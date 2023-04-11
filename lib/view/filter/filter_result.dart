import 'package:flutter/material.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';
import '../components/ad_sort_button.dart';
import '../components/app_bar/default_app_bar.dart';

import '../components/ads_top_buttons.dart';
import '../components/search_bar.dart';
import 'component/filter_result_content.dart';

class FilterResult extends StatelessWidget {
  static const id = "filter_result";
  const FilterResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdSortButton.isOnAuthorPage = false;
    AdSortButton.isAllFrance = false;
    AdSortButton.isOnRegionPage = false;
    AdSortButton.isArroundMe = false;
    AdSortButton.isFilter = true;

    return Container(
      color: Styles.principalColor,
      child: SafeArea(
        child: Scaffold(
          appBar: const DefaultAppBar(),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(
              2.0,
              0.0,
              2.0,
              2.0,
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Wrap(
                        children: const <Widget>[
                          AdsTopButtons(),
                          //  CountFilterResult(),
                          SizedBox(
                            height: 16.0,
                          ),
                          FilterResultContent()
                        ],
                      ),
                    ],
                  ),
                ),
                SearchBar(
                  hintText: Strings.kWhatDoYouFind,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
