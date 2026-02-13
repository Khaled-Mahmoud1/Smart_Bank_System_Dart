import '../enums/transaction_type.dart';
import '../interfaces/printable.dart';

class Transaction implements Printable {
  final String id;
  final double amount;
  final TransactionType type;
  final DateTime date;

  Transaction({
    required this.id,
    required this.amount,
    required this.type,
    required this.date,
  });

  @override
  void printDetails() {
    print("Transaction ID: $id");
    print("Type: $type");
    print("Amount: $amount");
    print("Date: $date");
    print("================================");
  }
}
