import 'package:flutter/foundation.dart';
import 'package:trocbuy/model/search_model.dart';

import '../model/cat_lang.dart';

class SearchModelProv with DiagnosticableTreeMixin, ChangeNotifier {
SearchModel searchModel = SearchModel();

  change(SearchModel value) {
    searchModel = value;
    notifyListeners();
    if (kDebugMode) {}
  }


}


