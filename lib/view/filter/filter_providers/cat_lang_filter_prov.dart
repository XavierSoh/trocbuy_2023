import 'package:flutter/foundation.dart';
import '../../../model/cat_lang.dart';

class CatLangFilterProv with ChangeNotifier, DiagnosticableTreeMixin {
  CatLang catLang = CatLang.catsLang.firstWhere(
    (element) => element.idCat == 81,
  );

  void changeCategory(CatLang newValue) {
    catLang = newValue;
    notifyListeners();
  }
}
