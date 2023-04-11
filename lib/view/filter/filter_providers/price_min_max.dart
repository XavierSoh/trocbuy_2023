import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PriceMinMaxProv with ChangeNotifier, DiagnosticableTreeMixin {
  double? prixMin;
  double? prixMax;

  void changeMinPrice(double newValue) {
    prixMin = newValue;
    notifyListeners();
  }

  void changeMaxPrice(double newValue) {
    prixMax = newValue;
    notifyListeners();
  }
}
