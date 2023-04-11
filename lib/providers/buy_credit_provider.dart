import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BuyCreditProvider with ChangeNotifier, DiagnosticableTreeMixin {
  double balanceAdded = 0;
  double newBalance = 0;
  double balancePay = 0;
  double currentBalance = 0;
  bool isLoading = true;
  bool hasData = false;
  int indexSelected = -1;
  void changeIndexSelected(int index) {
    indexSelected = index;
    notifyListeners();
  }

  void changeHasData(bool value) {
    hasData = value;
    notifyListeners();
  }

  void changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void updateCurrentBalance(double currentB) {
    currentBalance = currentB;
    notifyListeners();
  }

  void changeNewBalance(double pay , double offert) {
    balanceAdded = pay+offert;
    balancePay = pay ;
    newBalance = balanceAdded + currentBalance;
    notifyListeners();

  }

  void resetBalance() {
    balanceAdded = 0;
    newBalance = 0;
    balancePay = 0;
    currentBalance = 0;
    isLoading = true;
    hasData = false;
    indexSelected = -1;
    notifyListeners();
  }
}
