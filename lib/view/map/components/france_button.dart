import 'package:flutter/material.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';

import '../../all_france_ads/all_france_ads.dart';

class FranceButton extends StatelessWidget {
  bool withPrincipalColor;
  FranceButton({Key? key, this.withPrincipalColor = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: withPrincipalColor == false
          ? Colors.transparent
          : Styles.principalColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              shape: withPrincipalColor != false
                  ? Styles.franceRoundRectangleBorder
                  : Styles.franceRoundRectangleBorder2,
              foregroundColor: Styles.principalColor,
            ),
            child: Text(
              Strings.kAllFrance,
              style: const TextStyle(
                color: Styles.principalColor,
                fontSize: 16,
              ),
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AllFranceAds.id,
                (route) => route.isFirst,
              );
            },
          ),
        ],
      ),
    );
  }
}
