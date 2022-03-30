import 'package:hive/hive.dart';
part 'transaction_item.g.dart';

@HiveType(typeId: 1)
class TransactionItem {
  @HiveField(0)
  String itemTitle;
  @HiveField(1)
  double amount;
  @HiveField(2)
  bool isExpense;
  TransactionItem(
      {required this.amount, required this.itemTitle, this.isExpense = true});
}
