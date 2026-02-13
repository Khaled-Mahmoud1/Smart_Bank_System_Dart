import 'account.dart';

class CurrentAccount extends Account {
  final double overdraftLimit;

  CurrentAccount(
    String accountNumber,
    String holderName,
    double initialBalance,
    this.overdraftLimit,
  ) : super(accountNumber, holderName, initialBalance);

  @override
  void withdraw(double amount) {
    if (amount <= 0) {
      print("Invalid withdraw amount.");
      return;
    }

    if (amount > balance + overdraftLimit) {
      print("Overdraft limit exceeded.");
    } else {
      updateBalance(balance - amount);
      recordWithdraw(amount);
      print("Withdrawn: $amount");
    }
  }
}
