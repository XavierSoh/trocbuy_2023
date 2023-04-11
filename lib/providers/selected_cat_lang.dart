import 'package:flutter/foundation.dart';

import '../model/cat_lang.dart';

class SelectedCatLang with DiagnosticableTreeMixin, ChangeNotifier {
  CatLang catLang = CatLang.cats[0];
  CatLang subCatLang = CatLang.Subcats[0];
  changeSubCatLang(CatLang newValue) {
    subCatLang = newValue;
    notifyListeners();
    if (kDebugMode) {}
  }

  changeCatLang(CatLang newValue) {
    catLang = newValue;
    notifyListeners();
    if (kDebugMode) {}
  }
}
