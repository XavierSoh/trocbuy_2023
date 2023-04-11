import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/providers/search_distance_provider.dart';
import 'package:trocbuy/res/styles.dart';
// import 'package:geolocator/geolocator.dart';
import '../../res/strings.dart';
import '../components/ad_sort_button.dart';
import '../components/app_bar/default_app_bar.dart';
import '../components/location_search_bar.dart';

import '../components/ads_top_buttons.dart';
import 'component/ads_around_me_count.dart';
import 'component/around_me_content.dart';

class AroundMeResult extends StatefulWidget {
  AroundMeResult({Key? key}) : super(key: key);

  static const id = "arround_me_results";
  // static Position? position;

  @override
  State<AroundMeResult> createState() => _AroundMeResultState();
}

class _AroundMeResultState extends State<AroundMeResult> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AdSortButton.isOnAuthorPage = false;
    AdSortButton.isAllFrance = false;
    AdSortButton.isOnRegionPage = false;
    AdSortButton.isArroundMe = true;
    AdSortButton.isFilter = false;
    final distance = context.watch<SearchDistanceProvider>().distance;
    // bool location = AroundMeFunctions().isLocationActive;

    if (mounted) {
      setState(() {
        // AroundMeFunctions().setLocationState();
      });
    }
    return Scaffold(
      appBar: DefaultAppBar(
        title: Strings.kArroundMe,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.kResult,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Styles.principalColor,
                  fontSize: 16
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${Strings.kWithRadius} : $distance kms",
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Styles.principalColor,
                    fontSize: 14
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                //spacing: 5,
                children: const <Widget>[
                  AdsTopButtons(),
                  AdsAroundMeCount(),
                  SizedBox(
                    height: 16.0,
                  ),
                  AroundMeContent()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
