import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class MyAdsProvider with ChangeNotifier, DiagnosticableTreeMixin {
  //-----------------------------------------
  bool isLoadingOnline = true;
  void changeIsLoadingOnline(bool value) {
    isLoadingOnline = value;
    notifyListeners();
  }

  bool isLoadingExpired = true;
  void changeIsLoadingExpired(bool value) {
    isLoadingExpired = value;
    notifyListeners();
  }

  //-----------------------------------------
  Response? response;
  void changeResponse(Response _response) {
    response = _response;
    notifyListeners();
  }
}
