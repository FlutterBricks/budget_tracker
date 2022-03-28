import 'package:flutter/material.dart';

class BudgetService extends ChangeNotifier {
  double _budget = 2000.0;

  double get budget => _budget;

  set budget(double value) {
    _budget = value;
    notifyListeners();
  }
}
