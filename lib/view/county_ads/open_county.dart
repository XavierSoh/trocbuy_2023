import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/app_bar/default_app_bar.dart';
import 'component/count_ads_of_county.dart';

import '../../model/county.dart';
import '../../providers/selected_county.dart';
import '../../res/strings.dart';
import '../components/ads_top_buttons.dart';
import '../components/location_search_bar.dart';
import 'component/single_county_content.dart';

class OpenCounty extends StatelessWidget {
  static const id = "open_county";

  const OpenCounty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final County county = context.watch<SelectedCounty>().county;

    return Scaffold(
      appBar: DefaultAppBar(
        title: county.nameCountyLang,
      ),
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
                      CountAdsOfCounty(),
                      SizedBox(
                        height: 16.0,
                      ),
                      SingleCountyContent()
                    ],
                  ),
                ],
              ),
            ),
            LocationSearchBar(
              hintText: Strings.kWhereDoYouFind,
            ),
          ],
        ),
      ),
    );
  }
}
