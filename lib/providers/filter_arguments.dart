import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class FilterArgumentsProv with ChangeNotifier, DiagnosticableTreeMixin {
  Map<String, dynamic> body = {};

  updateBody(Map<String, dynamic> newValue) {
    body = newValue;
    notifyListeners();
  }
}
