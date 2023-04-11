import 'package:flutter/foundation.dart';

class SearchIconProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool show = true;

  changeState(bool newValue) {
    show = newValue;
    notifyListeners();
  }
}
