import 'package:flutter/foundation.dart';
import '../../../model/filter_option.dart';

class OptionsProv with ChangeNotifier, DiagnosticableTreeMixin {
  List<FilterOption> options = [];

  void addToOptions(FilterOption newValue) {
    options.add(newValue);
    notifyListeners();
  }

  void changeOptions(List<FilterOption> newOptions) {
    options = newOptions;
    notifyListeners();
  }

  void updateOptionField(Map<String, dynamic> newValue) {
    notifyListeners();
  }

  void clearOptions() {
    options.clear();
    notifyListeners();
  }
}
