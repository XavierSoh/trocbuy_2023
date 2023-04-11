import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../model/ad.dart';
import '../../res/styles.dart';

class AdCityComponent extends StatelessWidget {
  final Ad ad;
  final bool centerText;
  const AdCityComponent({Key? key, required this.ad, this.centerText = true})
      : super(key: key);

  @override
  build(BuildContext context) {
    return Row(
      mainAxisAlignment: centerText == true
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: <Widget>[
        const Icon(Icons.location_on, size: 12, color: Styles.principalColor),
        Flexible(
          child: AutoSizeText(
            "${ad.city}  ${ad.postcode}",
            maxLines: 2,
            textAlign: centerText ? TextAlign.center : TextAlign.start,
          ),
        ),
      ],
    );
  }
}
