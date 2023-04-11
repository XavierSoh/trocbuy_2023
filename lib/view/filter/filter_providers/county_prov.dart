import 'package:flutter/foundation.dart';

import '../../../model/county.dart';

class CountyProv with ChangeNotifier, DiagnosticableTreeMixin {
  /* County county = County.counties
      .where((element) {
        return RegionsProv.region2.idReg == element.parReg;
      })
      .toList()
      .first;*/
  County county = County(
      codeLang: '',
      idCounty: -1,
      nameCountyLang: 'Choisissez le département',
      idCountyLang: -1,
      parReg: -1);

  void changeCounty(County newValue) {
    county = newValue;
    notifyListeners();
  }
}
