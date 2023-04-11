import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../res/styles.dart';
import '../../../utils/utils.dart';

class LogoComponent extends StatelessWidget {
  const LogoComponent({
    Key? key,
  }) : super(key: key);

  @override
  build(BuildContext context) {
    return Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ExtendedImage.asset(
            Utils.logoPath,
            shape: BoxShape.rectangle,
            fit: BoxFit.contain,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          height: 50,
          width: 220,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Styles.principalColor),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Styles.principalColor),
    );
  }
}
