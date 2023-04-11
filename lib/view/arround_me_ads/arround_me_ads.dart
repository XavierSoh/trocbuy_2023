import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/providers/search_distance_provider.dart';
import 'package:trocbuy/res/styles.dart';
import 'package:trocbuy/view/all_france_ads/all_france_ads.dart';
import 'package:trocbuy/view/arround_me_ads/around_me_result.dart';
// import 'package:geolocator/geolocator.dart';
import '../../res/strings.dart';
import '../components/ad_sort_button.dart';
import '../components/app_bar/default_app_bar.dart';
import '../components/location_search_bar.dart';

import '../components/ads_top_buttons.dart';
import 'component/ads_around_me_count.dart';
import 'component/around_me_content.dart';

class AroundMeAds extends StatefulWidget {
  const AroundMeAds({Key? key}) : super(key: key);

  static const id = "arround_me_ads";
  // static Position? position;

  @override
  State<AroundMeAds> createState() => _AroundMeAdsState();
}

class _AroundMeAdsState extends State<AroundMeAds> {

  double distance = 50;

  @override
  void initState() {
    setState(
      () {

      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AdSortButton.isOnAuthorPage = false;
    AdSortButton.isAllFrance = false;
    AdSortButton.isOnRegionPage = false;
    AdSortButton.isArroundMe = true;
    AdSortButton.isFilter = false;
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.kEnterRadius,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Styles.principalColor,
                  fontSize: 18
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.kAroundMe,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Styles.principalColor
                      ),
                    ),
                    Text(
                      Strings.kRadius,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Styles.principalColor
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.kAroundOf,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Styles.principalColor
                      ),
                    ),
                    Text(
                      "$distance kms",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Slider(
                value: distance,
                onChanged: (newValue){
                  setState(() {
                    distance = newValue;
                  });
                },
                min: 5,
                max: 250,
                divisions: 245,
                label: "$distance",
                activeColor: Colors.redAccent,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "5 kms",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Styles.principalColor
                      ),
                    ),
                    Text(
                      "250 kms",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Styles.principalColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (newValue){}),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      Strings.kAroundMe,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Styles.principalColor
                      ),
                    )
                  )
                ],
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (newValue){
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AllFranceAds.id,
                          (route) => route.isFirst,
                    );
                  }),
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        Strings.kAllFrance,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Styles.principalColor
                        ),
                      )
                  )
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: Text(
                    Strings.kConfirmPosition,
                    style: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    if(distance>0){
                      context.read<SearchDistanceProvider>().change(distance);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AroundMeResult()));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
