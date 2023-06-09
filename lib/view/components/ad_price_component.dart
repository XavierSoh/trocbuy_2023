import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../res/styles.dart';
import '../../utils/utils.dart';

class AdPriceComponent extends StatelessWidget {
  const AdPriceComponent(
      {Key? key, required this.price, this.centerText = true})
      : super(key: key);
  final double? price;
  final bool? centerText;
  @override
  build(BuildContext context) {
    return price == 0.0
        ? const Opacity(child: SizedBox.shrink(), opacity: 0.0)
        : centerText!
            ? Center(
                child: AutoSizeText(
                  price.toString() + Utils.getCurrency(),
                  style: const TextStyle(color: Styles.orangeColor),
                ),
              )
            : AutoSizeText(
                price.toString() + Utils.getCurrency(),
                style: const TextStyle(color: Styles.orangeColor),
              );
  }
}
