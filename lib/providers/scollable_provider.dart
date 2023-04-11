import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScrollableProvider with DiagnosticableTreeMixin, ChangeNotifier {
  bool isScrollable = false;

  Color recentColor = Colors.white;
  Color primaryColor = Colors.white;
  void change(bool newValue) {
    isScrollable = newValue;
    notifyListeners();
  }

  voidChangeRecentColor(Color newColor) {
    recentColor = newColor;
    notifyListeners();
  }

  voidChangePrimaryColor(Color newColor) {
    primaryColor = newColor;
    notifyListeners();
  }
}
