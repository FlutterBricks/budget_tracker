import 'package:budget_tracker/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/transaction_item.dart';

class BudgetService extends ChangeNotifier {
  BudgetService();

  double getBudget() => LocalStorageService().getBudget();

  double getBalance() => LocalStorageService().getBalance();

  // List<TransactionItem> _items = [];

  List<TransactionItem> get items => LocalStorageService().getAllTransactions();

  set budget(double value) {
    LocalStorageService().addBudget(value);
    notifyListeners();
  }

  void addItem(TransactionItem item) {
    final localStorage = LocalStorageService();
    localStorage.saveTransactionItem(item);
    notifyListeners();
  }
}
