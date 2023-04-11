import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../model/county.dart';
import 'selected_region.dart';

class SelectedCounty with ChangeNotifier, DiagnosticableTreeMixin {
  County county = County(nameCountyLang: 'Choisissez le département');

  List<County> departement = [];

  void getDepartement(BuildContext context) {
    departement = County.counties
        .where((element) =>
            element.parReg == Provider.of<SelectedRegion>(context).region.idReg)
        .toList();
    departement = [
      ...[County(nameCountyLang: 'Choisissez le département')],
      ...departement
    ];

    // county = departement[0];
    notifyListeners();
  }

  void change(County newCounty) {
    county = newCounty;

    notifyListeners();
  }
}
