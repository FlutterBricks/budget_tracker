class TransactionItem {
  String itemTitle;
  double amount;
  bool isExpense;
  TransactionItem(
      {required this.amount, required this.itemTitle, this.isExpense = true});
}
