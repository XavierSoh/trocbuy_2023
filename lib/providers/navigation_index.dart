import 'package:flutter/foundation.dart';

class NavigationIndexProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int index = 0;

  void changeIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }
}
