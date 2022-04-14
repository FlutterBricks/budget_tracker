import 'package:budget_tracker/services/local_storage_service.dart';
import 'package:flutter/material.dart';

import '../model/transaction_item.dart';

class BudgetViewModel extends ChangeNotifier {
  // => BudgetViewModel
  //BudgetViewModel();

  double getBudget() => LocalStorageService().getBudget();

  double getBalance() => LocalStorageService().getBalance();

  // List<TransactionItem> _items = [];

  List<TransactionItem> get items => LocalStorageService().getAllTransactions();

  set budget(double value) {
    LocalStorageService().saveBudget(value);
    notifyListeners();
  }

  void addItem(TransactionItem item) {
    final localStorage = LocalStorageService();
    localStorage.saveTransactionItem(item);
    notifyListeners();
  }

  void deleteItem(TransactionItem item) {
    final localStorage = LocalStorageService();
    // Call our localstorage service to delete the item
    localStorage.deleteTransactionItem(item);
    // Notify the listeners
    notifyListeners();
  }
}

// import 'package:flutter/material.dart';

// import '../model/transaction_item.dart';

// class BudgetViewModel extends ChangeNotifier {
//   double _budget = 2000.0;

//   double get budget => _budget;

//   double balance = 0.0;

//   List<TransactionItem> _items = [];

//   List<TransactionItem> get items => _items;

//   set budget(double value) {
//     _budget = value;
//     notifyListeners();
//   }

//   void addItem(TransactionItem item) {
//     _items.add(item);
//     updateBalance(item);
//     notifyListeners();
//   }

//   void updateBalance(TransactionItem item) {
//     if (item.isExpense) {
//       balance += item.amount;
//     } else {
//       balance -= item.amount;
//     }
//   }
// }
