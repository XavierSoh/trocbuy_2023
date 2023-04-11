import 'package:flutter/foundation.dart';

class PasswordProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool hidePassword = true;
  bool hideNPassword = true;
  bool hideCPassword = true;

  void changeHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  void changeHideNewPassword() {
    hideNPassword = !hideNPassword;
    notifyListeners();
  }

  void changeHideConfirmPassword() {
    hideCPassword = !hideCPassword;
    notifyListeners();
  }

  void changeHidePasswordToFalse() {
    hidePassword = true;
    hideNPassword = true;
    hideCPassword = true;

    notifyListeners();
  }
}
