import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:trocbuy/services/admob_services.dart';

import '../../res/styles.dart';
import 'components/ad_images.dart';
import 'components/author_and_location.dart';
import 'components/bottom_navigation_content.dart';
import 'components/cross_back_button.dart';
import 'components/features.dart';
import 'components/general_informations.dart';
import 'components/others_details.dart';
import 'components/share_copy_report.dart';
import 'components/title_and_date.dart';

class AdDetail extends StatefulWidget {
  static const id = "ad_details_id";

  @override
  State<AdDetail> createState() => _AdDetailState();
}

class _AdDetailState extends State<AdDetail> {
  late AdmobBannerSize? bannerSize;

  @override
  void initState() {
    super.initState();
    bannerSize = AdmobBannerSize.BANNER;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.principalColor,
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            cacheExtent: 500,
            children: [
              const AdImages(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const TitleAndDate(),
                  AdmobBanner(
                      adUnitId: AdmobService.bannerAdUnitId,
                      adSize: bannerSize!),
                  const SizedBox(height: 10),
                  const GeneralInformations(),
                  const OtherDetails(),
                  const ShareCopyReport(),
                  const SizedBox(height: 10),
                  const AuthorAndLocation(),
                  const FeaturesAds()
                ],
              )
            ],
          ),
          floatingActionButton: const CrossBackbutton(),
          bottomNavigationBar: const BottomNavigationContent(),
        ),
      ),
    );
  }
}
