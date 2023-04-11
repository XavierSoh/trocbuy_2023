import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../global_functions/ads_functions.dart';
import '../../../model/ad_option1.dart';
import '../../../model/filter_names.dart';

import '../../../model/ad_option2.dart';
import '../../../model/ad_option3.dart';
import '../../../providers/selected_ad.dart';
import 'build_options_row.dart';

class DetailsOptions extends StatelessWidget {
  const DetailsOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAd = context.read<SelectedAd>().ad;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: FutureBuilder(
        future: AdsFunctions.getAdOptions(
            FilterNames.options.name, {"id_ad": currentAd!.idAd}),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            // final List<AdOptions> optionsList =
            //     snapshot.data as List<AdOptions>;

            List<AdOption1> adOptions1 = List<AdOption1>.from(
              snapshot.data
                  .map((e) => e.adOptions1)
                  .toList()
                  .where(
                    (element) => element.option1Name.toString() != null,
                  )
                  .toList(),
            );

            final List<AdOption2> adOptions2 =
                List<AdOption2>.from(snapshot.data
                    .map(
                      (e) {
                        return e.adOptions2;
                      },
                    )
                    .toList()
                    .where(
                      (element) => element.option2Name.toString() != "null",
                    )
                    .toList());

            final List<AdOption3> adOptions3 = List<AdOption3>.from(
              snapshot.data
                  .map(
                    (e) {
                      return e.adOptions3;
                    },
                  )
                  .toList()
                  .where(
                    (element) => element.option3Name.toString() != "null",
                  )
                  .toList(),
            );
            adOptions1 = adOptions1
                .where((element) => element.option1Name != null)
                .toList();
            adOptions1 = [
              ...adOptions1.where(
                  (element) => element.option1Name.toLowerCase() == "marque"),
              ...adOptions1.where((element) =>
                  element.option1Name.toLowerCase() ==
                  "Type de voiture".toLowerCase()),
              ...adOptions1.where((element) =>
                  element.option1Name.toLowerCase() ==
                  "Année Modèle".toLowerCase()),
              ...adOptions1.where((element) =>
                  element.option1Name.toLowerCase() == "Energie".toLowerCase()),
              ...adOptions1.where((element) =>
                  element.option1Name.toLowerCase() ==
                  "Boite de vitesse".toLowerCase()),
              ...adOptions1.where((element) =>
                  element.option1Name.toLowerCase() ==
                  "Nombre de portes".toLowerCase()),
              ...adOptions1.where((element) =>
                  element.option1Name.toLowerCase() ==
                  "Nombre de places".toLowerCase()),
              ...adOptions1.where((element) =>
                  element.option1Name.toLowerCase() == "Couleur".toLowerCase()),
              ...adOptions1.where((element) =>
                  element.option1Name.toLowerCase() !=
                      "Nombre de places".toLowerCase() &&
                  element.option1Name.toLowerCase() !=
                      "Couleur".toLowerCase() &&
                  element.option1Name.toLowerCase() !=
                      "Energie".toLowerCase() &&
                  element.option1Name.toLowerCase() !=
                      "Type de voiture".toLowerCase() &&
                  element.option1Name.toLowerCase() !=
                      "Boite de vitesse".toLowerCase()),
            ];
            adOptions3.sort();
            adOptions2.sort();
            adOptions3.sort();

            List<AdOption1> adOptions11 = adOptions1.toSet().toList();
            List<AdOption2> adOptions22 = adOptions2.toSet().toList();
            List<AdOption3> adOptions33 = adOptions3.toSet().toList();

            if (snapshot.data.isNotEmpty) {
              return Wrap(
                direction: Axis.vertical,
                children: adOptions11
                        .map(
                          (e) => buildOptionsRow(context, e, "option1"),
                        )
                        .toList() +
                    adOptions22
                        .map(
                          (e) => buildOptionsRow(context, e, "option2"),
                        )
                        .toList() +
                    adOptions33
                        .map(
                          (e) => buildOptionsRow(context, e, "option3"),
                        )
                        .toList(),
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
