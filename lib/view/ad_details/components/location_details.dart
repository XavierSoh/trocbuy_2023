import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/selected_ad.dart';
import 'ad_google_map.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAd = context.read<SelectedAd>().ad;

    return  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${currentAd!.city} ${currentAd.postcode}'),
              AdGoogleMaps(ad: currentAd),
            ],
          );
  }
}
