import 'package:flutter/foundation.dart';
import '../model/region.dart';

class SelectedRegion with ChangeNotifier, DiagnosticableTreeMixin {
  Region region = Region.regions[0];

  void change(Region newRegion) {
    region = newRegion;
    notifyListeners();
  }
}
