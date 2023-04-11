import 'package:flutter/foundation.dart';

import '../model/ad.dart';

class SelectedAd with DiagnosticableTreeMixin, ChangeNotifier {
  Ad? ad;

  changeCurrentAd(Ad newValue) {
    ad = newValue;
    if (kDebugMode) {}
    notifyListeners();
  }
}
