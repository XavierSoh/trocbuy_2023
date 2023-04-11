import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class VitrineProProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool isLoading = true;
  void changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  //--------------------------
  late Response response;
  void changeResponse(Response _response) {
    response = _response;
    notifyListeners();
  }

  //--------------------------
  List<bool> isSelected = [];
  void buildIsSelectedList(int length) {
    List<bool> list = List.generate(length, (index) => false);
    isSelected = list;
    notifyListeners();
  }

  void changeIsSelectedValue(int index) {
    isSelected[index] = !isSelected[index];
    notifyListeners();
  }

  List<String> idAds = [];
  void addIdAds(String id) {
    if (idAds.contains(id)) {
      removeIdAds(id);
    }
    idAds.add(id);
    notifyListeners();
  }

  void removeIdAds(String id) {
    idAds.remove(id);
    notifyListeners();
  }

  void clearProvider() {
    isLoading = true;
    isSelected.clear();
    idAds.clear();
  }

  bool hasAds = false;
  void changeHasAds(bool value) {
    hasAds = value;
    notifyListeners();
  }
}
