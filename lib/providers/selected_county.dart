import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../model/county.dart';
import 'selected_region.dart';

class SelectedCounty with ChangeNotifier, DiagnosticableTreeMixin {
  County county = County(nameCountyLang: 'Choisissez le département');

  List<County> department = [];

  void getDepartment(BuildContext context) {
    department = County.counties
        .where((element) =>
            element.parReg == Provider.of<SelectedRegion>(context, listen: false).region.idReg)
        .toList();
    department = [
      ...[County(nameCountyLang: 'Choisissez le département')],
      ...department
    ];
    notifyListeners();
  }

  void change(County newCounty) {
    county = newCounty;

    notifyListeners();
  }
}
