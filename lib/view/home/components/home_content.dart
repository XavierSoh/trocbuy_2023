import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/scollable_provider.dart';
import '../../../res/strings.dart';
import '../../components/app_bar/default_app_bar.dart';
import '../../components/search_bar.dart' as my_search_bar;
import 'ads_premium.dart';
import 'ads_recent.dart';
import 'cat_lang_slides.dart';
import 'custom_floating_action_button.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
  }) : super(key: key);

  @override
  build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final scrollable = context.watch<ScrollableProvider>();
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            my_search_bar.SearchBar(
              hintText: Strings.kSearchBarHintText,
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: height * 75 / 100,
              width: width,
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (scrollState) {
                  double currentPixel = scrollState.metrics.pixels;
                  double maxPixel = scrollState.metrics.maxScrollExtent;
                  double minPixel = scrollState.metrics.minScrollExtent;
                  if (currentPixel + 5.0 == maxPixel) {
                    scrollable.change(true);
                  } else if (currentPixel - 5.0 == minPixel) {
                    scrollable.change(false);
                  }
                  return false;
                },
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const CatLangSlides(),
                    const AdsPremium(),
                    AdsRecents()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }

  String? getBannerAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    return null;
  }

  String? getInterstitialAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712';
    }
    return null;
  }

  String? getRewardBasedVideoAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917';
    }
    return null;
  }
}
