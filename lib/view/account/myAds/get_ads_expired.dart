import 'package:flutter/material.dart';

import 'no_ads.dart';

class GetAdsExpired extends StatefulWidget {
  const GetAdsExpired({Key? key}) : super(key: key);

  @override
  _GetAdsExpiredState createState() => _GetAdsExpiredState();
}

class _GetAdsExpiredState extends State<GetAdsExpired> {
  @override
  build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: NoAds(),
    );
  }
}
