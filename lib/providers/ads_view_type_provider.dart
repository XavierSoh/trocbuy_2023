import 'package:flutter/foundation.dart';

class AdsViewTypeProvider with DiagnosticableTreeMixin, ChangeNotifier {
  bool isGrid = true;

  void changeAdViewType() {
    isGrid = !isGrid;
    notifyListeners();
  }
}
