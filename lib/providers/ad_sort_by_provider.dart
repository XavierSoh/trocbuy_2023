import 'package:flutter/foundation.dart';
import '../model/ad_sort_by.dart';

class AdSortByProvider with ChangeNotifier, DiagnosticableTreeMixin {
  AdSortBy adSortBy = AdSortBy.recent;

  change(AdSortBy? newValue) {
    adSortBy = newValue!;
    notifyListeners();
  }
}
