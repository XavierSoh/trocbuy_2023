import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/app_bar/default_app_bar.dart';
import '../components/location_search_bar.dart';
import 'component/count_ads_of_region.dart';

import '../../model/region.dart';
import '../../providers/selected_region.dart';
import '../../res/strings.dart';
import '../components/ads_top_buttons.dart';
import 'component/single_region_content.dart';

class OpenRegion extends StatelessWidget {
  static const id = "open_region";

  const OpenRegion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Region region = context.read<SelectedRegion>().region;

    return Scaffold(
      appBar: DefaultAppBar(
        title: region.nameRegLang,
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
                      CountAdsOfRegion(),
                      SizedBox(
                        height: 16.0,
                      ),
                      SingleRegionContent()
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
