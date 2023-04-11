import 'package:flutter/material.dart';

import '../../../res/strings.dart';
import '../../../res/styles.dart';
import '../../arround_me_ads/arround_me_ads.dart';

class AroundMeButton extends StatelessWidget {
  final bool withPrincipalColor;
  const AroundMeButton({
    Key? key,
    required this.withPrincipalColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: withPrincipalColor == false
          ? Colors.transparent
          : Styles.principalColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              shape: withPrincipalColor != false
                  ? Styles.franceRoundRectangleBorder
                  : Styles.franceRoundRectangleBorder2,
              foregroundColor: Styles.principalColor
            ),
            child: Text(
              Strings.kArroundMe,
              style: const TextStyle(
                color: Styles.principalColor,
                fontSize: 16,
              ),
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AroundMeAds.id, (route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}
