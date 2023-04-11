import 'package:flutter/foundation.dart';

class SearchInProv with DiagnosticableTreeMixin, ChangeNotifier {
  bool titleOnly = false, emergencyOnly = false, withPhoto = false;

  void updateTitleOnly(bool value) {
    titleOnly = value;
    notifyListeners();
  }

  void updateUrgenceOnly(bool value) {
    emergencyOnly = value;
    notifyListeners();
  }

  void updateWithPhoto(bool value) {
    withPhoto = value;
    notifyListeners();
  }
}
