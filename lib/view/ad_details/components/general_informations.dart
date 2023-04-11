import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/ad.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';
import 'details_options.dart';

import '../../../providers/selected_ad.dart';
import 'details_title.dart';

class GeneralInformations extends StatelessWidget {
  const GeneralInformations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAd = context.read<SelectedAd>().ad;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8.0),
        decoration: Styles.border,
        child: Wrap(
          direction: Axis.vertical,
          children: <Widget>[
            DetailsTitle(title: Strings.kGeneralInformations), //Titre
            currentAd!.price != 0
                ? Price(currentAd: currentAd)
                : const SizedBox.shrink(),
            const DetailsOptions()
          ],
        ),
      ),
    );
  }
}

class Price extends StatelessWidget {
  const Price({
    Key? key,
    required this.currentAd,
  }) : super(key: key);

  final Ad? currentAd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
      ),
      child: Text(
        "${currentAd!.price} €",
        style: const TextStyle(
            color: Colors.orangeAccent,
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
