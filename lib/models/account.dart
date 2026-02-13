import '../interfaces/printable.dart';
import 'transaction.dart';
import '../enums/transaction_type.dart';

abstract class Account implements Printable {
  final String accountNumber;
  String holderName;

  double _balance;

  static int totalAccounts = 0;

  final List<Transaction> _transactions = [];

  Account(this.accountNumber, this.holderName, this._balance) {
    totalAccounts++;
  }

  // Getter
  double get balance => _balance;

  // Protected-like method
  void updateBalance(double newBalance) {
    _balance = newBalance;
  }

  // Deposit
  void deposit(double amount) {
    if (amount > 0) {
      updateBalance(balance + amount);

      _transactions.add(
        Transaction(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          amount: amount,
          type: TransactionType.deposit,
          date: DateTime.now(),
        ),
      );

      print("Deposited: $amount");
    } else {
      print("Invalid deposit amount.");
    }
  }

  // Abstract Withdraw
  void withdraw(double amount);
  // Helper method to record withdraw transactions
  void recordWithdraw(double amount) {
    _transactions.add(
      Transaction(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        amount: amount,
        type: TransactionType.withdraw,
        date: DateTime.now(),
      ),
    );
  }

  void transfer(Account targetAccount, double amount) {
    if (amount <= 0) {
      print("Invalid transfer amount.");
      return;
    }

    double initialBalance = balance;

    withdraw(amount);
    // if the withdraw was successful (balance changed), then proceed with deposit and recording the transfer
    if (balance != initialBalance) {
      targetAccount.deposit(amount);

      _transactions.add(
        Transaction(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          amount: amount,
          type: TransactionType.transfer,
          date: DateTime.now(),
        ),
      );

      print("Transfer of $amount completed successfully.");
    } else {
      print("Transfer failed.");
    }
  }

  @override
  void printDetails() {
    print("Account Number: $accountNumber");
    print("Holder Name: $holderName");
    print("Balance: $balance");
  }

  // display transactions
  void showTransactions() {
    if (_transactions.isEmpty) {
      print("No transactions yet.");
    } else {
      for (var t in _transactions) {
        t.printDetails();
      }
    }
  }
}
