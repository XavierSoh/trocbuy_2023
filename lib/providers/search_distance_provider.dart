import 'package:flutter/foundation.dart';

class SearchDistanceProvider with ChangeNotifier, DiagnosticableTreeMixin {
  double distance = 10;

  change(double? newValue) {
    distance = newValue!;
    notifyListeners();
  }
}