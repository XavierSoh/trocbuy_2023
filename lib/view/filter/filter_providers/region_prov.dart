import 'package:flutter/foundation.dart';

import '../../../model/region.dart';

class RegionsProv with ChangeNotifier, DiagnosticableTreeMixin {
  Region region = Region.regions.first;
  static Region region2 = Region.regions.first;
  void changeRegion(Region newValue) {
    region = newValue;
    region2 = region;
    notifyListeners();
  }
}
